N = 5
# 右手摸壁法的移動方向（右、上、左、下的順序）
@dx = [[1, 0], [0, -1], [-1, 0], [0, 1]]

# maze:牆壁的位置
# p1, d1: 第1個人的路線、移動方向
# p2, d2: 第2個人的路線、移動方向
def search(maze, p1, d1, p2, d2)
  if p1.size == p2.size then # 兩個人都移動的情況
    # 兩人碰面就算成功
    return true if p1[-1][0..1] == p2[-1][0..1]
    # 第1個人走到右下角算是失敗
    return false if p1[-1][0..1] == [N - 1, N - 1]
    # 第1個人走到左上角也算失敗
    return false if p2[-1][0..1] == [0, 0]
  end
  # 從同一個方向移動時就會一直原地繞圈，所以算是失敗
  return false if p1.count(p1[-1]) > 1

  pre = p1[-1]
  @dx.size.times{|i| # 搜尋能以右手摸壁法前進的方向
    d = (d1 - 1 + i) % @dx.size
    px = pre[0] + @dx[d][0]
    py = pre[1] + @dx[d][1]
    # 確認移動目的地是否是牆壁
    if (px >= 0) && (px < N) && (py >= 0) && (py < N) &&
       (maze[px + N * py] == 0) then
      return search(maze, p2, d2, p1 + [[px, py, d]], d)
      break
    end
  }
  false
end

a = [[0, 0, -1]]         # A:左上角(X座標、Y座標、前次移動方向)
b = [[N - 1, N - 1, -1]] # B:右下角(X座標、Y座標、前次移動方向)
cnt = 0
[0, 1].repeated_permutation(N * N - 2){|maze|
  # 以2人的開始位置一定是通路為前提開始搜尋
  # A是往下方移動(@dx[3])、B往上方移動(@dx[1])
  cnt += 1 if search([0] + maze + [0], a, 3, b, 1)
}
puts cnt
