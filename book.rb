require 'item'

class Book < Item
  def initialize(publisher, :publish_date, cover_state = '')
    super(publish_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    cover_state == 'bad' || super
  end
end
