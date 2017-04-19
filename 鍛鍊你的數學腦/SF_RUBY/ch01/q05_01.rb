cnt = 0
(0..2).each{|coin500|        # 500元硬幣最多2個
  (0..10).each{|coin100|     # 100硬幣は最多10個
    (0..15).each{|coin50|    # 50硬幣は最多15個
      (0..15).each{|coin10|  # 10硬幣は最多15個
        if coin500 + coin100 + coin50 + coin10 <= 15 then
          if coin500 * 500 + coin100 * 100 +
             coin50 * 50 + coin10 * 10 == 1000 then
            cnt += 1
          end
        end
      }
    }
  }
}
puts cnt
