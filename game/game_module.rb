module GameModule
  def read_input(message)
    print "#{message}: "
    gets.chomp
  end

  def add_game
    # multiplayer = read_input('Is game multiplayer? [true, false]')
    # last_played_at = read_input('Game Last played at [yyyy-mm-dd]')
    # publish_date = read_input('Game publish at [yyyy-mm-dd]')

    # author_first_name = read_input('Author first name')
    # author_last_name = read_input('Author last name')

    # author = Author.new(author_first_name, author_last_name)
    # new_game = Game.new(multiplayer, last_played_at, publish_date)
    author = Author.new('Mark', 'Taylor')
    new_game = Game.new(true, '2022-05-06', '2019-04-04')
    new_game.author = author

    add_author(author)
    save_game(new_game)
    puts 'Game has been created successfully'
  end

  def save_game(new_game)
    @games.push({ 'multiplayer' => new_game.multiplayer, 'last_played_at' => new_game.last_played_at,
                  'publish_date' => new_game.publish_date })
  end

  def list_games
    puts "There is no game in the list\n" if @games.empty?
    @games.each_with_index do |game, index|
      puts "#{index}) Multiplayer: #{game['multiplayer']} Last played at: #{game['last_played_at']} " \
           "Published Date: #{game['publish_date']}"
    end
  end

  def save_all_games_to_file(games)
    file_name = './data/games.json'
    data = []

    games.each do |game|
      data.push({multiplayer: game['multiplayer'], last_played_at: game['last_played_at'].strftime("%Y-%m-%d"), publish_date: game['publish_date']})
    end

    File.write(file_name, JSON.generate(data))
  end

  def load_all_games
    file_name = './data/games.json'
    data = []

    if File.exist?(file_name) && File.read(file_name) != ''
      file_data = JSON.parse(File.read(file_name))
      file_data.each do |game|
        new_game = Game.new(game['multiplayer'], game['last_played_at'], game['publish_date'])
        data.push({ 'multiplayer' => new_game.multiplayer, 'last_played_at' => new_game.last_played_at,
                    'publish_date' => new_game.publish_date })
      end
    end

    return data
  end
end
