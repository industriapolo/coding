# 1.	Any live cell with fewer than two live neighbours dies, as if caused by under-population.
# 2.	Any live cell with two or three live neighbours lives on to the next generation.
# 3.	Any live cell with more than three live neighbours dies, as if by overcrowding.
# 4.	Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.

class Cell
	attr_accessor :total_neighbours, :state, :neighbours

  def initialize(state)
    @state = state # either 1 or 0 for alive or dead
    @neighbours = [] # an array that represents the surrounding cells
    @total_neighbours = 0
  #   @neighbours.each do |x|
		# 	@total_neighbours += x
		# end
  end

  def regenerate
    if @state == 1 && (@total_neighbours < 2 || @total_neighbours > 3)
			@state = 0

		elsif @state == 1 && (@total_neighbours == 2 || @total_neighbours == 3)
			@state = 1

		elsif @state == 0 && @total_neighbours == 3
			@state = 1

		else
			@state = 0
		end
		@neighbours = []
		@total_neighbours = 0
  end
end