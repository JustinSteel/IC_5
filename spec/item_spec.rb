require './lib/item'

RSpec.describe Item do
  describe '#initialize' do
    it 'exists' do
      item1 = Item.new({name: 'Peach', price: "$0.75"})

      expect(item1).to be_an(Item)
    end
  end

  describe '#attributes' do
    it 'has a name in a hash' do
      item1 = Item.new({name: 'Peach', price: "$0.75"})
      item2 = Item.new({name: 'Tomato', price: '$0.50'})

      expect(item1.name).to eq('Peach')
      expect(item2.name).to eq('Tomato')
    end
    
    it 'has a price in a hash' do
      item1 = Item.new({name: 'Peach', price: "$0.75"})
      item2 = Item.new({name: 'Tomato', price: '$0.50'})

      expect(item1.price).to eq("$0.75")
      expect(item2.price).to eq("$0.50")
    end
  end
end