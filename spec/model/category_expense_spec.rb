require 'rails_helper'

describe CategoryExpense, type: :model do
  describe 'associations' do
    it 'belongs_to category' do
      assoc = CategoryExpense.reflect_on_association(:category)
      expect(assoc.macro).to eq :belongs_to
    end
    it 'belongs_to expense' do
      assoc = CategoryExpense.reflect_on_association(:expense)
      expect(assoc.macro).to eq :belongs_to
    end
  end
end
