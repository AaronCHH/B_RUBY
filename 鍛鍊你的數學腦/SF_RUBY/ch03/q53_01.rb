N = 11
cards = [0] * N * 2      # 卡片的初始值
@count = 0

def search(cards, num)
  if num == N + 1 then   # 配置到最後就算成功
    @count += 1
  else
    # 一邊確認能否繼續配置卡片，一邊依序配置
    (2 * N - 1 - num).times{|i|
      if cards[i] == 0 && cards[i + num + 1] == 0 then
        # 還能配置卡片時繼續配置卡片，並以遞迴的方式繼續搜尋
        cards[i], cards[i + num + 1] = num, num
        search(cards, num + 1)
        cards[i], cards[i + num + 1] = 0, 0
      end
    }
  end
end

search(cards, 1)         # 一開始先配置「1」的卡片
puts @count
