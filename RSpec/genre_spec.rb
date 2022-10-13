require_relative '../genre/genre'
require_relative '../item'

describe Genre do
  describe '#new' do
    genre = Genre.new(1, 'Jazz')
    it 'intializes the genres correctly' do
      expect(genre.name).to eq('Jazz')
    end
  end

  describe '#add_item' do
    genre = Genre.new(1, 'Jazz')
    item = Item.new('25/08/2010', 1)
    genre.add_item(item)
    it 'checks if the item was added successfuly' do
      expect(genre.list_genre.size).to eq(2)
    end
  end

  describe '#list_genre' do
    genre = Genre.new(1, 'Jazz')
    item = Item.new(genre, '27/07/2020', archived: false)
    item2 = Item.new(genre, '25/08/2010', archived: false)
    genre.add_item(item)
    genre.add_item(item2)
    it 'Lists all the items in that genre, returns an error if there are none' do
      expect(genre.list_genre.size).to eq(4)
    end
  end
end