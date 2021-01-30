# Preview all emails at http://localhost:3000/rails/mailers/reservation
class ReservationPreview < ActionMailer::Preview
  def notify_to_user
    ReservationMailer.notify_to_user(Reservation.first)
  end

  def notify_to_teacher
    ReservationMailer.notify_to_teacher(Reservation.first)
  end
end
