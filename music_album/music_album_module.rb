module MusicAlbumModule
  def add_music_album
    puts 'Please provide all information bellow.'
    print 'Is the music album on spotify? (Y/n): '
    answer = gets.chomp.downcase
    on_spotify = answer.eql?('y')
    puts 'Enter the publish date for music album'
    publish_date = gets.chomp
    puts 'Provide information about the genre of the music album bellow'
    puts 'Enter name of the genre:'
    name = gets.chomp
    music_album = MusicAlbum.new(SecureRandom.uuid, publish_date, on_spotify)
    genre = Genre.new(SecureRandom.uuid, name)
    genre.add_item(music_album)
    @preserve.music_albums << music_album
    @preserve.genres << genre
    music_album.genre = genre
    puts 'Music album has been successfully added!'
  end

  def list_music_albums
    return puts 'No music albums found' if @preserve.music_albums.empty?

    @preserve.music_albums.each_with_index do |music_album, index|
      print "#{index + 1}) Genre: #{music_album.genre.name}, On spotify: #{music_album.on_spotify}"
      puts " Publish date: #{music_album.publish_date}"
    end
  end
end
