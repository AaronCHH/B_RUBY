# 匯入操作日期的Date類別
require 'date'

# 在題目規定的日期期間，從二進位的第五個字篩選出8個字元
from_left = 19641010.to_s(2)[4,8].to_i(2)
to_left   = 20200724.to_s(2)[4,8].to_i(2)
# 將左右的8個字元寫成迴圈
from_left.upto(to_left){|i|
  l = "%08b" % i   # 左側
  r = l.reverse    # 右側
  (0..1).each{|m|  # 中央
    value = "1001#{l}#{m}#{r}1001"
    begin
      puts Date.parse(value.to_i(2).to_s).strftime('%Y%m%d')
      rescue       # 忽略無效的日期
    end
  }
}
