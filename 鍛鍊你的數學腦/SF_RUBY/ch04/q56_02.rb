# 垂直線與水平線
v, h = 7, 10
total = 0
# 針對「下方數字」的排列順序計算水平線的數量
(1..v).to_a.permutation.each{|final|
  start = (1..v).to_a
  cnt = 0
  v.times{|i|
    # 取得「上方數字」位於何處
    move = start.index(final[i])
    if move > 0 then
      # 調換「上方數字」的順序
      start[i], start[move] = start[move], start[i]
      cnt += move - i
    end
  }
  total += 1 if cnt == h
}
puts total
