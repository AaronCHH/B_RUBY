# 定義代表0〜9的位元
bit = [0b1111110, 0b0110000, 0b1101101, 0b1111001, 0b0110011,
       0b1011011, 0b1011111, 0b1110000, 0b1111111, 0b1111011]

# 事先算出排他性邏輯和的結果
flip = Array.new(10)
(0..9).each{|i|
  flip[i] = Array.new(10)
  (0..9).each{|j|
    flip[i][j] = (bit[i]^bit[j]).to_s(2).count("1")
  }
}

# 將每次讓所有位元反轉的值設定為初始值
min = 63
(0..9).to_a.permutation.each{|seq|
  sum = 0
  (seq.size - 1).times{|j|
    # 取得事先儲存的值
    sum += flip[seq[j]][seq[j+1]]
    break if min <= sum
  }
  min = sum if sum < min
}
puts min
