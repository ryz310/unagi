class Unagi
  attr_reader :seats

  def initialize(seat_count)
    @seats = Array.new(seat_count, 0)
  end

  def seating(people_count, seat_number)
    ((seat_number - 1)...(seat_number + people_count - 1)).each do |n|
      if n < @seats.size
        s = n
      else
        s = n - @seats.size
      end
      return if @seats[s] == 1
    end

    ((seat_number - 1)...(seat_number + people_count - 1)).each do |n|
      if n < @seats.size
        s = n
      else
        s = n - @seats.size
      end
      @seats[s] = 1
    end
  end

  def count
    @seats.select{ |s| s == 1 }.count
  end
end

# ruby の main のようなもの
if __FILE__ == $0
  n, m = gets.split.map(&:to_i)
  unagi = Unagi.new(n)
  m.times do
    a, b = gets.split.map(&:to_i)
    unagi.seating(a, b)
  end

  puts unagi.count
end
