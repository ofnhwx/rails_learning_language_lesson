class Lesson < ApplicationRecord
  belongs_to :teacher
  belongs_to :language

  has_many :reservations

  scope :reservable, -> { left_joins(:reservations).where(reservations: { id: nil }) }
  scope :default_order, -> { order(started_at: :asc, id: :asc) }

  validates :started_at, presence: true, uniqueness: { scope: :teacher }
  validates :zoom_url, presence: true, url: { allow_blank: true }

  before_validation :discard_minutes

  private

  def discard_minutes
    self.started_at = started_at.advance(minutes: -started_at.min)
  end
end
