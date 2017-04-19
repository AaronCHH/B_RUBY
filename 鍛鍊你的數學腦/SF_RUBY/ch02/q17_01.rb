# 以文字設定男孩子與女孩子
@boy, @girl = "B", "G"
N = 30

def add(seq)
  # 到達最大排列人數後結束程式
  return 1 if seq.size == N

  # 若人數未滿30人、則思考是否要追加男孩子、最右端為男孩子時追加女孩子
  cnt = add(seq + @boy)
  cnt += add(seq + @girl) if seq[-1] == @boy
  return cnt
end

# 從男孩子與女孩子開始計數
puts add(@boy) + add(@girl)
