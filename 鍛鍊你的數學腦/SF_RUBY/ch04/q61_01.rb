# 設定格點數量
W, H = 5, 4
# 移動方向
@move = [[0, 1], [0, -1], [1, 0], [-1, 0]]

@map = Array.new(W * H, false)

# 遞迴搜尋
def search(x, y, depth)
  return 0 if x < 0 || W <= x || y < 0 || H <= y || @map[x + y * W]
  return 1 if depth == W * H
  cnt = 0
  @map[x + y * W] = true
  @move.each{|m| # 往上下左右移動
    cnt += search(x + m[0], y + m[1], depth + 1)
  }
  @map[x + y * W] = false
  return cnt
end

count = 0
(W * H).times{|i|
  count += search(i % W, i / W, 1)
}
# 起點與終點相反的模式視為同一種模式，所以把結果除以2
puts count / 2
