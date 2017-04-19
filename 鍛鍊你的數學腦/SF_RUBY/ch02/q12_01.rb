# 包含整數部分
i = 1
while i += 1
  # 刪除小數點，取得左側數來的10個字元
  str = ('%10.10f'%Math.sqrt(i)).sub('.','')[0..9]
  # 刪除重覆的字元後，若達到10個字元就結束程式
  break if str.split('').uniq.length == 10
end
puts i

# 只有小數點的情況
i = 1
while i += 1
  # 在小數點的位置分割，並篩選出小數點的部分
  str = ('%10.10f'%Math.sqrt(i)).split('.')[1]
  # 挑除小數點重複的部分後，若達到10個字元就結束程式
  break if str.split('').uniq.length == 10
end
puts i
