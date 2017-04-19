val = []
256.times{|i|
  # 於0〜255反轉
  rev = ('%08b'%i).reverse.to_i(2)

  if i < rev then
    s = i.to_s + rev.to_s
    # 若0〜9沒有重覆出現，就視為答案
    val.push([i, rev]) if s.split('').uniq.size == s.length
  end
}

ip = []
val.combination(2){|a, b|
  # 0〜9分別只使用一次時，就視為配對
  ip.push([a, b]) if (a + b).join.split('').uniq.size == 10
}
# 輸出配對的組合數
puts ip.size * 8
