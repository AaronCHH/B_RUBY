N = 10      # 樓梯的階數
STEPS = 4   # 一口氣前進的階數

dp = Array.new(N + 1, 0)     # 統計於t次的移動之中，移動的位置
cnt = 0
dp[N] = 1                    # 設定初始值

N.times{|i|                  # 移動次數(N的最大數)
  (N + 1).times{|j|          # 移動起點的樓梯
    (1..STEPS).each{|k|
      break if k > j
      dp[j - k] += dp[j]
    }
    dp[j] = 0                # 清除移動起點
  }
  cnt += dp[0] if i % 2 == 1 # 於偶數次的移動中到達相反的位置
}
puts cnt
