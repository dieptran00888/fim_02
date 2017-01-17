class Supports::SongSupport
  def initialize song
    @song = song
  end

  def comments
    @comments = @song.comments.hash_tree
  end
end
