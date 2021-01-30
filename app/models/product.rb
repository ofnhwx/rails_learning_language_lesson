class Product < ApplicationRecord
  validates :label, presence: true, uniqueness: true
  validates :price, presence: true
  validates :amount, presence: true
end
