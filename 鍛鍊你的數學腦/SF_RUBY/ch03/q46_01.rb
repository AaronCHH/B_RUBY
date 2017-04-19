N = 4
@count = Hash.new(0)

def search()
  # 以數值設定各列
  (0..(2**N-1)).to_a.repeated_permutation(N).each{|rows|
    # 計算各排的「○」的個數
    col_count = Array.new(N, 0)
    N.times{|c|
      rows.each{|r|
        col_count[c] += 1 if (r & (1 << c) > 0)
      }
    }
    # 計算各列的「○」的個數
    row_count = rows.map{|r| r.to_s(2).count("1")}
    # 於雜湊裡以列與排的次數計算
    @count[row_count + col_count] += 1
  }
end

search()
# 輸出只有一種配置方式的模式
puts @count.select{|k, v| v == 1}.count
