N = 10      # 樓梯的階數
STEPS = 4   # 一口氣前進的階數

def move(a, b)
  return 0 if a > b    # 當A先生爬到比B先生還高的位置時結束搜尋
  return 1 if a == b   # 若是停在同一階就停止計數
  cnt = 0
  (1..STEPS).each{|da|
    (1..STEPS).each{|db|
      cnt += move(a + da, b - db) # 遞迴搜尋
    }
  }
  cnt
end

# 將A先生設定成從0的位置開始、並將B先生設定成從N的位置開始
puts move(0, N)
