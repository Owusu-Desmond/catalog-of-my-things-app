require 'date'
require_relative '../item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at, publish_date, id=nil, archived: false)
    super(publish_date, id, archived: archived)
    @multiplayer = multiplayer
    @last_played_at = Date.parse(last_played_at)
  end

  def can_be_archived?
    date_diff = Date.today.year - @last_played_at.year
    if super && date_diff > 2
      return true
    else
      return false
    end
  end
end
