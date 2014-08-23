module BookingsHelper
  def booking_period
    distance_of_time_in_words(booking.date_from, booking.date_to)
  end
end
