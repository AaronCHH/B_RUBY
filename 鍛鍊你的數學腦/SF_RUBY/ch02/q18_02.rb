def check(last_n, used, list)
  # 全部使用過後，與開頭的「1」成為平方數就結束程式
  return [1] if used.all? && (list[1].include?(last_n))
  list[last_n].each{|i|           # 依序嘗試候補的數字
    if used[i - 1] == false then  # 尚未使用的情況
      used[i - 1] = true
      result = check(i, used, list)
      # 找到時，該值加1再傳回
      return [i] + result if result.size > 0
      used[i - 1] = false
    end
  }
  []
end

n = 2
while true do
  square = (2..Math.sqrt(n * 2).floor).map{|i| i ** 2}
  # 建立可能相鄰的候補數字
  list = {}
  (1..n).each{|i|
    list[i] = square.map{|s| s - i}.select{|s| s > 0}
  }
  # 設定「1」已使用過，並從「1」開始搜尋
  result = check(1, [true] + [false] * (n - 1), list)
  break if result.size > 0
  n += 1
end
puts n
p result
