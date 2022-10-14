require_relative '../music_album/music_album'
require_relative '../genre/genre'

describe MusicAlbum do
  describe '#new' do
    music_album = MusicAlbum.new(1, '28/04/2020', false)
    genre = Genre.new('2', 'Jazz')
    id = '123'
    date = '06/12/2020'
    on_spotify = true

    it 'intializes the music_album correctly' do
      expect(music_album.id).to eq(1)
      expect(music_album.publish_date).to eq('28/04/2020')
      expect(music_album.on_spotify).to eq(false)
    end

    new_music_album = MusicAlbum.new(id, date, on_spotify)
    new_music_album.genre = genre
    it 'checks if the genre was set correctly' do
      expect(new_music_album.genre.id).to eq(genre.id)
    end
  end
end
