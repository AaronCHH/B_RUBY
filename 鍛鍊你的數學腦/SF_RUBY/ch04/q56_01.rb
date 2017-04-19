# 垂直線與水平線
v, h = 7, 10
total = 0
# 針對「下方數字」的位置，計算需要交換的數字個數
(0..(v-1)).to_a.permutation.each{|final|
  cnt = 0
  v.times{|i|
    cnt += final.take_while{|j| j != i}.count{|k| k > i}
  }
  total += 1 if cnt == h
}
puts total
