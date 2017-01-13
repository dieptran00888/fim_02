class Admin::CategoriesController < ApplicationController
  load_and_authorize_resource

  def index
    @categories = Category.hash_tree
  end

  def new
    @category = Category.new parent_id: params[:parent_id]
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = t "flash.create_success"
      redirect_to admin_categories_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update_attributes category_params
      flash[:success] = t "flash.update_success"
      redirect_to admin_categories_path
    else
      render :edit
    end
  end

  def destroy
    if @category.destroy
      flash[:success] = t "flash.destroy_success"
    else
      flash[:danger] = t "flash.destroy_failed"
    end
    redirect_to admin_categories_path
  end

  private
  def category_params
    params.require(:category).permit :name, :parent_id
  end
end
