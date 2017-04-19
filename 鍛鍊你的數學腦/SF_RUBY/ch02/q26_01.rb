W, H = 10, 10
# 設定停車站的停車方式（在周圍設定一個形同警衛的「9」）
parking = Array.new(W + 2){Array.new(H + 2){1}}
(W + 2).times{|w|
  parking[w][0] = parking[w][H + 1] = 9
}
(H + 2).times{|h|
  parking[0][h] = parking[W + 1][h] = 9
}

# 終點是作為目標對象的車子移動至左上角的狀態
@goal = Marshal.load(Marshal.dump(parking))
@goal[1][1] = 2

# 起點是作為目標對象的車子位於右下角的狀態
start = Marshal.load(Marshal.dump(parking))
start[W][H] = 2

def search(prev, depth)
  target = []
  prev.each{|parking, w, h|
    # 上下左右移動
    [[-1, 0], [1, 0], [0, -1], [0, 1]].each{|dw, dh|
      nw, nh = w + dw, h + dh
      if (parking[nw][nh] != 9) then
        # 除了警衛以外，判斷是否調查過
        temp = Marshal.load(Marshal.dump(parking))
        temp[w][h], temp[nw][nh] = temp[nw][nh], temp[w][h]
        if !@log.has_key?([temp, nw, nh]) then
          # 未調查過的模式新增至調查目標裡
          target.push([temp, nw, nh])
          @log[[temp, nw, nh]] = depth + 1
        end
      end
    }
  }
  return if target.include?([@goal, W, H])
  # 以寬度優先搜尋的方式調查
  search(target, depth + 1) if target.size > 0
end

# 記錄搜尋結果
@log = {}
@log[[start, W, H - 1]] = 0
@log[[start, W - 1, H]] = 0
# 從起點開始搜尋
search([[start, W, H - 1], [start, W - 1, H]], 0)
# 輸出到達終點的搜尋次數
puts @log[[@goal, W, H]]
