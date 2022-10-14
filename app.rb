require_relative 'game/game'
require_relative 'game/game_module'
require_relative 'author/author'
require_relative 'author/author_module'
require_relative 'music_album/music_album'
require_relative 'music_album/music_album_module'

require_relative 'genre/genre'
require_relative 'genre/genre_module'
require_relative 'preserve'
require 'securerandom'
# require_relative 'music_album-genre-actions'
# require_relative 'start_preserve_actions'

# class application
class App
  def initialize
    @preserve = Preserve.new
    @games = []
    @authors = []
  end

  include GameModule
  include AuthorModule
  include MusicAlbumModule
  include GenreModule

  def run
    @preserve.load_genre_data
    @preserve.load_music_albums_data
    puts @preserve.music_albums
    puts 'Welcome to Catalog my thing'
    loop do
      menu_message
      print 'Enter your option: '
      option = gets.chomp.to_i
      if option == 7
        @preserve.store_music_album_data
        @preserve.store_genre_data
        puts 'Thanks for using the app'
        break
      end
      options(option)
    end
  end

  def menu_message
    puts '--------------------------------'
    puts 'Welcome to my catalog app'
    puts '1: List all genres (e.g \'Comedy\', \'Thriller\')'
    puts '2: List all music albums'
    puts '3: Add a music album'
    puts '4: List all authors'
    puts '5: List of games'
    puts '6: Add a game'
    puts '7: Exit the application'
    puts '--------------------------------'
  end

  def read_input(message)
    print "#{message}: "
    gets.chomp
  end

  def options(option)
    case option
    when 1
      list_genres
    when 2
      list_music_albums
    when 3
      add_music_album
    when 4
      puts list_authors
    when 5
      list_games
    when 6
      multiplayer = read_input('Is game multiplayer? [true, false]')
      last_played_at = read_input('Game Last played at [yyyy-mm-dd]')
      publish_date = read_input('Game publish at [yyyy-mm-dd]')
      author_first_name = read_input('Author first name')
      author_last_name = read_input('Author last name')
      puts add_game(multiplayer, last_played_at, publish_date, author_first_name, author_last_name)
    else puts 'Invalid option' end
  end
end
