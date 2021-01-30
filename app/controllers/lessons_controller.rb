class LessonsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @lessons = Lesson.reservable.default_order
  end

  def reserved
    @lessons = current_user.lessons.default_order
    render :index
  end
end
