# 設定可能擊落2塊板子的擊落方式
board = [[1, 2], [2, 3], [7, 8], [8, 9],
         [1, 4], [3, 6], [4, 7], [6, 9]]
# 追加每次擊落1片板子的擊落方式
1.upto(9){|i|
  board.push([i])
}

@memo = {[] => 1}
def strike(board)
  # 若已搜尋完畢則使用該值
  return @memo[board] if @memo.has_key?(board)
  cnt = 0
  board.each{|b|
    # 排除已擊落的數字
    next_board = board.select{|i| (b & i).size == 0}
    cnt += strike(next_board)
  }
  @memo[board] = cnt
end

puts strike(board)
