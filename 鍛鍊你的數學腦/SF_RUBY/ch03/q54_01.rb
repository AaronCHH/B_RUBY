# 傳回疊加之後的移動量
def move(base, add)
  # 確認十位數的5的算珠位置
  a0, a1 = (base + add).divmod(50)
  b0, b1 = base.divmod(50)

  # 確認十位數的1的算珠位置
  a2, a3 = a1.divmod(10)
  b2, b3 = b1.divmod(10)

  # 確認個位數的算珠位置
  a4, a5 = a3.divmod(5)
  b4, b5 = b3.divmod(5)

  # 根據所有位置的差異疊加移動量
  (a0 - b0).abs + (a2 - b2).abs + (a4 - b4).abs + (a5 - b5).abs
end

# 針對移動列表總和移動量
def count(list)
  cnt = total = 0
  list.each{|i|
    cnt += move(total, i)
    total += i
  }
  cnt
end

# 針對1〜10的順序計算最少的移動量
min = 100
(1..10).to_a.permutation(10){|s|
  min = [min, count(s)].min
}
puts min
