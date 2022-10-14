require_relative '../genre/genre'
require_relative '../music_album/music_album'

describe Genre do
  describe '#new' do
    genre = Genre.new(1, 'Jazz')
    it 'intializes the genres correctly' do
      expect(genre.name).to eq('Jazz')
    end
  end

  describe '#add_item' do
    genre = Genre.new(1, 'Jazz')
    item = MusicAlbum.new(1, '28/04/2020', false)
    genre.add_item(item)
    it 'checks if the genre was set correctly' do
      expect(genre.items[0].id).to eq(item.id)
    end
  end
end
