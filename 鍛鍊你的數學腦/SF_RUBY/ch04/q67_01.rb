N = 6
FREE, USED, WALL = 0, 1, 9

# 在兩端與正中央設置扮演警衛角色的牆壁
@seat = [WALL] + [FREE] * N + [WALL] + [FREE] * N + [WALL]

def search(person)
  count = 0
  # 搜尋旁邊沒人的座位
  @seat.size.times{|i|
    if @seat[i] == FREE then
      if (@seat[i - 1] != USED) && (@seat[i + 1] != USED) then
        # 若是空著的座位就坐下去，然後繼續搜尋
        @seat[i] = USED
        count += search(person + 1)
        @seat[i] = FREE
      end
    end
  }
  # 若還有旁邊沒人的座位，就以上述計次的值計算，否則就以階乘計算
  (count > 0) ? count : (1..@seat.count(FREE)).inject(:*)
end

puts search(0)
