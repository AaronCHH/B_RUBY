N = 30
boy, girl = 1, 0
N.times{|i|
  # 從n-1人排成一列的狀態計算
  boy, girl = boy + girl, boy
}
puts boy + girl
