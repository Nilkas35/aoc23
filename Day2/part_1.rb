# frozen_string_literal: true

file = File.open('data_part_1.txt')
file_data = file.readlines.map(&:chomp)

MAX_RED_CUBES = 12
MAX_GREEN_CUBES = 13
MAX_BLUE_CUBES = 14

sum = []

fixed_list = file_data.map do |data|
  fixed_data = data.strip.gsub('Game', '').split(': ')
  [fixed_data[0].to_i, fixed_data[1].split(';')]
end

list_of_sum = fixed_list.map do |data|
  arr_of_games = data[1].map { |game| game.split(', ') }
  [data[0], arr_of_games]
end

final_list = list_of_sum.each do |data|
  possible = data[1].map do |game| # [['3 blue', '4 red'], [' 1 red', '2 green', '6 blue'], [' 2 green']]
    games = game.map do |cube| # ['3 blue', '4 red']
      fixed = cube.split(' ')

      possible = true
      if fixed[1] == 'red'
        possible = false if fixed[0].to_i > MAX_RED_CUBES
      elsif fixed[1] == 'green'
        possible = false if fixed[0].to_i > MAX_GREEN_CUBES
      else
        possible = false if fixed[0].to_i > MAX_BLUE_CUBES
      end

      [possible] # [true/false]
    end

    games.flatten.all? { |cube| cube == true }
  end

  sum << data[0] if possible.flatten.all? { |cube| cube == true }
end
puts sum.sum

[
  [1, [['3 blue', '4 red'], [' 1 red', '2 green', '6 blue'], [' 2 green']]],
  [2, [['1 blue', '2 green'], [' 3 green', '4 blue', '1 red'], [' 1 green', '1 blue']]],
  [3, [['8 green', '6 blue', '20 red'], [' 5 blue', '4 red', '13 green'], [' 5 green', '1 red']]],
  [4, [['1 green', '3 red', '6 blue'], [' 3 green', '6 red'], [' 3 green', '15 blue', '14 red']]],
  [5, [['6 red', '1 blue', '3 green'], [' 2 blue', '1 red', '2 green']]]
]
