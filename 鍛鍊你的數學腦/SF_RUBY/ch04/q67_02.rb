N = 6
FREE, USED, WALL = 0, 1, 9

@memo = {}

def search(seat)
  return @memo[seat] if @memo.has_key?(seat)
  count = 0
  # 搜尋旁邊沒人的座位
  seat.size.times{|i|
    if seat[i] == FREE then
      if (seat[i - 1] != USED) && (seat[i + 1] != USED) then
        # 若是空著的座位就坐下去，然後繼續搜尋
        seat[i] = USED
        count += search(seat)
        seat[i] = FREE
      end
    end
  }
  # 若還有旁邊沒人的座位，就以上述計次的值計算，否則就以階乘計算
  @memo[seat] = (count > 0) ? count : (1..seat.count(FREE)).inject(:*)
end

puts search([WALL] + [FREE] * N + [WALL] + [FREE] * N + [WALL])
