class CommentsController < ApplicationController
  before_action :find_commentable, only: [:create, :new]
  load_resource

  def new
    @comment = Comment.new parent_id: params[:parent_id]
  end

  def create
    @comment = @commentable.comments.build comment_params
    if @comment.save
      flash.now[:success] = t "flash.create_success"
    else
      flash[:danger] = @comment.errors.full_messages.join("/ ")
    end
    redirect_to @commentable
  end

  def destroy
    @comment.destroy
    flash[:success] = t "flash.destroy_success"
    redirect_to :back
  end

  private
  def comment_params
    params.require(:comment).permit :content, :user_id, :parent_id
  end

  def find_commentable
    resource, id = request.path.split("/")[1, 2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end
end
