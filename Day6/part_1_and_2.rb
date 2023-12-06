# frozen_string_literal: true

# Time:        40     82     84     92
# Distance:   233   1011   1110   1487

distance_1 = 233
distance_2 = 1011
distance_3 = 1110
distance_4 = 1487

time_1 = 40
time_2 = 82
time_3 = 84
time_4 = 92

races = [[distance_1, time_1], [distance_2, time_2], [distance_3, time_3], [distance_4, time_4]]

# Time:        40828492
# Distance:   233101111101487

races_sum = races.map do |race|
  sum = []

  for i in 0..race[1]
    hold_time = i
    move_time = race[1] - i
    sum << 1 if hold_time * move_time > race[0]
  end
  sum.sum
end

multi_sum = races_sum.inject(:*)

print "Sum: #{multi_sum}\n"

sum = []

for i in 0..40828492
  hold_time = i
  move_time = 40828492 - i
  sum << 1 if hold_time * move_time > 233101111101487
end
print "Part 2: #{sum.sum}\n"
