require 'date'
# class for Item
class Item
  attr_accessor :publish_date

  def initialize(publish_date, id = nil, archived: flase)
    @id = id || Random.rand(101..1000)
    @publish_date = publish_date
    @archived = archived
  end

  attr_reader :author, :genre, :source, :label

  def author=(author)
    @author = author
    author.items << self unless author.items.include?(self)
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
