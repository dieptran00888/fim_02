class CategoriesController < ApplicationController
  load_resource

  def index
    @search = Category.search params[:q]
    @categories = @search.result
  end

end
