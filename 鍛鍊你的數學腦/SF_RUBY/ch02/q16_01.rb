MAX = 500

answer = []
(1..MAX/4).each{|c|           # 正方形的一邊
  edge = (1..(c-1)).to_a.map{|tate| tate * (2 * c - tate)}
  edge.combination(2){|a, b|  # 長方形的面積
    if a + b == c * c then
      answer.push([1, b / a.to_f, c * c / a.to_f])
    end
  }
}
answer.uniq!                  # 排除整數倍的長度
puts answer.size
