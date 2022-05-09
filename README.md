# conways-game-of-life-ruby
MVP of conways game of life

# Installation
bundle install

# Test
bundle exec rspec
# Run
`ruby main.rb `
 or with params
`ruby main.rb 100 50 100`

## Definition
`ruby main.rb cols rows steps`

Board requires 3 params cols, rows, steps
Cols :Integer = number of columns for the matrix, Default to 50
Rows :Integer = number of rows for the matrix, Default to 15
Steps :Integer = number of times that we will run the solution a.k.a generations, Default to 20