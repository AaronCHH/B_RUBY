N = 5
MASK = (1 << (N * N)) - 1
# 以位元運算算出移動位置
@move = [lambda{|m| (m >> 1) & 0b0111101111011110111101111},
         lambda{|m| (m << N) & MASK},
         lambda{|m| (m << 1) & 0b1111011110111101111011110},
         lambda{|m| m >> N}]

# 判斷迷宮是否成立
def enable(maze)
  man = (1 << (N * N - 1)) & (MASK - maze) # 從左上角出發
  while true do
    next_man = man
    @move.each{|m| next_man |= m.call(man)} # 往上下左右移動
    next_man &= (MASK - maze)        # 可移動至非牆壁的部分
    return true if next_man & 1 == 1 # 若能抵達右下角就判斷迷宮成立
    break if man == next_man
    man = next_man
  end
  false
end

# map:牆壁的位置
# p1, d1: 第1個人的位置、移動方向
# p2, d2: 第2個人的位置、移動方向
def search(maze, p1, d1, p2, d2, turn)
  if turn then
    return true if p1 == p2 # 2人碰面
    # 某一人抵達終點
    return false if (p1 == 1) || (p2 == 1 << (N * N - 1))
  end
  @move.size.times{|i| # 搜尋能以右手摸壁法前進的方向
    d = (d1 - 1 + i) % @move.size
    if @move[d].call(p1) & (MASK - maze) > 0 then
      return search(maze, p2, d2, @move[d].call(p1), d, !turn)
    end
  }
  false
end

cnt = 0
(1 << N * N).times{|maze|
  if enable(maze) then
    man_a, man_b = 1 << (N * N - 1), 1
    cnt += 1 if search(maze, man_a, 3, man_b, 1, true)
  end
}
puts cnt
