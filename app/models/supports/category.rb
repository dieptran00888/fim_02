class Supports::Category
  attr_reader :category

  def initialize category
    @category = category
  end

  def parents
    Category.all.map{|category| [category.name, category.id]}
  end

end
