module Admin::CategoriesHelper
  def category_hierarchy categories
    categories.map do |category, sub_category|
      render(category) +
        (sub_category.any? ? content_tag(:div, category_hierarchy(sub_category),
            class: "sub-category") : nil)
    end.join.html_safe
  end
end
