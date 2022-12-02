data = '''1000
2000
3000

4000

5000
6000

7000
8000
9000

10000'''

data = File.open("inp_1").read()

elves = data.split("\n\n").map{ |elf| elf.split("\n").map{ |c| c.to_i }.sum }.sort

puts "Part 1: #{elves.last}"
puts "Part 2: #{elves[-3..].sum}"
