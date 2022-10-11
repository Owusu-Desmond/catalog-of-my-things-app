class Label
  attr_accessor :title, :color
  attr_reader :items

  def initialize(title, color)
    @id = Random.rand(1...10_000)
    @title = title
    @color = color
    @items = []
  end

  def add_items(item)
    item.Label = self
    @items << item
  end
end
