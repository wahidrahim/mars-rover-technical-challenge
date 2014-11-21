require_relative 'plateau'
require_relative 'rover'

# getting top right corner coordinates
max_coords = gets.chomp.split(' ')

max_x = max_coords[0].to_i
max_y = max_coords[1].to_i

# constructing new plateu
plateau = Plateau.new(max_x, max_y)

# get spawn point of rover
spawn = gets

# loop until end of input
while spawn != nil do
	spawn = spawn.chomp.split(' ')

	x = spawn[0].to_i
	y = spawn[1].to_i
	d = spawn[2]

	# spawn new rover if the coordinate is empty
	if plateau.grid[x][y] == 0 then
		rover = Rover.new(x, y, d, max_x, max_y, plateau)

		instructions = gets.chomp.split('')

		rover.explore(instructions)
		puts rover.position
	else
		puts "There is already a rover here!"
	end

	# get next rovers spawn point
	spawn = gets
end
