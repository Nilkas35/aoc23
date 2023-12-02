# frozen_string_literal: true

file = File.open('data_part_2.txt')
file_data = file.readlines.map(&:chomp)

sum = []

fixed_list = file_data.map do |data|
  fixed_data = data.strip.gsub('Game', '').split(': ')
  [fixed_data[0].to_i, fixed_data[1].split(';')]
end

list_of_sum = fixed_list.map do |data|
  arr_of_games = data[1].map { |game| game.split(', ') }
  [data[0], arr_of_games]
end

list_of_sum.each do |data|
  red = 0
  green = 0
  blue = 0

  data[1].each do |game| # [['3 blue', '4 red'], [' 1 red', '2 green', '6 blue'], [' 2 green']]
    game.each do |cube| # ['3 blue', '4 red']
      fixed = cube.split(' ')

      if fixed[1] == 'red'
        red = fixed[0].to_i if fixed[0].to_i > red
      elsif fixed[1] == 'green'
        green = fixed[0].to_i if fixed[0].to_i > green
      else # blue
        blue = fixed[0].to_i if fixed[0].to_i > blue
      end
    end
  end

  sum << (red * green * blue)
end

puts sum.sum
