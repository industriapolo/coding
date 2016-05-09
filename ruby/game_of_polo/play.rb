# 1.	Any live cell with fewer than two live neighbours dies, as if caused by under-population.
# 2.	Any live cell with two or three live neighbours lives on to the next generation.
# 3.	Any live cell with more than three live neighbours dies, as if by overcrowding.
# 4.	Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.
require_relative 'cell'
require_relative 'world'
require 'colorize'

system 'clear'
width = 20
height = 20
game1 = World.new(width, height)
line_count = 0
cell_count = 0


2.times do puts end

game1.cell_grid.each do |line|
	line.each do |cell|
		if cell.state != 0
			print "* ".green
		else
			print "  "
		end
	end
	print "\n"
end

2.times do puts end

while true do
	sleep(0.3)
	system "clear"
	game1.cell_grid.each do |dale|
		dale.each do |toma|
			toma.regenerate
		end
	end

	2.times do puts end

		game1.cell_grid.each do |line|
		line.each do |cell|
			if cell.state != 0
				print "* ".green
			else
				print "  "
			end
		end
		print "\n"
	end

	2.times do puts end

	game1.neighbours_detector
end

