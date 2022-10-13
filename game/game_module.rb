module GameModule
  def add_game(multiplayer, last_played_at, publish_date, author_first_name, author_last_name)
    author = Author.new(author_first_name, author_last_name)
    new_game = Game.new(multiplayer, last_played_at, publish_date)
    new_game.author = author

    add_author(author)
    @games.push({ 'multiplayer' => new_game.multiplayer, 'last_played_at' => new_game.last_played_at,
                  'publish_date' => new_game.publish_date })
    'Game has been created successfully'
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
      data.push({ multiplayer: game['multiplayer'], last_played_at: game['last_played_at'].strftime('%Y-%m-%d'),
                  publish_date: game['publish_date'] })
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

    data
  end
end
