require_relative 'item'
class MusicAlbum < Item
    attr_accessor :on_spotify, :music_albums

    def initialize(on_spotify)
        @on_spotify = on_spotify
        @music_albums = []
    end

    def can_be_archived?(date)
        super(date) && on_spotify
    end

    def add_music_album(music_album)
        @music_albums << music_album
        puts "Music album #{music_album} has been added successfully!"
    end

    def list_music_albums
        # if there is no music ablum
        if @music_albums.empty?
            puts "There are no available music albums."
            return
        end
        puts "All music albums:"
        @music_albums.each_with_index {|music_album, index| puts "#{index + 1}. #{music_album}"}
    end
end

