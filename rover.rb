class Rover
	attr_reader :x, :y

	def initialize(x, y, d, max_x, max_y, plateau)
		@x = x
		@y = y
		@d = d
		@max_x = max_x
		@max_y = max_y
		@plateau = plateau
	end
	# executes commands sequentially
	def explore(instructions)
		instructions.each do |command|
			case command
			when 'L'
				turnLeft
			when 'R'
				turnRight
			when 'M'
				move
			end
		end
		# marking plateau coordinate as filled
		@plateau.grid[@x][@y] = 1
	end
	# prints this rovers current position
	def position
		return "#{@x} #{@y} #{@d}"
	end

	private

	# turns left
	def turnLeft
		case @d
		when 'N'
			@d = 'W'
		when 'S'
			@d = 'E'
		when 'E'
			@d = 'N'
		when 'W'
			@d = 'S'
		end
	end
	# turns right
	def turnRight
		case @d
		when 'N'
			@d = 'E'
		when 'S'
			@d = 'W'
		when 'E'
			@d = 'S'
		when 'W'
			@d = 'N'
		end
	end
	# returns true if (x, y) coordinate in the plateau is empty
	def isEmpty(x, y)
		return @plateau.grid[x][y] == 0
	end
	# if the coordinate is empty or is not out of bounds
	# rover moves in the facing direction by 1 unit
	def move
		case @d
		when 'N'
			@y += 1 if @y < @max_y && isEmpty(@x, @y + 1)
		when 'E'
			@x += 1 if @x < @max_x && isEmpty(@x + 1, @y)
		when 'S'
			@y -= 1 if @y >= 0 && isEmpty(@x, @y - 1)
		when 'W'
			@x -= 1 if @x >= 0 && isEmpty(@x - 1, @y)
		end
	end
end
