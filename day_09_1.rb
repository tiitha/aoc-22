require 'set'

data = '''R 5
U 8
L 8
D 3
R 17
D 10
L 25
U 20'''

def dir(a,b)
	(a < b) ? -1 : 1
end

def wiggle_tail(h,t)
	dx = h[0] - t[0]
	dy = h[1] - t[1]
	return t if dx.abs <= 1 and dy.abs <= 1

	nx,ny = h
	nx += dir(t[0], h[0]) if dx.abs > 1
	ny += dir(t[1], h[1]) if dy.abs > 1

	[nx, ny]
end

rope = 10.times.map { [0,0] }

part1 = Set.new
part2 = Set.new

data = File.open("inp_9").read()
data.split("\n").each do |l|
	d,c = l.split(" ")
	c.to_i.times do 
		case d
		when 'R'
			rope[0][1] += 1
		when 'L'
			rope[0][1] -= 1
		when 'U'
			rope[0][0] -= 1
		when 'D'
			rope[0][0] += 1
		end

		(1..9).each do |idx|
	        rope[idx] = wiggle_tail(rope[idx-1], rope[idx])
	 	end

	 	part1 << rope[1]
	 	part2 << rope[9]
	end
end
puts "part 1: #{part1.size}"
puts "part 2: #{part2.size}"
