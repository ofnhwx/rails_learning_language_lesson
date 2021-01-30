class Ticket < ApplicationRecord
  belongs_to :order

  has_one :reservation
end
