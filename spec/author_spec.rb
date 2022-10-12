require 'date'
require_relative 'spec_helper'

describe Author do
  before :each do
    @author = Author.new('George', 'Wilkinson')
  end

  describe '#new' do
    it 'takes two parameters and return author object' do
      expect(@author).to be_an_instance_of Author
    end
  end

  describe '#first_name' do
    it 'return the first name of the Author' do
      @author.first_name.should eql 'George'
    end
  end

  describe '#last_name' do
    it 'return the last name of the Author' do
      @author.last_name.should eql 'Wilkinson'
    end
  end

  describe '#items' do
    it 'return the empty list of items' do
      @author.items.should eql []
    end
  end

  describe '#add_item' do
    it 'return the length list of items' do
      game = Game.new(true, '2022-10-11', '2019-11-11')
      @author.add_item(game)
      expect(@author.items.size).to eq(1)
    end
  end

  describe AuthorModule do
    it 'returns author object' do
      dc = App.new
      expect(dc.add_author(@author)).to eq([{"first_name"=>"George", "last_name"=>"Wilkinson"}])
    end
  end

  describe AuthorModule do
    it 'Number of item in list the author equal to 1' do
      dc = App.new
      dc.add_author(@author)
      expect(dc.list_authors.size).to eq(1)
    end
  end

end
