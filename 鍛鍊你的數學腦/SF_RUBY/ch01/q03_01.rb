# 卡片的初始化
N = 100
cards = Array.new(N, false)

# 從2〜N翻面
(2..N).each{|i|
  j = i - 1
  while (j < cards.size) do
    cards[j] = !cards[j]
    j += i
  end
}

# 輸出翻為背面的卡片
N.times{|i|
  puts i + 1 if !cards[i]
}
