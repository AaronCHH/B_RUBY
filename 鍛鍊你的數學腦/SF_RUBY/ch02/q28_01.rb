club = [[11000, 40], [8000, 30], [400, 24], [800, 20], [900, 14],
        [1800, 16], [1000, 15], [7000,40], [100, 10], [300, 12]]
N = 150

max = 0
# 依序試著增加選擇的社團數量
1.upto(club.size){|i|
  club.combination(i){|ary|
    # 選取的社團與成員數的總和滿足條件時
    if ary.map{|i| i[1]}.inject(:+) <= N then
      max = [ary.map{|i| i[0]}.inject(:+), max].max
    end
  }
}

puts max
