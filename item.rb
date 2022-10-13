require 'date'
# class for Item
class Item
  attr_accessor :publish_date
  attr_reader :id, :author, :genre, :source, :label

  def initialize(publish_date, id = nil, archived: false)
    @id = id || Random.rand(101..1000)
    @publish_date = publish_date
    @archived = archived
  end


  def author=(author)
    @author = author
    author.items << self unless author.items.include?(self)
  end

  def label=(label)
    @label = label
    label.items << self unless author.items.include?(self)
  end

  def source=(source)
    @source = source
    source.items << self unless source.items.include?(source)
  end

  def genre=(genre)
    @genre = genre
    genre.items << self unless genre.items.include?(genre)
  end

  private

  def can_be_archived?(date)
    date = Date.parse(date).year
    data_now = Date.today.year
    (data_now - date) > 10
  end

  def move_to_archive
    can_be_archived?
  end
end
