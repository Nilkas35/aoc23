# frozen_string_literal: true

file = File.open('data_part_2.txt')

file_data = file.readlines.map(&:chomp)

fixed_list = file_data.map do |data|
  string_chaos = data.gsub('one', 'on1ne')
                     .gsub('two', 'tw2wo')
                     .gsub('three', 'thr3ree')
                     .gsub('four', 'fo4ur')
                     .gsub('five', 'fi5ve')
                     .gsub('six', 'si6ix')
                     .gsub('seven', 'sev7ven')
                     .gsub('eight', 'eig8ght')
                     .gsub('nine', 'ni9ne')

  only_num = string_chaos.delete('^0-9')

  if only_num.length > 1
    (only_num[0] + only_num.reverse[0]).to_i
  else
    (only_num + only_num).to_i
  end
end

puts fixed_list.sum
