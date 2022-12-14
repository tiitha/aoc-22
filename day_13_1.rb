
data = '''[1,1,3,1,1]
[1,1,5,1,1]

[[1],[2,3,4]]
[[1],4]

[9]
[[8,7,6]]

[[4,4],4,4]
[[4,4],4,4,4]

[7,7,7,7]
[7,7,7]

[]
[3]

[[[]]]
[[]]

[1,[2,[3,[4,[5,6,7]]]],8,9]
[1,[2,[3,[4,[5,6,0]]]],8,9]'''

data = File.open("inp_13").read()

packets = []
data.split("\n\n").each do |d|
    packets << d.split.map { |a| eval a.strip }
end

def compare(a,b)
    if !a.kind_of?(Array) && !b.kind_of?(Array)
        a <=> b
    else
        a = [a] unless a.kind_of?(Array)
        b = [b] unless b.kind_of?(Array)
        a.each_with_index do |ai,i|
            break if b[i].nil?
            c = compare(ai,b[i])
            return c unless c == 0
        end
        a.length - b.length
    end
end

part1 = []
packets.map.with_index do |arr,i| 
    part1 << (arr.sort {|a,b| compare(a,b) } == arr ? i+1 : 0)
end
puts "part 1: #{part1.sum}"

sorted = (packets + [[[[2]], [[6]]]]).flatten(1).sort {|a,b| compare(a,b) }
part2 = (sorted.find_index([[2]])+1) * (sorted.find_index([[6]])+1)
puts "part 2: #{part2}"
