# 設定圖案的數量
W, H = 4, 3
# 位元反轉使用的值
XOR_ROW = (1 << (W + 1)) - 1

# 以列單位搜尋
def search(up, y, odds)
  # 在上一列之前奇數的數量多於2個時，排除在計算之外
  return 0 if 2 < odds

  row = 1 << W | 1     # 設定初始值

  # 開頭與結尾的列反轉
  row = XOR_ROW ^ row if (y == 0) || (y == H)

  if y == H then       # 確認最後一列之後結束程式
    odds += (row ^ up).to_s(2).count("1")   # 計算奇數的個數
    return 1 if (odds == 0) || (odds == 2)  # 0或2個則納入計算
    return 0
  end
  cnt = 0
  (1 << W).times{|a|   # 圖案的內容（有無左上到右下的直線）
    (1 << W).times{|b| # 圖案的内容（有無左下到右上的直線）
      cnt += search(a ^ b << 1, y + 1,
                    odds + (row ^ up ^ a << 1 ^ b).to_s(2).count("1"))
    }
  }
  return cnt
end

puts search(0, 0, 0)
