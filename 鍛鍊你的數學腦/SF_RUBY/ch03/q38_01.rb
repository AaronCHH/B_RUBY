# 設定反轉的遮罩
mask = Array.new(16)
4.times{|row|
  4.times{|col|
    mask[row * 4 + col] =
      (0b1111 << (row * 4)) | (0b1000100010001 << col)
  }
}

max = 0
# 儲存步驟數的陣列
steps = Array.new(1 << 16, -1)
# 從所有格眼都為白色開始
steps[0] = 0
# 調査對象的陣列
scanner = [0]
while scanner.size > 0 do
  check = scanner.shift
  next_steps = steps[check] + 1
  16.times{|i|
    n = check ^ mask[i]
    # 未確認時，繼續調查
    if steps[n] == -1 then
      steps[n] = next_steps
      scanner.push(n)
      max = next_steps if max < next_steps
    end
  }
end

puts max # 最大步驟數
puts steps.index(max).to_s(2) # 初始狀態的格眼：全部都是黑色
p steps.select{|i| i == -1} # 沒有不能轉換成白色的初始狀態
