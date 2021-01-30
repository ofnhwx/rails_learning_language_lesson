class Lesson < ApplicationRecord
  belongs_to :teacher
  belongs_to :language

  has_many :reservations

  scope :default_order, -> { order(started_at: :asc, id: :asc) }

  validates :started_at, presence: true, uniqueness: { scope: :teacher }
  validates :zoom_url, presence: true
end
