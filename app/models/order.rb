class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product, optional: true

  has_many :tickets

  validates :caption, presence: true
  validates :price, presence: true
end
