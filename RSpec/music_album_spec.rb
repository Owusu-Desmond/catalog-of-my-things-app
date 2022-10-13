require_relative '../music_album/music_album'

describe MusicAlbum do
  describe '#new' do
    music_album = MusicAlbum.new('25/08/2020', 'Pony Music', 'Bubble and Gorillaz', true)
    it 'returns true if music album is from spotify' do
      expect(music_album.on_spotify).to eq(true)
    end

    it 'Music album can be archived or not' do
      date1 = '2005-04-15'
      expect(music_album.can_be_archived?(date1)).to eq(true)
      date2 = '2015-04-15'
      expect(music_album.can_be_archived?(date2)).to eq(false)
      date3 = '2010-04-15'
      expect(music_album.can_be_archived?(date3)).to eq(true)
    end

    it 'Adding a new music album' do
      music_album.add_music_album(MusicAlbum.new('25/08/2010', 'Victory Music', 'Beethoven', true))
      expect(music_album.list_music_albums.size).to eq(1)
      expect(music_album.list_music_albums[0]).to be_instance_of(MusicAlbum)
    end

    it 'List music albums' do
      music_album.add_music_album(MusicAlbum.new('25/08/2020', 'Universal Music', 'Bruce Lee', true))
      music_album.add_music_album(MusicAlbum.new('25/08/2018', 'Sunny Music', 'Madonna', true))
      expect(music_album.list_music_albums.length).to eq(3)
    end
  end
end
