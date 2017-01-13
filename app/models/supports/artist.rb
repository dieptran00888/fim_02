class Supports::Artist
  attr_reader :artist

  def initialize params = {}
  end

  def type_of_musics
    @type_of_musics ||= Artist.type_of_musics.keys
  end

  def artist_types
    @artist_types ||= Artist.artist_types.keys
  end
end
