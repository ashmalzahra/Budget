require 'rails_helper'

describe Category, type: :model do
  it 'is valid with a name and icon' do
    category = Category.new(name: "Food #{rand}", icon: 'other.png')
    expect(category).to be_valid
  end

  it 'is not valid without a name' do
    category = Category.new(name: '', icon: 'other.png')
    expect(category).to_not be_valid
  end

  it 'is not valid without a icon' do
    category = Category.new(name: "Food #{rand}", icon: '')
    expect(category).to_not be_valid
  end

  describe 'associations' do
    it 'has_many category_expenses' do
        assoc = Category.reflect_on_association(:category_expenses)
        expect(assoc.macro).to eq :has_many
      end
      it 'has_many expenses' do
        assoc = Category.reflect_on_association(:expenses)
        expect(assoc.macro).to eq :has_many
      end
  end
end