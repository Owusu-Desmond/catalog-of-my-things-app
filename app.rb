require_relative 'game/game'
require_relative 'game/game_module'

# class application
class App
  def initialize
    @games = []
  end

  include GameModule

  def run
    puts 'Welcome to Catalog my thing'
    loop do
      menu_message
      print 'Enter your option: '
      option = gets.chomp.to_i
      if option == 7
        puts 'Thanks for using the app'
        break
      end
      options(option)
    end
  end

  def menu_message
    puts 'Welcome to my catalog app'
    puts '1: This is the first option'
    puts '2: This is the second option'
    puts '3: This is the third option'
    puts '4: List all authors'
    puts '5: List of games'
    puts '6: Add a game'
    puts '7: Exit the application'
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
      puts 'You puts in the list all authors option'
    when 5
      list_games
    when 6
      add_game
    else puts 'Invalid option' end
  end
end
