# 設定圖案的數量
W, H = 4, 3
row = [0] + [1] * (W - 1) + [0]
@edge = row + row.map{|r| 1 - r} * (H - 1) + row

def search(panel, odds)
  # 設定最後的圖案時，奇數頂點是否超過2個
  return (@edge.inject(:+) > 2)?0:1 if panel >= (W + 1) * H
  # 途中若是奇數頂點超過2個，就代表不可能一筆畫成
  return 0 if odds > 2

  cnt = 0
  if panel % (W + 1) < W then   # 列的右端之外
    # 搜尋圖案沒有斜線的情況
    cnt += search(panel + 1, odds + @edge[panel])

    # 圖案裡左下到右下的線條
    @edge[panel] = 1 - @edge[panel]
    @edge[panel + W + 2] = 1 - @edge[panel + W + 2]
    cnt += search(panel + 1, odds + @edge[panel])

    # 於圖案裡交叉的線
    @edge[panel + 1] = 1 - @edge[panel + 1]
    @edge[panel + W + 1] = 1 - @edge[panel + W + 1]
    cnt += search(panel + 1, odds + @edge[panel])

    # 圖案裡右上到左下的線
    @edge[panel] = 1 - @edge[panel]
    @edge[panel + W + 2] = 1 - @edge[panel + W + 2]
    cnt += search(panel + 1, odds + @edge[panel])

    # 還原斜線
    @edge[panel + 1] = 1 - @edge[panel + 1]
    @edge[panel + W + 1] = 1 - @edge[panel + W + 1]
  else               # 若是搜尋到列的右端，就往下一列移動
    cnt += search(panel + 1, odds + @edge[panel])
  end
  cnt
end

puts search(0, 0)
