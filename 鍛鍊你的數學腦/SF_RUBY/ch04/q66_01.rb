W, H = 6, 5
# 格眼初始化
@puzzle = Array.new(W + 2).map{Array.new(H + 2, 0)}
(W+2).times{|w|
  (H+2).times{|h|
    if (w==0) || (w==W+1) || (h==0) || (h==H + 1) then
      @puzzle[w][h] = -1
    end
  }
}

def fill(x, y, from, to)        # 確認是否連續出現而持續填滿
  if @puzzle[x][y] == from then
    @puzzle[x][y] = to
    fill(x - 1, y, from, to)
    fill(x + 1, y, from, to)
    fill(x, y - 1, from, to)
    fill(x, y + 1, from, to)
  end
end

def check()
  x, y = 1, 1
  x += 1 if @puzzle[x][y] == 1
  fill(x, y, 0, 2)              # 以臨時格眼取代白色格眼
  result = (@puzzle.flatten.count(0) == 0)
  fill(x, y, 2, 0)              # 將臨時格眼還原為白色格眼
  result
end

def search(x, y)
  x, y = 1, y + 1 if x == W + 1 # 到達右端之後就移動到下一列
  return 1 if y == H + 1        # 能搜尋到最後一格格眼就算成功
  cnt = search(x + 1, y)        # 設定白色格眼後，再繼續搜尋
  # 左側或上方不為黑色格眼的時候，設定黑色格眼再繼續搜尋
  if (@puzzle[x - 1][y] != 1) && (@puzzle[x][y - 1] != 1) then
    @puzzle[x][y] = 1           # 設定黑色格眼
    cnt += search(x + 1, y) if check()
    @puzzle[x][y] = 0           # 還原黑色格眼
  end
  cnt
end

p search(1, 1)                  # 從左上角開始
