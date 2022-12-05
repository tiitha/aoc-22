
data = '''vJrwpWtwJgWrhcsFMMfFFhFp
jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
PmmdzqPrVvPwwTWBwg
wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
ttgJtRGJQctTZtZT
CrZsJsPPZsGzwwsLwLmpwMDw
'''

data = File.open("inp_3").read()
prios = ('a'..'z').to_a + ('A'..'Z').to_a
res = []
i = 0
sacks = []
data = data.split("\n").each do |l|
	i += 1
	l = l.split(//)
	sacks << l

	if i%3==0
		y = prios
		sacks.each do |s|
			y &= s
		end
		res << prios.index(y[0])+1
		sacks = []
	end
end
puts res.sum

