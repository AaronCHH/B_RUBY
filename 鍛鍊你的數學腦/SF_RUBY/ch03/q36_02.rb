# 取得下一個點數
def next_dice(dice)
  top = dice.div(6**5)
  left, right = dice.divmod(6**(5 - top))
  (right + 1) * (6**(top + 1)) - (left + 1)
end

count = 0
(6**6).times{|i|
  check = Array.new

  # 在數字重覆出現之前，繼續搜尋下一個點數
  while !check.include?(i) do
    check << i
    i = next_dice(i)
  end

  # 確認數字重覆的位置，計算不重覆的數字
  count += 1 if check.index(i) != 0
}
puts count
