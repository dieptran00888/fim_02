class MarksController < ApplicationController
  before_action :load_mark, only: :update
 
  def new
    @mark = Mark.new
  end
  
  def create
    @mark = Mark.new mark_params
    unless @mark.save
      flash[:danger] = t "marks.create.error"
      render :new
    end
  end
 
  def update
    if params[:favorite]
      @mark.is_favorite = params[:favorite]
      @mark.save
      respond_to do |format|
        format.html
        format.json {
          render json: {mark: @mark}
        }
      end
    end
  end

  private
  def load_mark
    @mark = Mark.find_by id: params[:id]
    unless @mark
      flash[:danger] = t "marks.update.not_found"
      redirect_to :back
    end
  end
end
