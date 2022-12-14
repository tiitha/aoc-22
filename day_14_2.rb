require "set"

def print_grid(bottom)
	(0..bottom).each do |y|
		print "#{y.to_s.rjust(3)} "
		(450..600).each do |x|
			print ($image.include? [x,y]) ? "x" : "."
		end
		puts 
	end
end
#print_grid

def tokenize(t0,t1)
	x = []
	y = []
	r = []
	x[0],y[0] = t0
	x[1],y[1] = t1

	(x.min .. x.max).each { |m| 
		r << [m,y.min] 
	} if y.min == y.max

	(y.min .. y.max).each { |m| 
		r << [x.min,m] 
	} if x.min == x.max
	r
end

data = '''498,4 -> 498,6 -> 496,6
503,4 -> 502,4 -> 502,9 -> 494,9'''

#data = File.open("inp_14").read()
$image = Set.new

data.split("\n").each do |l|
	tokens = l.split(" -> ").map{|i| i.split(",").map{|o| o.to_i }}
	(1..tokens.size-1).each do |i|
		$image += tokenize(tokens[i-1],tokens[i])
	end
end

bottom = $image.map { |i| i[1] }.max+2

grains = 0
loop do 
	s = [500,0]
	grains += 1
	breaker = false
	loop do
		unless $image.include? [s[0],s[1]+1] or s[1]+1 >= bottom
			s = [s[0],s[1]+1]
			break if s[1]+1 == bottom 
			next
		end
		unless $image.include? [s[0]-1,s[1]+1] or s[1]+1 >= bottom
			s = [s[0]-1,s[1]+1]
			next
		end
		unless $image.include? [s[0]+1,s[1]+1] or s[1]+1 >= bottom
			s = [s[0]+1,s[1]+1]
			next
		end		
		breaker = true if s == [500,0]
		break
	end
	$image << s
	break if breaker 
end
puts "part 2: #{grains}"
