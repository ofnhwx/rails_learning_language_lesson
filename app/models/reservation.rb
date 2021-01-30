class Reservation < ApplicationRecord
  belongs_to :lesson
  belongs_to :ticket
  has_one :teacher, through: :lesson
  has_one :order, through: :ticket
  has_one :user, through: :order

  validates :lesson, uniqueness: true
  validates :ticket, uniqueness: true
end
