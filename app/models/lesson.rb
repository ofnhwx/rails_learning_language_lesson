class Lesson < ApplicationRecord
  belongs_to :teacher
  belongs_to :language

  has_one :reservation

  scope :reserved, -> { left_joins(:reservation).where.not(reservation: { id: nil }) }
  scope :reservable, -> { left_joins(:reservation).where(reservation: { id: nil }) }
  scope :default_order, -> { order(started_at: :asc, id: :asc) }

  validates :started_at, presence: true, uniqueness: { scope: :teacher }
  validates :zoom_url, presence: true, url: { allow_blank: true }

  before_validation :discard_minutes

  def started?
    started_at > DateTime.current
  end

  def finished?
    started_at.advance(hours: 1) > DateTime.current
  end

  private

  def discard_minutes
    self.started_at = started_at.advance(minutes: -started_at.min)
  end
end
