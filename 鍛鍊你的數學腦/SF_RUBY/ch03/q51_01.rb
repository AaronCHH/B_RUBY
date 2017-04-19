N = 8 # 砂漏的數量
GOAL = [1] * N # 所有都為1，就會發生砂子同時流到下方的情況

count = 0
(1..N).to_a.permutation{|init| # 依照正向順序設定初始狀態
  hourglass = init
  pos = 0
  log = {} # 確認是否為相同狀態的歷程記錄
  while log[hourglass] != pos  # 若是曾經出現相同狀態就結束
    if hourglass == GOAL then  # 到達目標排列方式就結束
      count += 1
      break
    end
    log[hourglass] = pos

    # 減少砂漏（若沒有殘餘的砂漏就保持不變）
    hourglass = hourglass.map{|h| h > 0 ? h - 1 : 0}
    init[pos].times{|i|        # 顛倒砂漏
      rev = (pos + i) % N
      hourglass[rev] = init[rev] - hourglass[rev]
    }
    pos = (pos + 1) % N        # 往下一個位置移動
  end
}

puts count
