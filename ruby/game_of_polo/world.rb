# 1.	Any live cell with fewer than two live neighbours dies, as if caused by under-population.
# 2.	Any live cell with two or three live neighbours lives on to the next generation.
# 3.	Any live cell with more than three live neighbours dies, as if by overcrowding.
# 4.	Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.

class World
	attr_accessor :cell_grid, :wide, :high

	def initialize(wide, high)
		@wide = wide
		@high = high
		@cell_grid = []
		@high.times do
			arr = []
			@wide.times do
				first_state = rand(0..1)
				arr << Cell.new(first_state)
			end
			@cell_grid << arr
		end
		neighbours_detector
	end

	def neighbours_detector
		# deteccion de vecinos células interiores
		for i in (1..(high - 2)) do
			for cell in (1..(wide - 2)) do 
				@cell_grid[i][cell].neighbours << @cell_grid[i - 1][cell - 1].state
				@cell_grid[i][cell].neighbours << @cell_grid[i - 1][cell].state
				@cell_grid[i][cell].neighbours << @cell_grid[i - 1][cell + 1].state
				@cell_grid[i][cell].neighbours << @cell_grid[i][cell - 1].state
				@cell_grid[i][cell].neighbours << @cell_grid[i][cell + 1].state
				@cell_grid[i][cell].neighbours << @cell_grid[i + 1][cell - 1].state
				@cell_grid[i][cell].neighbours << @cell_grid[i + 1][cell].state
				@cell_grid[i][cell].neighbours << @cell_grid[i + 1][cell + 1].state
			end
		end

		# detección vecinos fila superior
		for j in (1..(wide - 2)) do 
			@cell_grid[0][j].neighbours << @cell_grid[0][j - 1].state
			@cell_grid[0][j].neighbours << @cell_grid[0][j + 1].state
			@cell_grid[0][j].neighbours << @cell_grid[1][j - 1].state
			@cell_grid[0][j].neighbours << @cell_grid[1][j].state
			@cell_grid[0][j].neighbours << @cell_grid[1][j + 1].state
		end

		# detección vecinos fila inferior
		for k in (1..(wide - 2)) do 
			@cell_grid[(high - 1)][k].neighbours << @cell_grid[(high - 1)][k - 1].state
			@cell_grid[(high - 1)][k].neighbours << @cell_grid[(high - 1)][k + 1].state
			@cell_grid[(high - 1)][k].neighbours << @cell_grid[(high - 2)][k - 1].state
			@cell_grid[(high - 1)][k].neighbours << @cell_grid[(high - 2)][k].state
			@cell_grid[(high - 1)][k].neighbours << @cell_grid[(high - 2)][k + 1].state
		end

		# detección vecinos columna izquierda
		for l in (1..(high - 2)) do 
			@cell_grid[l][0].neighbours << @cell_grid[(l - 1)][0].state
			@cell_grid[l][0].neighbours << @cell_grid[(l - 1)][1].state
			@cell_grid[l][0].neighbours << @cell_grid[l][1].state
			@cell_grid[l][0].neighbours << @cell_grid[(l +1)][0].state
			@cell_grid[l][0].neighbours << @cell_grid[(l +1)][1].state
		end

		# detección vecinos columna derecha
		for m in (1..(high - 2)) do 
			@cell_grid[m][(wide - 1)].neighbours << @cell_grid[(m - 1)][(wide - 2)].state
			@cell_grid[m][(wide - 1)].neighbours << @cell_grid[(m - 1)][(wide - 1)].state
			@cell_grid[m][(wide - 1)].neighbours << @cell_grid[m][(wide - 2)].state
			@cell_grid[m][(wide - 1)].neighbours << @cell_grid[(m + 1)][(wide - 2)].state
			@cell_grid[m][(wide - 1)].neighbours << @cell_grid[(m + 1)][(wide - 1)].state
		end

		# detección vecinos esquina arriba izquierda
		@cell_grid[0][0].neighbours << @cell_grid[0][1].state
		@cell_grid[0][0].neighbours << @cell_grid[1][1].state
		@cell_grid[0][0].neighbours << @cell_grid[1][0].state

		# detección vecinos esquina arriba derecha
		@cell_grid[0][(wide - 1)].neighbours << @cell_grid[0][(wide - 2)].state
		@cell_grid[0][(wide - 1)].neighbours << @cell_grid[1][(wide - 2)].state
		@cell_grid[0][(wide - 1)].neighbours << @cell_grid[1][(wide - 1)].state

		# detección vecinos esquina abajo izquierda
		@cell_grid[(high - 1)][0].neighbours << @cell_grid[(high - 2)][0].state
		@cell_grid[(high - 1)][0].neighbours << @cell_grid[(high - 2)][1].state
		@cell_grid[(high - 1)][0].neighbours << @cell_grid[(high - 1)][1].state

		# detección vecinos esquina abajo derecha
		@cell_grid[(high - 1)][(wide - 1)].neighbours << @cell_grid[(high - 2)][(wide - 1)].state
		@cell_grid[(high - 1)][(wide - 1)].neighbours << @cell_grid[(high - 2)][(wide - 2)].state
		@cell_grid[(high - 1)][(wide - 1)].neighbours << @cell_grid[(high - 1)][(wide - 2)].state

		# suma de vecinos
		cell_grid.each do |x| 
			x.each do |y|
				y.neighbours.each do |z|
					y.total_neighbours += z
				end
			end
		end

	end

end



