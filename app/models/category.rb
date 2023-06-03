class Category < ApplicationRecord
  validates :name, presence: true
  validates :icon, presence: true

  belongs_to :user
  has_many :category_expenses, dependent: :destroy
  has_many :expenses, through: :category_expenses, dependent: :destroy
end
