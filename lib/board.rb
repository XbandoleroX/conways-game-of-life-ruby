require 'io/console'

class Board
  attr_accessor :matrix, :next_gen
  def initialize(cols=50,rows=15, steps=100)
    @cols = cols
    @rows = rows
    @matrix = new_matrix
    @next_gen = new_matrix
    # @matrix[Y][X]
    @matrix[5][5] = true
    @matrix[5][6] = true
    @matrix[4][5] = true
    @matrix[6][5] = true
    @matrix[10][5] = true
    @matrix[11][5] = true
    @matrix[12][5] = true

    # @matrix[17][17] = true
    # @matrix[19][18] = true

    # @matrix[19][199] = true
    # @matrix[19][198] = true
    # @matrix[19][197] = true

    
    # @matrix[0][148] = true
    # @matrix[1][148] = true
    # @matrix[2][148] = true
    # @matrix[3][149] = true
    # @matrix[4][149] = true
    # @matrix[5][149] = true
    number_rand_points = (@cols*@rows)/2
    number_rand_points.times do
      @matrix[rand(0..@rows-1)][rand(0..@cols-1)] = true
    end

    # @matrix[17][199] = true
    # @matrix[16][199] = true
    # @matrix[14][199] = true
    # @matrix[15][199] = true




    # @matrix[47][40] = true
    # @matrix[48][40] = true
    # @matrix[49][40] = true

    # @matrix[49][199] = true
    # @matrix[49][198] = true
    # @matrix[48][197] = true

    # show_matrix(@matrix)
  end


  def step
    (0..@rows-1).each do |y|
      (0..@cols-1).each do |x|
        @next_gen[y][x] = next_state(y, x, @matrix[y][x])
      end
    end
    @matrix = @next_gen
    @next_gen = new_matrix
    return true
  end

  def display_matrix
    $stdout.clear_screen # or STDOUT.clear_screen
    @matrix.each do |row|
      puts row.map {|x| x ? '0' : '-' }.join
    end
    
  end

  private

  # North
  def north?(y,x)
    if y > 0
      @matrix[y-1][x]
    end
  end
  # North East
  def north_east?(y,x)
    if y > 0 && x < @cols-1 
      @matrix[y-1][x+1]
    end
  end
  # East
  def east?(y,x)
    if x < @cols-1
      @matrix[y][x+1] 
    end
  end
  # South East
  def south_east?(y,x)
    if x < @cols-1 && y < @rows-1
      @matrix[y+1][x+1]
    end
  end
  # South
  def south?(y,x)
    if y < @rows-1
      @matrix[y+1][x]
    end
  end
  # South West
  def south_west?(y,x)
    if x > 0 && y < @rows-1
      @matrix[y+1][x-1]
    end
  end
  # West
  def west?(y,x)
    if x > 0
      @matrix[y][x-1]
    end
  end
  # North West
  def north_west?(y,x)
    if x > 0 && y > 0
      @matrix[y-1][x-1]
    end
  end

  def survive?(neightbors, state)
    # Alive
    return [2,3].include?(neightbors) if state
    return neightbors.eql?(3) unless state
    return false
    # if state
    #   # underpopulation or overpopulation
    #   # return false if neightbors < 2 
    #   # return true if (neightbors == 2 || neightbors == 3)
    #   # return false if neightbors > 3 
    #   return [2,3].include?(neightbors)
    # Dead
    # else
    #   # reproduction
    #   return true if neightbors == 3
    #   return false
    # end   
  end

  def next_state(y, x, state)
    neightbors = 0
    
    neightbors += 1 if north?(y,x)
    neightbors += 1 if north_east?(y,x)
    neightbors += 1 if east?(y,x)
    neightbors += 1 if south_east?(y,x)
    neightbors += 1 if south?(y,x) 
    neightbors += 1 if south_west?(y,x) 
    neightbors += 1 if west?(y,x) 
    neightbors += 1 if north_west?(y,x) 
    
    survive?(neightbors, state)
  end

  def new_matrix
    matrix = Array.new(@rows)
    # (0..@rows-1).each do |i|
    #   matrix[i] = Array.new(@cols, false)
    # end
    matrix.each_with_index do |_, idx|
      matrix[idx] = Array.new(@cols, false)
    end
    matrix
  end
end


