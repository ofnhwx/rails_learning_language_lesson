class TeacherLanguage < ApplicationRecord
  belongs_to :teacher
  belongs_to :language

  validates :language, uniqueness: { scope: :teacher }
end
