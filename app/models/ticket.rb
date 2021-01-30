class Ticket < ApplicationRecord
  belongs_to :order

  has_one :reservation

  scope :available, -> { left_joins(:reservation).where(reservation: { id: nil }) }
end
