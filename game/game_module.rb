module GameModule

  def read_input(message)
    print "#{message}: "
    gets.chomp
  end

  def add_game
    multiplayer = read_input("Is game multiplayer? [true, false]")
    last_played_at = read_input("Game Last played at [yyyy-mm-dd]")
    publish_date = read_input("Game publish at [yyyy-mm-dd]")

    new_game = Game.new(multiplayer, last_played_at, publish_date)
    save_game(new_game)
    puts "Game has been created successfully"
  end

  def save_game(new_game)
    @games.push({'multiplayer' => new_game.multiplayer, 'last_played_at' => new_game.last_played_at,
      'publish_date' => new_game.publish_date})
  end

  def list_games
    if @games.empty?
      puts "There is no game in the list\n"
    end
    @games.each_with_index do |game, index|
      puts "#{index}) Multiplayer: #{game['multiplayer']} Last played at: #{game['last_played_at']} Published Date: #{game['publish_date']}"
    end
  end

end
