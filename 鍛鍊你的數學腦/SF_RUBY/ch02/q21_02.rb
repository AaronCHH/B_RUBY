count = 0     # 「0」出現的次數
line = 1      # 目前的行數
row = 1       # 現在的行的值（位元串）

while count < 2014 do
  row ^= row << 1     # 根據前一行的排他性邏輯和設定下一行的數字
  count += row.to_s(2).count("0")    # 計算「0」的個數
  line += 1
end

puts line        # 輸出第2014個0的行
