require_relative 'game/game'
require_relative 'game/game_module'
require_relative 'author/author'
require_relative 'author/author_module'
require_relative 'book/book'
require_relative 'book/book_module'
require_relative 'label/label'

# class application
class App
  def initialize
    @games = []
    @authors = []
    @books = []
    @labels = []
  end

  include GameModule
  include AuthorModule
  include BookModule

  def run
    puts 'Welcome to Catalog my thing'
    loop do
      menu_message
      print 'Enter your option: '
      option = gets.chomp.to_i
      if option == 8
        puts 'Thanks for using the app'
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
    puts '8: Exit the application'
    puts '--------------------------------'
  end

  def options(option)
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
      add_game
    end
  end
end
