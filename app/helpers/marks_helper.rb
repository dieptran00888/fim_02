module MarksHelper

  def btn_favorite
    link_to t("marks.unfavorite"), mark_path(@mark, favorite: false),
      method: :put, id: "btn-mark", class: "btn btn-default", remote: true
  end

  def btn_unfavorite
    link_to t("marks.fravorite"), mark_path(@mark, favorite: true),
      method: :put, id: "btn-mark", class: "btn btn-default", remote: true
  end
end
