N = 16
def graycode(value)
  # 將n進位拆解至各位數的陣列
  digits = []
  while value > 0
    digits << value % N
    value /= N
  end

  # 將各位數轉換成格雷碼
  (digits.size - 1).times{|i|
    digits[i] = (digits[i] - digits[i + 1]) % N
  }
  # 將陣列轉換成數值
  digits.each_with_index.map{|d, i| d * (N**i)}.inject(:+)
end

# 回到原始值之前不斷搜尋
def search(value)
  check = graycode(value)
  cnt = 1
  while check != value do
    check = graycode(check)
    cnt += 1
  end
  cnt
end

puts search(0x808080)
puts search(0xabcdef)
