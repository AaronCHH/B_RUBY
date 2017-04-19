# 設定大小
W, H = 4, 4
# 線是從格點上下左右哪個方向突出
# U: 上, D: 下, L: 左, R: 以位元串設定右
U, D, L, R = 0b1000, 0b0100, 0b0010, 0b0001

# 因為位於內側，所以列與欄的格點數量各減1
@width, @height = W - 1, H - 1
# 設定可能出現的格點形狀（依上述說明的順序）
@dir = [U|D, L|R, U|D|L, U|D|R, U|L|R, D|L|R, U|D|L|R, 0b0]
@cnt, @cnt1x1 = 0, 0
@cross = []

def search(pos)
  if pos == @width * @height then # 結束搜尋
    @cnt += 1
    # 計算1x1的儲存格
    cell = Array.new(W * H, true)
    @cross.each_with_index{|c, i|
      x, y = i % @width, i / @width
      cell[x + y * W] = false if (c & U == 0) || (c & L == 0)
      cell[(x+1) + y * W] = false if (c & U == 0) || (c & R == 0)
      cell[x + (y+1) * W] = false if (c & D == 0) || (c & L == 0)
      cell[(x+1) + (y+1) * W] = false if (c & D == 0) || (c & R == 0)
    }
    @cnt1x1 += 1 if cell.index(true) == nil
    return
  end
  @dir.each{|d|
    @cross[pos] = d
    # 左端或是從左側來的線與右側來的線一致。
    # 或是上側與從上側來的線與下側來的線一致。
    if ((pos % @width == 0) ||
        ((@cross[pos] & L > 0) == (@cross[pos - 1] & R > 0))) &&
       ((pos / @height == 0) ||
        ((@cross[pos] & U > 0) == (@cross[pos - @height] & D > 0)))
    then
      search(pos + 1)
    end
  }
end

search(0)
puts @cnt
puts @cnt1x1
