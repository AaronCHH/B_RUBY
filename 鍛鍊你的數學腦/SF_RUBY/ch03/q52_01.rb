M, N = 6, 5   # 設定「糖果的包裝紙」與「內容物的糖果」的數量
@memo = {}    # 先儲存計算結果所需的雜湊

def search(candy, color)
  return 1 if candy == [0] * N          # 包起所有糖果
  # 若有事先儲存的計算結果，就使用該計算結果
  return @memo[candy + [color]] if @memo.has_key?(candy + [color])

  # 計算包裝紙與糖果不一致的組合數
  cnt = 0
  candy.size.times{|i|
    if i != (color % candy.size) then   # 不一致的情況
      if candy[i] > 0 then              # 還有糖果沒包起來的情況
        candy[i] -= 1
        cnt += search(candy, color + 1) # 搜尋下一種組合
        candy[i] += 1
      end
    end
  }
  @memo[candy + [color]] = cnt   # 將糖果的數量與顏色先儲存起來
end
puts search([M] * N, 0)
