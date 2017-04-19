# 設定要搜尋的大小
W, H = 4, 4

# 搜尋使用的函數
# pos : 搜尋位置
# cells : 以true/false針對所有儲存格判斷儲存格是否已用過
# is1x1 : 檢查是否有1×1的儲存格
# 傳回值 : 可能合併的模式種類與沒有1×1的儲存格的模式種類
def search(pos, cells, is1x1)
  if pos == W * H then # 結束搜尋
    if is1x1 then
      return [1, 0]
    else
      return [1, 1]
    end
  end

  # 搜尋過要搜尋的位置之後，往下一個位置移動
  return search(pos + 1, cells, is1x1) if cells[pos]

  # 依序搜尋長方形
  x, y = pos % W, pos / W
  result = [0, 0]
  (1..(H - y)).each{|dy|    # 垂直方向的大小
    (1..(W - x)).each{|dx|  # 水平方向的大小
      next_cells = cells.clone
      settable = true       # 能否設置長方形
      dy.times{|h|
        dx.times{|w|
          if next_cells[(x + w) + (y + h) * W] then
            # 已設定完成的情況
            settable = false
          else
            next_cells[(x + w) + (y + h) * W] = true
          end
        }
      }
      if settable then
        # 可配置長方形時，先配置再搜尋下一個長方形
        res = search(pos + 1, next_cells,
                     is1x1 || (dx == 1 && dy == 1))
        result[0] += res[0]
        result[1] += res[1]
      end
    }
  }
  return result
end

# 初始化儲存格
cells = Array.new(W * H, false)
puts search(0, cells, false)
