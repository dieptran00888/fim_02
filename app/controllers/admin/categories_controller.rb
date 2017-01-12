class Admin::CategoriesController < ApplicationController
  load_and_authorize_resource
  before_action :category_support, only: [:new, :edit]

  def index
    @categories = Category.all
  end

  def new
  end

  def create
    if @category.save
      flash[:success] = t "flash.create_success"
      redirect_to admin_categories_path
    else
      category_support
      flash[:danger] = t "flash.create_failed"
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
      category_support
      flash[:danger] = t "flash.update_failed"
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

  def category_support
    @support = Supports::Category.new @category
  end
end
