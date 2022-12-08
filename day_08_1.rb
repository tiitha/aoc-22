data = '''30373
25512
65332
33549
35390'''

def analyse(res)
	visible = (res[0].size + res.transpose[0].size-2) *2

	(1..res.size - 2).each do |j|
		(1..res[j].size-2).each do |i|
			tree = res[j][i]
			vis = false

			# from left
			vis = true unless res[j][0..i-1].select { |n| n >= tree }.size > 0

			# from right
			vis = true unless res[j][i+1..].select { |n| n >= tree }.size > 0

			# from top
			res2 = res.transpose
			vis = true unless res2[i][0..j-1].select { |n| n >= tree }.size > 0

			# from bottom
			vis = true unless res2[i][j+1..].select { |n| n >= tree }.size > 0
			visible += 1 if vis

		end
	end
	visible
end

data = File.open("inp_8").read()
res = []
data.split("\n").each do |l|
	res << l.split(//).map {|i| i.to_i}
end
puts analyse(res)
