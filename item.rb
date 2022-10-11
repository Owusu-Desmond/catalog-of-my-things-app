require 'date'
# class for Item
class Item
  attr_accessor :publish_date, :genre, :author, :source, :label

  def initialize(id, publish_date, archived)
    @id = id
    @publish_date = publish_date
    @archived = archived
  end

  def add_genre(genre)
    @genre = genre
  end

  def add_author(author)
    @author = author
  end

  def add_source(source)
    @source = source
  end

  def add_label(label)
    @label = label
  end

  private

  def can_be_archived(date)
    date = Date.parse(date).year
    data_now = Date.today.year
    (data_now - date) > 10
  end

  def move_to_archive
    if can_be_achieved
      true
    else
      false
    end
  end
end
