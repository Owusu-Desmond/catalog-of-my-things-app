require 'date'
require 'stringio'
require_relative 'spec_helper'

describe Game do
  before :each do
    @game = Game.new(true, '2022-10-11', '2019-11-11')
  end

  describe '#new' do
    it 'takes three parameters and return game object' do
      expect(@game).to be_an_instance_of Game
    end
  end

  describe '#multiplayer' do
    it 'return the true for multiplayer' do
      @game.multiplayer.should eql true
    end
  end

  describe '#last_played_at' do
    it 'return the date for last_played_at' do
      @game.last_played_at.should eql Date.parse('2022-10-11')
    end
  end

  describe '#publish_date' do
    it 'return the publish_date' do
      @game.publish_date.should eql '2019-11-11'
    end
  end

  describe GameModule do
    it 'add new game to the game list' do
      dc = App.new
      puts @games
      expect(dc.add_game('true', '2021-07-07', '2011-04-04', 'Mike',
                         'Atherton')).to eq('Game has been created successfully')
    end
  end

  describe GameModule do
    it 'Number of item in list the games equal to 1' do
      dc = App.new
      length = dc.list_games.size
      dc.add_game('true', '2021-07-07', '2011-04-04', 'Mike', 'Atherton')
      expect(dc.list_games.size).to eq(length + 1)
    end
  end
end
