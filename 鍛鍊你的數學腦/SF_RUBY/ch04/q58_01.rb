# 人數
@n = 8
# 最短移動距離
@min_step = 98
# 目標
@goal = []
(1..@n).each{|i|
  @goal << (1..@n).to_a.reverse.rotate(i)
}

def search(child, oni, oni_pos, step, log)
  if oni == 0 then           # 一開始，鬼先站在圈外
    if @goal.include?(child) then
      puts "#{step} #{log}"  # 顯示移動距離與鬼原本坐的位置
      @min_step = [step, @min_step].min
      return
    end
  end
  (1..(@n - 1)).each{|i|       # 從鬼的目前位置依序搜尋
    if step + @n + i <= @min_step then
      next_child = child.clone
      pos = (oni_pos + i) % @n # 鬼的下一個位置
      next_child[pos] = oni    # 鬼坐下來
      next_oni = child[pos]    # 下一個鬼走到圈外
      search(next_child, next_oni, pos,
             step + @n + i, log + pos.to_s)
    end
  }
end

# 一開始鬼先坐進1的位置
search([0] + (2..@n).to_a, 1, 0, @n, "0")
