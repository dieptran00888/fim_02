class CategoriesController < ApplicationController
  def index
    @search = Category.search params[:q]
  end

  def show
  end
  
end