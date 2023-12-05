# frozen_string_literal: true

scratches = []

def count_wins(winning_numbers, guessing_numbers)
  winning_nummers = []

  winning_numbers.each do |num|
    winning_nummers << 1 if guessing_numbers.include?(num)
  end

  winning_nummers
end

file = File.open('data_part_1.txt')
file_data = file.readlines.map(&:chomp)

fixed_list = file_data.map do |data|
  only_num = data.split(':')[1]
                 .split('|')
                 .map { |num| num.split(' ') }

  count_wins(only_num[0], only_num[1])
end

fixed_list.each { |d| scratches << [1] }

scratches.each_with_index do |data, index|
  data.each do |_num|
    for i in 1..fixed_list[index].size
      scratches[index + i] << 1
    end
  end
end

scratches.each { |data| print "data: #{data}\n" }

print "scratches: #{scratches.flatten.count}\n"
