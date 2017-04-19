ip = Array.new
(1 << 16).times{|i|
  # 反轉16位元的數字
  j = ('%016b' % i).reverse.to_i(2)

  # 產生10進位以黑點間隔的字串
  s = '%d.%d.%d.%d' % [i>>8, i&0xff, j>>8, j&0xff]

  # 只有10個數字與黑點時，就新增至陣列
  ip.push(s) if s.split("").uniq.length == 11
}
puts ip.size
puts ip
