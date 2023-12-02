# frozen_string_literal: true

file = File.open('data_part_1.txt')

file_data = file.readlines.map(&:chomp)

fixed_list = file_data.map do |data|
  only_num = data.delete('^0-9')

  if only_num.length > 1
    (only_num[0] + only_num.reverse[0]).to_i
  else
    (only_num + only_num).to_i
  end
end

puts fixed_list.sum
