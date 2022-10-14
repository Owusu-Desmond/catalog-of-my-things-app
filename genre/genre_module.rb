module GenreModule
  def list_genres
    return puts 'No genres found' if @preserve.genres.empty?

    @preserve.genres.each_with_index do |genre, index|
      puts "#{index + 1}) Name: #{genre.name}"
    end
  end
end
