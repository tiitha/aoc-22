
f = ['A','B','C']
s = ['X','Y','Z']

data = '''A Y
B X
C Z
'''

data = File.open("inp_2").read()

res = 0
data = data.split("\n").each do |l|
	a,b = l.split(" ")

	r = s.index(b) - f.index(a)
	x = ((r+1)%3)*3

	res += x + s.index(b) + 1
end
puts res
