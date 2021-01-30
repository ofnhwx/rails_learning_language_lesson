class Reservation < ApplicationRecord
  belongs_to :lesson
  belongs_to :ticket

  validates :lesson, uniqueness: true
  validates :ticket, uniqueness: true
end
