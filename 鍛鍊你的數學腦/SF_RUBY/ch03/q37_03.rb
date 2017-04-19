# 定義代表0〜9的位元
bit = [0b1111110, 0b0110000, 0b1101101, 0b1111001, 0b0110011,
       0b1011011, 0b1011111, 0b1110000, 0b1111111, 0b1111011]

# 先行算出排他性邏輯和的結果
@flip = Array.new(10)
(0..9).each{|i|
  @flip[i] = Array.new(10)
  (0..9).each{|j|
    @flip[i][j] = (bit[i]^bit[j]).to_s(2).count("1")
  }
}

# 將每次讓所有位元反轉的值設定為初始值る
@min = 63

# 遞迴搜尋
# is_used : 判斷各數字是否使用過
# sum : 使用過的數字的反轉數
# prev : 前次使用的數字
def search(is_used, sum, prev)
  if is_used.count(false) == 0 then
    @min = sum
  else
    10.times{|i|
      if !is_used[i] then
        is_used[i] = true
        next_sum = 0
        next_sum = sum + @flip[prev][i] if prev >= 0
        search(is_used, next_sum, i) if @min > next_sum
        is_used[i] = false
      end
    }
  end
end
search(Array.new(10, false), 0, -1)
puts @min
