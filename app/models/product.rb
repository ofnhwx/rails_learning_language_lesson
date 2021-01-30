class Product < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true
  validates :amount, presence: true

  scope :default_order, -> { order(id: :asc) }

  def price_with_tax
    (price * 1.10).ceil
  end
end
