# 盤面的大小
W, H = 5, 4

def check(color, del)
  color.delete(del)
  # 設定移動位置
  left, right, up, down = del - 1, del + 1, del - W, del + W
  # 若移動位置屬於相同顏色，則往這個方向繼續搜尋
  check(color, left) if (del % W > 0) && color.include?(left)
  check(color, right) if (del % W != W - 1) && color.include?(right)
  check(color, up) if (del / W > 0) && color.include?(up)
  check(color, down) if (del / W != H - 1) && color.include?(down)
end

# 盤面初始化
map = (0.. W*H-1).to_a
count = 0
map.combination(W * H / 2){|blue|             # 將一半設定為藍色
  if blue.include?(0) then                    # 將左上角固定為藍色
    white = map - blue                        # 其餘設定為白色
    check(blue, blue[0])                      # 檢查藍色是否相連
    check(white, white[0]) if blue.size == 0  # 檢查白色是否相連
    count += 1 if white.size == 0         # 若雙方相連就算一種組合
  end
}
puts count
