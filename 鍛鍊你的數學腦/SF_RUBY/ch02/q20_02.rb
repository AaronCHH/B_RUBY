# 將魔方陣儲存至陣列
magic_square = [1, 14, 14, 4, 11, 7, 6, 9,
                8, 10, 10, 5, 13, 2, 3, 15]
sum_all = magic_square.inject(:+)

# 統計用的j雜湊(hash)
sum = Array.new(sum_all + 1){0}
# 初始值（什麼都不加的時候為1個個）
sum[0] = 1
magic_square.each{|n|
  # 從大的數字依序計算
  (sum_all - n).downto(0).each{|i|
    sum[i + n] += sum[i]
  }
}

# 輸出總和最大的結果
puts sum.find_index(sum.max)
