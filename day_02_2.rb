
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

	x = s.index(b) -1
	y = f.index(a) + x

	res += (x+1)*3 + f.index(f[y%3]) + 1
end
puts res

