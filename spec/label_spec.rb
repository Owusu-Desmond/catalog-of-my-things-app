require_relative '../label/label'
require_relative '../item'

describe Label do
  context 'Test the Label class' do
    before :each do
      @curr_label = Label.new('First Label', 'green')
      @curr_item = Item.new('Item')
    end

    it 'should be an instance of the Label class' do
      expect(@curr_label).to be_an_instance_of Label
    end

    it 'from the input data it should return the label title' do
      expect(@curr_label.title).to eq 'First Label'
    end

    it 'from the input data it should return the label color' do
      expect(@curr_label.color).to eq 'green'
    end

    it 'should return an array' do
      expect(@curr_label.items).to be_an_instance_of Array
    end

    it 'should add an item' do
      @curr_label.add_items(@curr_item)
      expect(@curr_label.items.size).to eq(1)
    end
  end
end
