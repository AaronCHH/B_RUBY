N = 7
checked = {(1..N).to_a => 0} # 檢查完畢的陣列
check = [(1..N).to_a]        # 檢查對象
depth = 0                    # 交換次數

while check.size > 0 do      # 在檢查對象還存在時，持續檢查
  next_check = []
  (0..(N-1)).to_a.combination(2){|i, j|  # 選擇兩個位置交換
    check.each{|c|
      d = c.clone
      d[i], d[j] = d[j], d[i]
      if !checked.has_key?(d) then
        checked[d] = depth + 1
        next_check << d
      end
    }
  }
  check = next_check
  depth += 1
end

puts checked.values.inject(:+)
