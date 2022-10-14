require_relative '../book/book'

describe Book do
  context 'Test the Book class' do
    before :each do
      @curr_book = Book.new('Test Author', '2022/10/13', 'good')
    end

    it 'should be an instance of the Book class' do
      expect(@curr_book).to be_an_instance_of Book
    end

    it 'from the input data for book return its publisher' do
      expect(@curr_book.publisher).to eq 'Test Author'
    end

    it 'from the input data for book return the state of its cover ' do
      expect(@curr_book.cover_state).to eq 'good'
    end

    it 'should return false unless @archived || cover_state == bad' do
      expect(@curr_book.can_be_archived?).to eq false
    end
  end
end
