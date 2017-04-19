N = 11
cards = [0] * N * 2
@count = 0

def search(cards, num)
  if num == 0 then        # 將最後的判斷變更為0
    @count += 1
  else
    (2 * N - 1 - num).times{|i|
      if cards[i] == 0 && cards[i + num + 1] == 0 then
        cards[i], cards[i + num + 1] = num, num
        search(cards, num - 1)  # 因為是從數字大的卡片開始，所以是用減的
        cards[i], cards[i + num + 1] = 0, 0
      end
    }
  end
end

search(cards, N)          # 一開始先配置數字最大的卡片
puts @count
