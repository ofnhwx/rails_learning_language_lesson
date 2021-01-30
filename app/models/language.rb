class Language < ApplicationRecord
  validates :label, presence: true, uniqueness: true
end
