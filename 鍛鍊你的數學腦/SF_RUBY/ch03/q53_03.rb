N = 11
@memo = {}

def search(cards, num)
  return 1 if num == 0
  return @memo[cards] if @memo.has_key?(cards)

  # 以位元運算設定夾擊的位置
  mask = (1 << (num + 1)) + 1
  count = 0
  while mask < (1 << (N * 2)) do
    # 若還能配置卡片，就以遞迴的方式繼續搜尋
    count += search(cards | mask, num - 1) if cards & mask == 0
    # 將夾擊的位置移動一位數
    mask <<= 1
  end
  @memo[cards] = count
end

puts search(0, N)
