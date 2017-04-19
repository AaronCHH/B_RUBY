# 將終點模式設定為初始值
memo = {0x000fff => 0, 0xfff000 => 0, 0xcccccc => 0, 0x333333 => 0}
queue = memo.keys
W, H = 4, 6

# 設定可以交換的位置
mask = []
(W * H).times{|i|
  mask.push((1 << 1 | 1) << i) if i % W < W - 1 # 水平相鄰
  mask.push((1 << W | 1) << i) if i < W * (H - 1) # 垂直相鄰
}

depth = 0
while queue.size > 0 do # 只要還有能搜尋的模式就重覆搜尋
  p [depth, queue.size]
  depth += 1
  next_queue = []
  queue.map{|q|
    mask.each{|m|
      # 在2個位置「都是0」或「都是1」的情況之外，搜尋尚未搜尋的部分
      if ((q & m) != 0) && ((q & m) != m) && !memo.key?(q ^ m) then
        memo[q ^ m] = depth
        next_queue.push(q ^ m)
      end
    }
  }
  queue = next_queue
end
