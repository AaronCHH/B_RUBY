W, H = 6, 5                 # 水平與垂直的格眼數量
USABLE = 2                  # 可使用的次數
@max = 0                    # 最長的長度
@h = Array.new(H + 1, 0)    # 儲存水平線的使用次數
@v = Array.new(W + 1, 0)    # 儲存垂直線的使用次數

def search(x, y)
  if (x == W) && (y == H) then # 到達B的時候，確認為最大值並且結束程式
    @max = [@h.inject(:+) + @v.inject(:+), @max].max
    return
  end
  if @h[y] < USABLE then    # 可往水平方向移動時
    if x > 0 then           # 往左移動
      @h[y] += 1
      search(x - 1, y)
      @h[y] -= 1
    end
    if x < W then           # 往右移動
      @h[y] += 1
      search(x + 1, y)
      @h[y] -= 1
    end
  end
  if @v[x] < USABLE then    # 可往垂直方向移動時
    if y > 0 then           # 往上移動
      @v[x] += 1
      search(x, y - 1)
      @v[x] -= 1
    end
    if y < H then           # 往下移動
      @v[x] += 1
      search(x, y + 1)
      @v[x] -= 1
    end
  end
end

search(0, 0)                # 從A的位置開始移動
puts @max
