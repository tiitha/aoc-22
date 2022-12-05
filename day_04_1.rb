
data = '''2-4,6-8
2-3,4-5
5-7,7-9
2-8,3-7
6-6,4-6
2-6,4-8'''

data = File.open("inp_4").read()

part_1 = 0 
part_2 = 0 

data = data.split("\n").each do |l|
	a,b = l.split(",").map { |a| x,y = a.split("-"); (x..y).to_a }
	x = a & b 

	part_1 += 1 if a == x or b == x
	part_2 += 1 if x.size > 0
end

puts "part 1: #{part_1}"
puts "part 2: #{part_2}"

