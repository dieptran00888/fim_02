class Supports::AlbumSupport
  attr_reader :album

  def initialize album
    @album = album
  end

  def singers
    @singers ||= Artist.singer.pluck(:name, :id).to_h
  end

  def composers
    @composers ||= Artist.composer.pluck(:name, :id).to_h
  end

  def categories
    @categories ||= Category.pluck(:name, :id).to_h
  end

  def comments
    @comments = @album.comments.hash_tree
  end
end
