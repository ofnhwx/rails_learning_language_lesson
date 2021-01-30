class Teacher < ApplicationRecord
  devise :database_authenticatable, :recoverable, :rememberable, :validatable

  has_many :lessons
  has_many :reservations, through: :lessons
  has_many :teacher_languages
  has_many :languages, through: :teacher_languages

  has_one_attached :image

  scope :default_order, -> { order(name: :asc, id: :asc) }

  validates :name, presence: true
  validates :language_ids, presence: true
end
