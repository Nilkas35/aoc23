# frozen_string_literal: true

file = File.open('data_part_1.txt')

file_data = file.readlines.map(&:chomp)

fixed_list = file_data.map do |data|
  only_num = data.split(':')[1]
                 .split('|')
                 .map { |num| num.split(' ') }

  winning_nummers = []

  only_num[0].map do |num|
    winning_nummers << num if only_num[1].include?(num)
  end

  if winning_nummers.size == 0
    0
  elsif winning_nummers.size == 1
    1
  else
    2 ** (winning_nummers.size - 1)
  end
end

print "fixed_list: #{fixed_list.sum}\n"
