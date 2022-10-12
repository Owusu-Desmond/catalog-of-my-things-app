require_relative '../item'
# class for music album
class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(publish_date, label, author, on_spotify)
    super(publish_date)
    @label = label
    @author = author
    @on_spotify = on_spotify
    @music_albums = []
  end

  def can_be_archived?(date)
    super(date) && on_spotify
  end

  def add_music_album
    print 'Enter the label of the music album that you want to add: '
    label = gets.chomp.strip
    print 'Enter the publish date of the music album that you want to add: '
    publish_date = gets.chomp.strip
    print 'Enter the author of the music album that you want to add: '
    author = gets.chomp.strip
    on_spotify = true
    music_album = MusicAlbum.new(label, publish_date, author, on_spotify)
    # if music album exists
    if @music_albums.include?(music_album)
      puts 'Music album already exists'
      add_music_album
    else
      @music_albums << music_album
      puts 'Music album added successfully!'
    end
  end

  def list_music_albums
    # if there is no music ablum
    if @music_albums.empty?
      puts 'There are no available music albums.'
      return
    end
    puts 'All music albums:'
    @music_albums.each_with_index do |music_album, index|
      # print with label, publish date, author, on spotify
      puts "#{index + 1} - [LABEL: #{music_album.label}, AUTHOR: #{music_album.author}]"
      puts "    [PUBLISH DATE: #{music_album.date} ,ON SPOTIFY: #{music_album.on_spotify}]"
    end
  end
end
