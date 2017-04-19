n = 5

# 順向搜尋的初始值
fw = [(1..n*2).to_a]
# 逆向搜尋的初始值
bw = [(1..n*2).to_a.reverse]

depth = 1
while true do
  # 順向搜尋
  fw = fw.each_with_object([]) do |c, result|
    1.upto(n){|i| result << c[i, n] + c[0, i] + c[i + n..-1]}
  end
  break if (fw & bw).size > 0
  depth += 1

  # 逆向搜尋
  bw = bw.each_with_object([]) do |c, result|
    1.upto(n){|i| result << c[n, i] + c[0, n] + c[i + n..-1]}
  end
  break if (fw & bw).size > 0
  depth += 1
end

puts depth
