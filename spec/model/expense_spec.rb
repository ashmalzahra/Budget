require 'rails_helper'

describe Expense, type: :model do
  user = User.create!(name: 'John', email: "#{Faker::Name.first_name}@test.com", password: 'password',
                      password_confirmation: 'password')
  category = Category.create!(name: "Food #{rand}", icon: 'hospital.png', user: user)
  it 'is valid with a name, amount, author, and at least one category' do
    expense = Expense.new(name: 'Pasta', amount: '14', author: user)
    expect(expense).to be_valid
  end

  it 'is not valid without a name' do
    expense = category.expenses.build(name: '', amount: '14', author: user)
    expect(expense).to_not be_valid
  end

  it 'is not valid without a amount' do
    expense = category.expenses.build(name: 'Pasta', amount: '', author: user)
    expect(expense).to_not be_valid
  end

  it 'is not valid without an author' do
    expense = category.expenses.build(name: 'Pasta', amount: '14', author_id: '')
    expect(expense).to_not be_valid
  end

  it 'is not valid without at least one category' do
    expense = Expense.new(name: 'Pasta', amount: '', author: user)
    expect(expense).to_not be_valid
  end

  describe 'associations' do
    it 'has_many category_expenses' do
      assoc = Expense.reflect_on_association(:category_expenses)
      expect(assoc.macro).to eq :has_many
    end
    it 'has_many categories' do
      assoc = Expense.reflect_on_association(:categories)
      expect(assoc.macro).to eq :has_many
    end
  end
end
