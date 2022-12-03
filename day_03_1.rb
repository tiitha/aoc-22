
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
data = data.split("\n").each do |l|
	l = l.split(//)
	f = l.shift(l.size / 2)
	y = f & l
	res << prios.index(y[0])+1
end
puts res.sum


