class Unagi
  attr_reader :seats

  def seating(seat_number, people_count)
    @seats = [0, 0, 0, 0, 0]

    s = seat_number - 1
    people_count.times do
      @seats[s] = 1
      s += 1
    end
  end
end
