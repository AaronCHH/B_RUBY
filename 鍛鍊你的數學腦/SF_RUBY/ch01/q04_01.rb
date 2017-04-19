def cutbar(m, n, current) # current為現在的棒子數量
  if current >= n then
    0 # 切完
  elsif current < m then
    1 + cutbar(m, n, current * 2) # 下次為現在的2倍
  else
    1 + cutbar(m, n, current + m) # 只追加剪刀的數量
  end
end

puts cutbar(3, 20, 1)
puts cutbar(5, 100, 1)
