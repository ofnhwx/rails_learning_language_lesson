class LessonsController < ApplicationController
  def index
    @lessons = Lesson.reservable.default_order
  end
end
