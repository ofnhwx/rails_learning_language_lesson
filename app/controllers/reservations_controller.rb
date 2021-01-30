class ReservationsController < ApplicationController
  before_action :set_lesson
  before_action :set_ticket
  before_action :require_ticket

  def create
    @lesson.create_reservation!(ticket: @ticket)
    redirect_to root_path, notice: 'レッスンを予約しました'
  end

  private

  def set_lesson
    @lesson = Lesson.reservable.find(params[:lesson_id])
  end

  def set_ticket
    @ticket = current_user.tickets.available.first
  end

  def require_ticket
    redirect_back fallback_location: root_path, alert: '使用できるチケットがありません' unless @ticket
  end
end
