module GameModule
  def add_game(multiplayer, last_played_at, publish_date, author_first_name, author_last_name)
    author = Author.new(author_first_name, author_last_name)
    new_game = Game.new(multiplayer, last_played_at, publish_date)
    new_game.author = author

    add_author(author)
    @games.push({ 'id' => new_game.id,
                  'multiplayer' => new_game.multiplayer,
                  'last_played_at' => new_game.last_played_at,
                  'publish_date' => new_game.publish_date,
                  'auth_id' => new_game.author.id })

    'Game has been created successfully'
  end

  def list_games
    puts "There is no game in the list\n" if @games.empty?
    @games.each_with_index do |game, index|
      author_full_name = ''
      @authors.each do |author|
        if game['auth_id'] == author['id']
          author_full_name = author['first_name'] + " "+ author['last_name']
        end
      end
      puts "#{index}) ID: #{game['id']} | Multiplayer: #{game['multiplayer']} " \
           "| Last played at: #{game['last_played_at']} | Published Date: #{game['publish_date']} " \
           "| Author: #{author_full_name}"
    end
  end

  def save_all_games_to_file(games)
    file_name = './data/games.json'
    data = []

    games.each do |game|
      data.push({ id: game['id'],
                  multiplayer: game['multiplayer'],
                  last_played_at: game['last_played_at'].strftime('%Y-%m-%d'),
                  publish_date: game['publish_date'],
                  auth_id: game['auth_id'] })
    end

    File.write(file_name, JSON.generate(data))
  end

  def load_all_games
    file_name = './data/games.json'
    data = []

    if File.exist?(file_name) && File.read(file_name) != ''
      file_data = JSON.parse(File.read(file_name))
      file_data.each do |game|
        new_game = Game.new(game['multiplayer'], game['last_played_at'], game['publish_date'], game['id'])
        auth_id = game['auth_id']
        data.push({ 'id' => new_game.id,
                    'multiplayer' => new_game.multiplayer,
                    'last_played_at' => new_game.last_played_at,
                    'publish_date' => new_game.publish_date,
                    'auth_id' => auth_id })
      end
    end

    data
  end
end
