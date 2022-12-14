require 'set'
require 'matrix'

data = '''Sabqponm
abcryxxl
accszExk
acctuvwj
abdefghi'''


def print_grid()
	$grid.each do |m|
		puts "#{m}"
	end
end


def find_shortest_path(sx, sy, reverse = false)
	directions = [[0, 1], [0, -1], [1, 0], [-1, 0]]
	paths = Hash.new(100000000000)
	paths[[sy,sx]] = 0
	should_search = [[sx, sy, 0]]
	while should_search.size > 0
		x, y, steps = should_search[0]
        should_search = should_search[1..]

        from_height = $grid[y][x].ord

        directions.each do |dx, dy|
        	nx = x + dx
        	ny = y + dy
        	next if nx < 0 or nx >= $grid[0].size or ny < 0 or ny >= $grid.size

        	to_height = $grid[ny][nx].ord
        	next if not reverse and not from_height - to_height >= -1
        	next if reverse and not from_height - to_height <= 1

			if paths[[ny, nx]] > steps + 1
                paths[[ny, nx]] = steps + 1
                should_search.append([nx, ny, steps + 1])
            end
        end
	end
	paths
end

data = File.open("inp_12").read()

$grid = data.split("\n").map{|l| l.split(//) }

$sy,$sx = Matrix[*$grid].index("S")
$ey,$ex = Matrix[*$grid].index("E")
puts 
$grid[$sy][$sx] = "a"
$grid[$ey][$ex] = "z"



part1 = find_shortest_path($sx,$sy)[[$ey,$ex]]
puts "part 1: #{part1}"

dists = []
find_shortest_path($ex, $ey, true).each do |c, dist|
	y,x = c
	dists << dist if $grid[y][x] == "a"
end
puts "part 2: #{dists.min}"


