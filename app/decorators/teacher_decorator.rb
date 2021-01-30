class TeacherDecorator < ApplicationDecorator
  delegate_all

  def display_languages
    object.languages.pluck(:name).join(', ')
  end
end
