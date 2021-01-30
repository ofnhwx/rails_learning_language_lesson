class LessonsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @lessons = Lesson.reservable.default_order
  end
end
