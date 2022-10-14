require_relative 'music_album/music_album'
require_relative 'genre/genre'
class Preserve
  attr_accessor :music_albums, :genres

  def initialize
    @music_albums = []
    @genres = []
  end

  def load_genre_data
    return unless File.exist?('./data/genres.json')
    genres = JSON.parse(File.read('./data/genres.json'))
    genres.each do |genre|
      new_genre = Genre.new(genre['id'], genre['name'])
      @genres << new_genre
    end
  end

  def load_music_albums_data
    return unless File.exist?('./data/music_albums.json')
    music_albums = JSON.parse(File.read('./data/music_albums.json'))
    music_albums.each_with_index do |music_album, index|
      new_music_album = MusicAlbum.new(music_album['id'], music_album['publish_date'], music_album['on_spotify'])
      # use the increased index to grab genre for music album
      puts @genres.size
      new_music_album.genre = @genres[index]
      @music_albums << new_music_album
    end
  end

  def store_music_album_data
    data = []
    @music_albums.each do |music_album|
      data.push({ id: music_album.id,
                  publish_date: music_album.publish_date,
                  on_spotify: music_album.on_spotify,
                  genre_id: music_album.genre.id })
    end
    File.write('./data/music_albums.json', JSON.pretty_generate(data))
  end

  def store_genre_data
    data = []
    @genres.each do |genre|
      data.push({ id: genre.id,
                  name: genre.name })
    end
    File.write('./data/genres.json', JSON.pretty_generate(data))
  end
end
