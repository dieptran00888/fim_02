module LyricsHelper
  def status_field lyric
    case lyric.status
    when "approved"
      label :status, t("helper.approved"),
        class: "label label-success"
    else
      label :status, t("helper.pending"),
        class: "label label-info"
    end
  end
end
