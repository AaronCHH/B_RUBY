# 從11開始搜尋
num = 11
while true
  if num.to_s == num.to_s.reverse &&
     num.to_s(8) == num.to_s(8).reverse &&
     num.to_s(2) == num.to_s(2).reverse
    puts num
    break
  end
  # 為了只搜尋奇數每次加2
  num += 2
end