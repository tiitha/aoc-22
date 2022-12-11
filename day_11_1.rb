data = '''Monkey 0:
  Starting items: 79, 98
  Operation: new = old * 19
  Test: divisible by 23
    If true: throw to monkey 2
    If false: throw to monkey 3

Monkey 1:
  Starting items: 54, 65, 75, 74
  Operation: new = old + 6
  Test: divisible by 19
    If true: throw to monkey 2
    If false: throw to monkey 0

Monkey 2:
  Starting items: 79, 60, 97
  Operation: new = old * old
  Test: divisible by 13
    If true: throw to monkey 1
    If false: throw to monkey 3

Monkey 3:
  Starting items: 74
  Operation: new = old + 3
  Test: divisible by 17
    If true: throw to monkey 0
    If false: throw to monkey 1'''

data = File.open("inp_11").read()


inp = data.split("\n\n")

monkeys = []

inp.each do |l|
	l = l.split("\n")
	items = l[1].scan(/Starting items: (.*)/)[0][0].split(", ").map(&:to_i)
	op = l[2][18..].split
	mod = l[3][21..].to_i
	if_true = l[4][29..].to_i
	if_false = l[5][30..].to_i
	monkeys << { :items => items, :op => op, :mod => mod, :if_true => if_true, :if_false => if_false }
end

def solve(monkeys, i)
	modu = monkeys.map {|m| m[:mod] }.inject(:*)
	counter = monkeys.size.times.map { 0 }
	(0..i-1).each do |iter|

		monkeys.each_with_index do |m, midx|

			while m[:items].size > 0
				counter[midx] += 1
				item = m[:items].shift
				new_op = m[:op].map{ |o| (o == "old") ? item : o }

				case new_op[1]
				when "+"
					item = new_op[0].to_i + new_op[2].to_i
				when "-"
					item = new_op[0].to_i - new_op[2].to_i
				when "*"
					item = new_op[0].to_i * new_op[2].to_i
				when "/"
					item = new_op[0].to_i / new_op[2].to_i
				end

				item = item / 3 if i == 20
# stop the bastard from growing too much ..
				item = item % modu

				idx = ((item%m[:mod]) == 0) ? m[:if_true] : m[:if_false]
				monkeys[idx][:items] << item
			end

		end
	end
	counter.sort[-2..].inject(:*)
end

#puts "part 1: #{solve(monkeys, 20)}"
puts "part 2: #{solve(monkeys, 10000)}"
