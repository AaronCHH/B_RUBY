# 將魔方陣儲存至陣列
magic_square = [1, 14, 14, 4, 11, 7, 6, 9,
                8, 10, 10, 5, 13, 2, 3, 15]

# 統計用的j雜湊(hash)
sum = Hash.new(0)
1.upto(magic_square.size){|i|
  # 搜尋所有組合
  magic_square.combination(i){|set|
    # 將組合的總和儲存至雜湊
    sum[set.inject(:+)] += 1
  }
}

# 輸出總和最大的結果
puts sum.max{|x, y| x[1] <=> y[1]}
