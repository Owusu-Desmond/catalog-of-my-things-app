require_relative '../item'
require 'securerandom'
# class for genre
class Genre
  attr_reader :id, :name
  attr_accessor :items

  def initialize(id, name)
    @id = id || SecureRandom.uuid
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.genre = self
  end
end
