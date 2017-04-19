# 取得下一個點數
def next_dice(dice)
  right = dice.slice!(0..(dice[0].to_i - 1)).tr('123456','654321')
  dice += right
end

count = 0
(6**6).times{|i|
  # 改以6進位表現時，加上「111111」，讓數字轉換成1〜6
  dice = (i.to_s(6).to_i + 111111).to_s
  check = Hash.new
  j = 0

  # 在數字重覆出現之前，繼續搜尋下一個點數
  while !check.has_key?(dice) do
    check[dice] = j
    dice = next_dice(dice)
    j += 1
  end

  # 確認數字重覆的位置，計算不重覆的數字
  count += 1 if check[dice] > 0
}
puts count
