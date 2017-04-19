W, H = 6, 4
DIR = [[0, 1], [-1, 0], [0, -1], [1, 0]] # 移動方向
left = [0] * H   # 以位元單位儲存垂直線是否走過的資料
bottom = [0] * W # 以位元單位儲存水平線是否走過的資料

def search(x, y, dir, left, bottom)
  left_l = left.clone
  bottom_l = bottom.clone
  # 超出邊界或已經走過的路線就不繼續前進
  if (dir == 0) || (dir == 2) then # 上下移動的情況
    pos = [y, y + DIR[dir][1]].min
    return 0 if (pos < 0) || (y + DIR[dir][1] > H)
    return 0 if left_l[pos] & (1 << x) > 0
    left_l[pos] |= (1 << x)        # 將垂直線設定為走過的路線
  else                             # 左右移動的情況
    pos = [x, x + DIR[dir][0]].min
    return 0 if (pos < 0) || (x + DIR[dir][0] > W)
    return 0 if bottom_l[pos] & (1 << y) > 0
    bottom_l[pos] |= (1 << y)      # 將水平線設定為走過的路線
  end
  next_x, next_y = x + DIR[dir][0], y + DIR[dir][1]
  return 1 if (next_x == W) && (next_y == H)  # 到達B之後結束搜尋

  cnt = 0
  # 前進
  cnt += search(next_x, next_y, dir, left_l, bottom_l)
  # 左轉
  dir = (dir + 1) % DIR.size
  cnt += search(next_x, next_y, dir, left_l, bottom_l)
  cnt
end

puts search(0, 0, 3, left, bottom) # 從起點往右移動開始
