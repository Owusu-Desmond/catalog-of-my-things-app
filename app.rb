require 'json'
require_relative 'game/game'
require_relative 'game/game_module'
require_relative 'author/author'
require_relative 'author/author_module'

# class application
class App
  include GameModule
  include AuthorModule

  def initialize
    @games = load_all_games
    @authors = load_all_authors
  end

  def run
    puts 'Welcome to Catalog my thing'
    loop do
      menu_message
      print 'Enter your option: '
      option = gets.chomp.to_i
      if option == 7
        puts 'Thanks for using the app'
        save_all_games_to_file(@games)
        save_all_authors_to_file(@authors)
        break
      end
      options(option)
    end
  end

  def menu_message
    puts '--------------------------------'
    puts 'Welcome to my catalog app'
    puts '1: This is the first option'
    puts '2: This is the second option'
    puts '3: This is the third option'
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
      puts 'You puts in the first option'
    when 2
      puts 'You puts in the second option'
    when 3
      puts 'You puts in the third option'
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
