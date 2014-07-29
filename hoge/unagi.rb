class Unagi
  attr_reader :seats

  def initialize(seat_count)
    @seats = Array.new(seat_count, 0)
  end

  def seating(seat_number, people_count)
    s = seat_number - 1
    people_count.times do
      return if @seats[s] == 1
      s += 1
      s = 0 if @seats.size <= s
    end

    s = seat_number - 1
    people_count.times do
      @seats[s] = 1
      s += 1
      s = 0 if @seats.size <= s
    end
  end

  def count
    @seats.select{ |s| s == 1 }.count
  end
end

if __FILE__ == $0
  seat_count, group_count = gets.split.map(&:to_i)
  unagi = Unagi.new(seat_count)
  group_count.times do
    people_count, seat_number = gets.split.map(&:to_i)
    unagi.seating(seat_number, people_count)
  end
  puts unagi.count
end
