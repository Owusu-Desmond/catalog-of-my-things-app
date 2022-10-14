require_relative '../item'
require_relative '../genre/genre'
require_relative '../preserve'
require 'json'

# class for music album
class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(publish_date, id, on_spotify)
    super(id, publish_date)
    @on_spotify = on_spotify
  end

  def can_be_archived?(date)
    super && @on_spotify
  end
end
