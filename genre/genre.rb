require_relative 'item'

class Genre < Item
    attr_accessor :name

    def initialize(id, name)
        super(id, nil, nil)
        @name = name
        @items = []
    end

    def add_item(item)
        @items << item
        item.add_genre(self)
        puts "Item #{item} has been added successfully with this genre!"
    end

    def list_genre
        if @items.empty?
            puts "There is no available items with this genre."
            return
        end
        puts "All available genres:"
        @items.each_with_index {|item, index| puts "#{index + 1}. #{item} - #{item.genre}}
    end
end