N = 8                     # 兩種顏色的數
start = (1 << N) - 1      # 初始状態(0有N個、1有N個)
mask = (1 << N * 2) - 1   # 位元遮罩

# 目標狀態(0與1交錯排列)
goal1 = 0
N.times{|i| goal1 = (goal1 << 2) + 1}
goal2 = mask - goal1

# 交換次數
count = N * 2
(1 << N*2).times{|i|   # 交換開始位置位元串
  turn = i ^ (i << 1) ^ (i << 2)
  turn = (turn ^ (turn >> (N * 2))) & mask

  # 若與目標狀態一做，就判定為最小的交換次數
  if (start ^ turn == goal1) || (start ^ turn == goal2) then
    count = [count, i.to_s(2).count('1')].min
  end
}
puts count
