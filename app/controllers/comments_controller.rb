class CommentsController < ApplicationController
  before_action :find_commentable, only: [:create, :new]
  load_resource

  def new
    @comment = Comment.new parent_id: params[:parent_id]
  end

  def create
    @comment.save
    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    respond_to do |format|
      format.js
    end
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
