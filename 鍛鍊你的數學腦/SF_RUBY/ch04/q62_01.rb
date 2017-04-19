require 'date'
WEEKS, DAYS = 6, 7

# 匯入國定假日檔案
@holiday = IO.readlines("q63.txt").map{|h|
  h.split('/').map(&:to_i)
}

# 計算月曆內側最大長方形的面積
def max_rectangle(cal)
  rect = 0
  WEEKS.times{|sr|          # 起點的列
    DAYS.times{|sc|         # 起點的欄
      sr.upto(WEEKS){|er|   # 終點的列
        sc.upto(DAYS){|ec|  # 終點的欄
          is_weekday = true # 檢查起點與終點內部是否挾雜非平日的日期
          sr.upto(er){|r|
            sc.upto(ec){|c|
              is_weekday = false if cal[c + r * DAYS] == 0
            }
          }
          if is_weekday then
            rect = [rect, (er - sr + 1) * (ec - sc + 1)].max
          end
        }
      }
    }
  }
  rect
end

# 指定年月、取得面積
def calc(y, m)
  cal = Array.new(WEEKS * DAYS, 0)
  first = wday = Date.new(y, m, 1).wday # 取得1號的星期
  Date.new(y, m, -1).day.times{|d|      # 以該月的天數重覆執行
    if 1 <= wday && wday <= 5 && !@holiday.include?([y, m, d + 1])
      cal[first + d] = 1
    end
    wday = (wday + 1) % DAYS
  }
  max_rectangle(cal)
end

yyyymm = [*2006..2015].product([*1..12])
puts yyyymm.map{|y ,m| calc(y, m)}.inject(:+)
