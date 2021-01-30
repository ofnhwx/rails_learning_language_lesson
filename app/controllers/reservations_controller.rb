class ReservationsController < ApplicationController
  before_action :set_lesson
  before_action :set_ticket
  before_action :require_ticket

  def create
    reservation = @lesson.create_reservation!(ticket: @ticket)
    ReservationMailer.notify_to_user(reservation).deliver_later
    ReservationMailer.notify_to_teacher(reservation).deliver_later
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
