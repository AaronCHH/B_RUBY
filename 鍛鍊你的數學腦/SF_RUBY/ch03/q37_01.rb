# 定義代表0〜9的位元
bit = [0b1111110, 0b0110000, 0b1101101, 0b1111001, 0b0110011,
       0b1011011, 0b1011111, 0b1110000, 0b1111111, 0b1111011]

# 將每次讓所有位元反轉的值設定為初始值
min = 63

# 針對0〜9的順序搜尋切換次數較少的情況
(0..9).to_a.permutation.each{|seq|
  sum = 0
  (seq.size - 1).times{|j|
    # 計算排他性邏輯和，計算為1的位元數
    sum += (bit[seq[j]]^bit[seq[j+1]]).to_s(2).count("1")
    break if min <= sum
  }
  min = sum if min > sum
}
puts min
