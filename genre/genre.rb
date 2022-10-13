require_relative '../item'

# class for genre
class Genre < Item
  attr_accessor :name, :items

  def initialize(id, name, publish_date = nil, archived: false)
    super(publish_date, id, archived: archived)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.genre = self
    puts "Item #{item} has been added successfully with this genre!"
  end

  def list_genre
    if @items.empty?
      puts 'There is no available items with this genre.'
      return
    end
    puts 'All available items with current genre:'
    @items.each_with_index do |item, index|
      puts "#{index + 1} - ITEM-GENRE: #{item.genre.name}, ITEM-ID: #{item.id} "
    end
  end
end
