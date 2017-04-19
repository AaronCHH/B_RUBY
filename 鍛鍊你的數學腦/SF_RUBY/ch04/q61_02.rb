# 設定格點數量
W, H = 5, 4
# 移動方向
@move = [[0, 1], [0, -1], [1, 0], [-1, 0]]
@log = {}

# 遞迴搜尋
def search(x, y, depth)
  return 0 if x < 0 || W <= x || y < 0 || H <= y
  return 0 if @log.has_key?(x + y * W)
  return 1 if depth == W * H
  # 搜尋到一半時，檢查剩對的格點是否串連
  if depth == W * H / 2 then
    remain = (0..(W*H-1)).to_a - @log.keys
    check(remain, remain[0])
    return 0 if remain.size > 0
  end
  cnt = 0
  @log[x + y * W] = depth
  @move.each{|m| # 往上下左右移動
    cnt += search(x + m[0], y + m[1], depth + 1)
  }
  @log.delete(x + y * W)
  return cnt
end

# 檢查是否連接
def check(remain, del)
  remain.delete(del)
  left, right, up, down = del - 1, del + 1, del - W, del + W
  # 若移動位置是同一顏色，就繼續往這個方向搜尋
  check(remain, left) if (del % W > 0) && remain.include?(left)
  check(remain, right) if (del % W != W - 1) && remain.include?(right)
  check(remain, up) if (del / W > 0) && remain.include?(up)
  check(remain, down) if (del / W != H - 1) && remain.include?(down)
end

count = 0
(W * H).times{|i|
  count += search(i % W, i / W, 1)
}

# 起點與終點相反的模式視為同一種模式，所以把結果除以2
puts count / 2
