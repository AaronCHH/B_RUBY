n = 14
# 設定初始狀態的人數(a, b, c的人數 ＋ 老師打電話的次數)
status = [[n, 0, 0, 0]]
step = 0 # 經過時間
while status.select{|s| s[1] == n}.size == 0 do
  # 直到所有學生都變成不需聯絡的(b)狀態之前，不斷地搜尋
  next_status = []
  status.each{|s|
    (s[1] + 1).times{|b|
      # 不需要聯絡的學生聯絡其他學生的人數
      (s[2] + 1).times{|c|
        # 需要聯絡的學生聯絡他人的人數
        if s[2] > 0 then # 還有能打電話的學生時
          # 從學生打電話給老師，而老師還能接電話
          if s[0]-b-c+1 >= 0 then
            next_status << [s[0]-b-c+1, s[1]+c, s[2]+b-1, s[3]+1]
          end
        end
        #沒有老師可打電話
        if s[0]-b-c >= 0 then
          next_status << [s[0]-b-c, s[1]+c, s[2]+b, s[3]]
        end
        # 從老師打電話，還有學生需要接電話
        if s[0]-b-c-1 >= 0 then
          next_status << [s[0]-b-c-1, s[1]+c+1, s[2]+b, s[3]+1]
        end
      }
    }
  }
  status = (next_status - status).uniq
  step += 1
end
# 顯示經過時間
puts step
# 在經過時間最短的模式裡，顯示老師打電話打最少次的次數
p status.select{|s| s[1] == n}.min{|a, b| a[3] <=> b[3]}
