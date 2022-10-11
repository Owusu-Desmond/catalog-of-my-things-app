require 'date'
require_relative '../item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at)
    @multiplayer = multiplayer
    @last_played_at = Date.parse(last_played_at)
  end
end
