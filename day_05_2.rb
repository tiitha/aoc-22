data = '''    [D]    
[N] [C]    
[Z] [M] [P]
 1   2   3 

move 1 from 2 to 1
move 3 from 1 to 3
move 2 from 2 to 1
move 1 from 1 to 2'''

data = File.open("inp_5").read()

crates = Hash.new { |h, k| h[k] = [] }

data = data.split("\n").each do |l|

	last_index = -1

	while !(a = l.index("[", last_index + 1)).nil?
		crates[(a/4)+1] << l[a+1]
		last_index = a
	end

	next unless l.start_with? "move"

	c,f,t = l.scan(/move (\d+) from (\d+) to (\d+)/)[0].map { |d| d.to_i }
	crates[t] = crates[f].shift(c) + crates[t]

end
puts crates.sort.map { |c,v| v[0] }.join

