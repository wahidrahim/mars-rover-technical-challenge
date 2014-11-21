class Plateau
	attr_reader :grid
	
	def initialize(x, y)
		# creates a (x + 1)x(y + 1) 2D array initialized to 0
		@grid = Array.new(x + 1) { Array.new(y + 1, 0) }
	end
end
