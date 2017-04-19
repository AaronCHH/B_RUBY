# 計算陣列的直積
def product(ary)
  result = ary[0]
  1.upto(ary.size - 1){|i|
    result = result.product(ary[i])
  }
  result.map{|r| r.flatten}
end

# 算出並聯的電阻值
def parallel(ary)
  #1.0 / ary.map{|i| 1.0 / i}.inject(:+)
  Rational(1, ary.map{|i| Rational(1, i)}.inject(:+))
end

@memo = {1 => [1]}
def calc(n)
  return @memo[n] if @memo.has_key?(n)
  # 串聯
  result = calc(n - 1).map{|i| i + 1}
  # 並聯
  2.upto(n){|i|
    # 設定並聯時的分組個數
    cut = {}
    (1..(n - 1)).to_a.combination(i - 1){|ary|
      pos = 0
      r = []
      ary.size.times{|j|
        r.push(ary[j] - pos)
        pos = ary[j]
      }
      r.push(n - pos)
      cut[r.sort] = 1
    }
    # 以遞廽的方式在分組的位置設定電阻
    keys = cut.keys.map{|c|
      c.map{|e| calc(e)}
    }
    # 計算電阻值
    keys.map{|k| product(k)}.each{|k|
      k.each{|vv| result.push(parallel(vv))}
    }
  }
  @memo[n] = result
end

golden_ratio = 1.61800339887
min = Float::INFINITY
calc(10).each{|i|
  min = i if (golden_ratio - i).abs < (golden_ratio - min).abs
}
puts sprintf("%.10f", min)
puts min
