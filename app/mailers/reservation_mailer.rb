class ReservationMailer < ApplicationMailer
  def notify_to_user(reservation)
    @reservation = reservation
    mail(to: reservation.user.email, subject: 'Online Language Lesson: レッスンを予約しました')
  end

  def notify_to_teacher(reservation)
    @reservation = reservation
    mail(to: reservation.teacher.email, subject: 'Online Language Lesson: レッスンを予約しました')
  end
end
