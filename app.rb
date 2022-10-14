require 'json'
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
require_relative 'book/book'
require_relative 'book/book_module'
require_relative 'label/label'
require_relative 'preserve/save_module'

class App
  def initialize
    @games = load_all_games
    @authors = load_all_authors
    @preserve = Preserve.new
    @games = []
    @authors = []
    @books = load_items('books')
    @labels = load_items('labels')
  end

  include GameModule
  include AuthorModule
  include MusicAlbumModule
  include GenreModule
  include GameModule
  include AuthorModule
  include BookModule

  def run
    @preserve.load_genre_data
    @preserve.load_music_albums_data
    puts @preserve.music_albums
    puts 'Welcome to Catalog my thing'
    loop do
      menu_message
      print 'Enter your option: '
      option = gets.chomp.to_i
      if option.zero?
        puts 'Thanks for using the app'
        save_all_games_to_file(@games)
        save_all_authors_to_file(@authors)
        @preserve.store_music_album_data
        @preserve.store_genre_data
        save_in_file
        break
      end
      options(option)
    end
  end

  def menu_message
    puts '--------------------------------'
    puts 'Welcome to my catalog app'
    puts '1: List all books'
    puts '2: List all labels'
    puts '3: Add a book'
    puts '4: Add a label'
    puts '5: List all authors'
    puts '6: List of games'
    puts '7: Add a game'
    puts '8: List all genres (e.g \'Comedy\', \'Thriller\')'
    puts '9: List all music albums'
    puts '10: Add a music album'
    puts '0: Exit the application'
    puts '--------------------------------'
  end

  def read_input(message)
    print "#{message}: "
    gets.chomp
  end

  def gather_data
    multiplayer = read_input('Is game multiplayer? [true, false]')
    last_played_at = read_input('Game Last played at [yyyy-mm-dd]')
    publish_date = read_input('Game publish at [yyyy-mm-dd]')
    author_first_name = read_input('Author first name')
    author_last_name = read_input('Author last name')
    puts add_game(multiplayer, last_played_at, publish_date, author_first_name, author_last_name)
  end

  def save_in_file
    save_all_games_to_file(@games)
    save_all_authors_to_file(@authors)
    preserve_items(@books, 'books')
    preserve_items(@labels, 'labels')
  end

  def options(option) # rubocop:disable Metrics/MethodLength, Metrics/CyclomaticComplexity
    case option
    when 1
      list_all_books
    when 2
      list_all_labels
    when 3
      add_book
    when 4
      add_label
    when 5
      list_authors
    when 6
      list_games
    when 7
      gather_data
    when 8
      list_genres
    when 9
      list_music_albums
    when 10
      add_music_album
    else puts 'Invalid option' end
  end

  private

  def load_files
    # @books = load_items('books')
    # @labels = load_items('labels')
  end
end
