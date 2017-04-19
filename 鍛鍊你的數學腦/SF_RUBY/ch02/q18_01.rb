def check(n, pre, log, square)
  if n == log.size then
    # 全部設定完成的情況
    if square.include?(1 + pre) then
      # 1與前一個數的和為平方數的情況
      puts n
      p log
      return true # 只找到一個就結束程式
    end
  else
    ((1..n).to_a - log).each{|i| # 以未使用的數量進行迴圈
      if square.include?(pre + i) then
        # 與前一個數的和為平方數的情況
        return true if check(n, i, log + [i], square)
      end
    }
  end
  false
end

n = 2
while true do
  # 事先算出平方數(最大也只是n的2倍)
  square = (2..Math.sqrt(n * 2).floor).map{|i| i ** 2}
  break if check(n, 1, [1], square)
  n += 1
end
