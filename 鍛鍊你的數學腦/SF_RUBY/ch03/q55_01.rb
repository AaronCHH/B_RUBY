@memo = {}
def cut_cake(w, h, diff)
  # 垂直邊長較長時，長寬互調
  w, h = h, w if w < h
  # 若是有事先儲存的計算結果，就使用該計算結果
  return @memo[[w, h, diff]] if @memo.has_key?([w, h, diff])
  # 搜尋到最後，兩者差距不為1時，就假設為無限大
  if w == 1 && h == 1 then
    return @memo[[w, h, diff]] = (diff == 1)?0:Float::INFINITY
  end

  # 試著沿垂直與水平方向切
  tate = (1..(w/2)).map{|i|
    h + cut_cake(w - i, h, i * h - diff)
  }
  yoko = (1..(h/2)).map{|i|
    w + cut_cake(w, h - i, w * i - diff)
  }
  # 從垂直與水平的切法裡傳回最小值
  @memo[[w, h, diff]] = (tate + yoko).min
end

puts cut_cake(16, 12, 0)
