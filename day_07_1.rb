
data = '''$ cd /
$ ls
dir a
14848514 b.txt
8504156 c.dat
dir d
$ cd a
$ ls
dir e
29116 f
2557 g
62596 h.lst
$ cd e
$ ls
584 i
$ cd ..
$ cd ..
$ cd d
$ ls
4060174 j
8033020 d.log
5626152 d.ext
7214296 k'''
data = File.open("inp_7").read()

def get_size(k, dir)
	sum = dir[k][:sum]
	dir[k][:children].each do |c|
		sum += get_size("#{k};#{c}", dir)
	end
	sum
end

cwd = []

dir = Hash.new { |h, k| h[k] = { :sum => 0, :children => [] } }

data.split("\n").each do |l|
	x,y,z = l.split(" ")
	case x
	when "$"
		next unless y == "cd"
		if z == ".."
			cwd.pop()
		else
			cwd.push(z)
		end
	when "dir"
		dir[cwd.join(";")][:children] << y
	else
		dir[cwd.join(";")][:sum] += x.to_i
	end

end

needed_space = 30000000 - (70000000 - get_size("/", dir))
potentials = []
total = 0

dir.each do |k,v|
	s = get_size(k, dir)
	total += s if s <= 100000
	potentials << s if s > needed_space
end

puts "part 1: #{total}"
puts "part 2: #{potentials.min}"
