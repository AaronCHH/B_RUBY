# 共有6對
PAIR = 6

# 設定開始與結束
start = (1..PAIR * 2 - 1).to_a + [0]
goal = [0] + (2..PAIR * 2 - 1).to_a + [1]

# 取得可以丟球的列表
def throwable(balls)
  result = []
  balls.each{|ball|
    c = ball.index(0)                     # 取得接球手的位置
    p = (c + PAIR) % (PAIR * 2)           # 計算接球手的正面
    [-1, 0, 1].each{|d|                   # 正面與左右兩側
      if (p + d) / PAIR == p / PAIR then
        ball[c], ball[p + d] = ball[p + d], ball[c]
        result.push(ball.clone)           # 設定丟球的結果
        ball[c], ball[p + d] = ball[p + d], ball[c]
      end
    }
  }
  result
end

# 設定初始狀態
balls = [start]
log = [start]
cnt = 0
# 執行寬度優先搜尋
while !balls.include?(goal) do
  next_balls = throwable(balls)  # 取得下一步
  balls = next_balls - log       # 選擇之前沒出現過的模式
  log |= next_balls              # 新增丟球結果
  cnt += 1
end
puts cnt
