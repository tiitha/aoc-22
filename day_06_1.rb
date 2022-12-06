require 'set'

def solve(data, length)
	(0..data.size - length).each do |c|
		return c + length if data[c..(c + length - 1)].to_set.size == length			
	end
end

data = '''mjqjpqmgbljsphdztnvjfqwrcgsmlb'''
data = File.open("inp_6").read()

data = data.chars

puts "part 1: #{solve(data, 4)}"
puts "part 2: #{solve(data, 14)}"
