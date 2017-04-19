N = 12

def move(log)
  # 連同最初的位置一併搜尋，若是搜尋到N+1個就停止搜尋
  return 1 if log.size == N + 1

  cnt = 0
  # 往前後左右移動
  [[0, 1], [0, -1], [1, 0], [-1, 0]].each{|d|
    next_pos = [log[-1][0] + d[0], log[-1][1] + d[1]]
    # 若搜尋尚未完成就繼續讓機器人移動
    if !log.include?(next_pos) then
      cnt += move(log + [next_pos])
    end
  }
  cnt
end

puts move([[0, 0]])
