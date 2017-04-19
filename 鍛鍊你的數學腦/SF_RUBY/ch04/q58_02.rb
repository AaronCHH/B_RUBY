@n = 8
# 包含塊
@all = (0..@n).to_a

# 開始時的順序
start = {}
start[(1..@n).to_a] = []

# 結束時的順序
goal = {}
@n.times{|i|
  goal[(1..@n).to_a.reverse.rotate(i)] = []
}

# 計算移動距離
def dist(log)
  return 0 if log.size == 0
  check = log.clone
  pre = check.shift
  sum = @n + pre
  check.each{|c|
    sum += @n + (c + @n - pre) % @n
    pre = c
  }
  sum
end

# 搜尋（direction為true時為順向，為false則為逆向）
def search(child, direction)
  child.clone.each{|key, value|
    oni = (@all - key)[0] # 沒被用到的是鬼
    @n.times{|i|
      k = key.clone
      k[i] = oni
      v = value + [i]
      if child.has_key?(k) then
        if direction then # 順向
          child[k] = v if dist(v) < dist(child[k])
        else              # 逆向
          child[k] = v if dist(v.reverse) < dist(child[k].reverse)
        end
      else
        child[k] = v
      end
    }
  }
end

cnt = 0
while (start.keys & goal.keys).size == 0 do
  if cnt % 2 == 0 then # 偶數時順向搜尋
    search(start, cnt % 2 == 0)
  else                 # 奇數時逆向搜尋
    search(goal, cnt % 2 == 0)
  end
  cnt += 1
end

# 雙向搜尋的結果搜尋到相同位置時，算出最短移動距離
min = 98
(start.keys & goal.keys).each{|c|
  d = dist(start[c] + goal[c].reverse)
  min = [min, d].min
}

puts min
