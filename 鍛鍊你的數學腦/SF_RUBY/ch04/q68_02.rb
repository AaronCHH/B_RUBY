W, H = 5, 6
ALL = (1 << W) - 1
# 儲存各列的男生人數
@boys = (0..ALL).map{|i| i.to_s(2).count("1")}

# 3列的座位組合是否符合條件(設定上面2列後，下1列是否能繼續配置)
def check(r1, r2, r3)
  result = true
  W.times{|i|                      # 確認1列的各個位置
    m1 = (0b111 << (i - 1)) & ALL  # 確認是否左右是否並排
    m2 = 1 << i                    # 確認是否上下是否並排
    if (r1 & m2 == m2) && (r2 & m1 == m1) && (r3 & m2 == m2) then
      result = false               # 男生並排時NG
    end
    if ((r1 ^ ALL) & m2 == m2) && ((r2 ^ ALL) & m1 == m1) &&
       ((r3 ^ ALL) & m2 == m2) then
      result = false               # 女生並排時也NG
    end
  }
  result
end

# 建立接在上面2列後面的下1列的雜湊
@next = {}
(1 << W).times{|r1|       # 第1列
  (1 << W).times{|r2|     # 第2列
    @next[[r1, r2]] = (0..ALL).select{|r3| check(r1, r2, r3)}
  }
}

@memo = {}
def search(pre1, pre2, line, used)
  if @memo.has_key?([pre1, pre2, line, used]) then
    return @memo[[pre1, pre2, line, used]] # 已搜尋過的情況
  end

  if line >= H then                        # 搜尋到最後一列
    @memo[[pre1, pre2, line, used]] = (used == W*H/2)?1:0
    return @memo[[pre1, pre2, line, used]]
  end
  result = 0
  if line == H - 1 then                    # 最後一列之前
    @next[[pre2, pre1]].each{|row|
      if (@next[[row, row]].include?(pre1)) &&
        (used + @boys[row] <= W * H / 2) then
        result += search(row, pre1, line + 1, used + @boys[row])
      end
    }
  else                                     # 最後一列之外
    @next[[pre2, pre1]].each{|row|
      if used + @boys[row] <= W * H / 2 then
        result += search(row, pre1, line + 1, used + @boys[row])
      end
    }
  end
  @memo[[pre1, pre2, line, used]] = result
end

count = 0
(1 << W).times{|r0|                        # 設定第一列
  count += search(r0, r0, 1, @boys[r0])
}
puts count
