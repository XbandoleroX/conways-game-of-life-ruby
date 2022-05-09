require './lib/board.rb'

# Board requires 3 params cols, rows, steps
# Cols :Integer = number of columns for the matrix, Default to 50
# Rows :Integer = number of rows for the matrix, Default to 15
# Steps :Integer = number of times that we will run the solution a.k.a generations, Default to 20
cols, rows, steps = *ARGV.map(&:to_i)
cols ||= 50
rows ||=  15
steps ||= 100

board = Board.new(cols, rows, steps)
i = 0

until i.eql?(steps) do
  board.step
  board.display_matrix
  sleep(0.03)
  i+=1
  true
end
