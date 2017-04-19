# 取得下一個點數
def next_dice(dice)
  top = dice.div(6**5)
  left, right = dice.divmod(6**(5 - top))
  (right + 1) * (6**(top + 1)) - (left + 1)
end

# 記錄找到的值(0:未搜尋、1:不重覆的數字、2:重覆的數字)
all_dice = Array.new(6 ** 6, 0)
(6**6).times{|i|
  if all_dice[i] == 0 then
    check = Array.new
    while (all_dice[i] == 0) && (!check.include?(i)) do
      check << i
      i = next_dice(i)
    end
    index = check.index(i)
    if (index) then # 數字重覆出現時，在該位置之前的皆為不重覆的數字
      check.shift(index).each{|j| all_dice[j] = 1}
      check.each{|j| all_dice[j] = 2}
    else # 找到已經確認過的值之後，就記錄為不重覆的數字
      check.each{|j| all_dice[j] = 1}
    end
  end
}
puts all_dice.count(1)
