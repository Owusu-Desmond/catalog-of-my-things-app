# class application
class App
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
    puts '4: This is the fourth option'
    puts '5: This is the fifth option'
    puts '6: This is the sixth option'
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
      puts 'You puts in the fourth option'
    when 5
      puts 'You puts in the fifth option'
    when 6
      puts 'You puts in the sisth option'
    else puts 'Invalid option' end
  end
end
