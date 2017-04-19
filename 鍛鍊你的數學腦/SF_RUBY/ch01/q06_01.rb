# 確認是否仍在迴圈裡
def is_loop(n)
  # 一開始先乘以3再加1
  check = n * 3 + 1
  # 殺在數字成為1之前不斷讓數字變化
  while check != 1 do
    check = check.even? ? check / 2 : check * 3 + 1
    return true if check == n
  end
  return false
end

# 針對2〜10000的偶數確認
puts 2.step(10000, 2).count{|i|
  is_loop(i)
}
