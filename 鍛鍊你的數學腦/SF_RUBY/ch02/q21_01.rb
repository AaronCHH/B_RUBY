count = 0     # 「0」出現的次數
line = 1      # 目前的行數
row = [1]     # 目前的行的值

while count < 2014 do
  next_row = [1]
  # 根據上一行的數字以及排他性邏輯和設定下一行的數字
  (row.size - 1).times{|i|
    cell = row[i] ^ row[i + 1]
    next_row.push(cell)
    count += 1 if cell == 0  # 若為「0」就納入計次
  }
  next_row.push(1)
  line += 1                  # 增加行數，繼續下一行的計算
  row = next_row
end

puts line        # 輸出第2014個0的行


