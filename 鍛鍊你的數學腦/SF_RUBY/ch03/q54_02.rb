N = 10

# 傳回疊加之後的移動量
def move(bit, add)
  base = 0
  N.times{|i|
    base += i + 1 if (bit & (1 << i)) > 0
  }

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

@memo = Hash.new(0)
@memo[(1 << N) - 1] = 0

# 計算加到10的時候，移動量為最少的情況
def search(bit)
  return @memo[bit] if @memo.has_key?(bit)
  min = 1000
  N.times{|i|
    if bit & (1 << i) == 0 then
      min = [min, move(bit, i + 1) + search(bit | (1 << i))].min
    end
  }
  @memo[bit] = min
end

puts search(0)
