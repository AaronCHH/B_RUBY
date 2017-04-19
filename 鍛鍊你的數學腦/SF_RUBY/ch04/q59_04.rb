# 設定大小
W, H = 4, 4
#  線是從格點上下左右哪個方向突出
# U: 上, D: 下, L: 左, R: 右
U, D, L, R = 0b1000, 0b0100, 0b0010, 0b0001

# 因為位於內側，所以列與欄的格點數量各減1
@width, @height = W - 1, H - 1
# 設定可能出現的格點形狀
@dir = [U|D, L|R, U|D|L, U|D|R, U|L|R, D|L|R, U|D|L|R, 0b0]
@row = {}

# 建立一列之中上下連線的方式
def make_row(cell)
  if cell.size == @width then   # 一列建立完成的時候
    u = cell.map{|l| l & U > 0} # 線條往上方突出的位置(T/F)
    d = cell.map{|l| l & D > 0} # 線條往下方突出的位置(T/F)
    if @row.has_key?(u) then
      @row[u][d] = @row[u].fetch(d, 0) + 1
    else
      @row[u] = {d => 1}
    end
    return
  end
  @dir.each{|d|
    # 假設左端或來自左側的線條與來自右側的線條一致
    if (cell.size == 0) ||
       ((d & L > 0) == (cell.last & R > 0)) then
      make_row(cell + [d])
    end
  }
end

make_row([])

# 加總在第一列裡線條往下方突出的模式種類
count = Hash.new(0)
@row.each{|up, down|
  down.each{|k, v| count[k] += v }
}

# 加總第2列之後，與前一列連線的模式種類
h = 1
while h < @height do
  new_count = Hash.new(0)
  count.each{|bar, cnt|
    @row[bar].each{|k, v| new_count[k] += cnt * v }
  }
  h += 1
  count = new_count
end

p count.inject(0){|sum, (k, v)| sum + v}
