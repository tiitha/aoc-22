data = '''30373
25512
65332
33549
35390'''

def visible(arr, tree)
	(arr.index{|x| x >= tree} || arr.size-1) +1
end

def analyse(res)

	visses = []
	(1..res.size - 2).each do |j|
		(1..res[j].size-2).each do |i|

			vis = []
			tree = res[j][i]
			# left
			vis << visible(res[j][0..i-1].reverse, tree)

			# right
			vis << visible(res[j][i+1..], tree)

			# top
			res2 = res.transpose
			vis << visible(res2[i][0..j-1].reverse, tree)

			# bottom
			vis << visible(res2[i][j+1..], tree)

			visses << vis.inject(:*)
		end
	end
	visses.max
end

data = File.open("inp_8").read()
res = data.split("\n").each.map { |l| l.split(//).map {|i| i.to_i } }

puts analyse(res)
