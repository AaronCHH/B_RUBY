a = b = 1
count = 0
while (count < 11) do
  c = a + b
  # 將數字的位數拆解出來，再加總各位數
  sum = 0
  c.to_s.split(//).each {|e| sum += e.to_i}
  if (c % sum == 0) then
    # 若是除得盡就輸出答案
    puts c
    count += 1
  end
  a, b = b, c
end
