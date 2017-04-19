# 盤面設定
@board = Array.new(11).map!{Array.new(11)}
(0..10).each{|i|
  (0..10).each{|j|
    @board[i][j] = (i == 0) || (i == 10) || (j == 0) || (j == 10)
  }
}

# 統計欄位的初始化
count = 0

# 遞迴式搜尋
def search(x, y, dx, dy)
  return if @board[x][y]
  @check[x * 10 + y] = 1
  search(x + dx, y + dy, dx, dy)
end

# 依序設定飛車與角後進行搜尋
(1..9).each{|hy|
  (1..9).each{|hx|
    (1..9).each{|ky|
      (1..9).each{|kx|
        if (hx != kx) || (hy != ky) then
          @check = Hash.new()
          @board[hx][hy] = @board[kx][ky] = true
          [[-1, 0], [1, 0], [0, -1], [0, 1]].each{|hd|
            search(hx+hd[0], hy+hd[1], hd[0], hd[1])
          }
          [[-1, -1], [-1, 1], [1, -1], [1, 1]].each{|kd|
            search(kx+kd[0], ky+kd[1], kd[0], kd[1])
          }
          @board[hx][hy] = @board[kx][ky] = false
          count += @check.size
        end
      }
    }
  }
}
puts count
