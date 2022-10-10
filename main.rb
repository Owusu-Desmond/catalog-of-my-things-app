# frozen_string_literal: true

require 'date'
# class for the main app to start the app
class Main
  def menu_message
    puts 'Welcome to my catalog app'
    puts '1: This is the first option'
    puts '2: This is the second option'
    puts '3: This is the third option'
    puts '4: This is the fourth option'
    puts '5: This is the fifth option'
    puts '6: This is the sisth option'
    puts '7 Exit'
  end

  def display_menu # disable : Metrics/MethodLength
    menu_message
    option = gets.chomp.to_i
    case option
    when 1
      puts 'You puts in the first option'
    when 2
      puts 'You puts in the second option'
    when 3
      puts 'You puts in the third option'
    when 4
      puts 'You puts in the fourth option'
    when 5
      puts 'You puts in the fifth option'
    when 6
      puts 'You puts in the sisth option'
    when 7
      puts 'You ended the application'
      exit
    else puts 'Invalid option' end
    display_menu
  end
end

Main.new.display_menu
