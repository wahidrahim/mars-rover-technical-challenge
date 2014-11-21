class Plateau
	attr_reader :grid
	
	# creates a (x + 1)x(y + 1) 2D array initialized to 0
	def initialize(x, y)
		@grid = Array.new(x + 1) { Array.new(y + 1, 0) }
	end
end
