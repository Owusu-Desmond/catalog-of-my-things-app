require 'date'
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
    it 'return the true for last_played_at' do
      @game.last_played_at.should eql Date.parse('2022-10-11')
    end
  end

  describe '#publish_date' do
    it 'return the true for publish_date' do
      @game.publish_date.should eql '2019-11-11'
    end
  end
end