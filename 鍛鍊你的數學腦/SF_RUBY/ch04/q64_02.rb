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
fw = [start]
fw_log = [start]
bw = [goal]
bw_log = [goal]
cnt = 0

# 雙向進行寬度優先搜尋
while true do
  next_fw = throwable(fw)      # 於順向的情況取得下一個步驟
  fw = next_fw - fw_log        # 選擇之前沒出現過的模式
  fw_log |= next_fw            # 新增丟球結果
  cnt += 1
  break if (fw & bw).size > 0  # 狀態相同就結束程式

  next_bw = throwable(bw)      # 於逆向的情況取得下一個步驟
  bw = next_bw - bw_log        # 選擇之前沒出現過的模式
  bw_log |= next_bw            # 新增丟球結果
  cnt += 1
  break if (fw & bw).size > 0  # 狀態相同就結束程式
end
puts cnt
