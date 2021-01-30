class Lesson < ApplicationRecord
  belongs_to :teacher
  belongs_to :language

  has_many :reservations

  validates :started_at, presence: true, uniqueness: { scope: :teacher }
  validates :zoom_url, presence: true
end
