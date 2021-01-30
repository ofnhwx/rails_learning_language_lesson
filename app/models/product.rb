class Product < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true
  validates :amount, presence: true
end
