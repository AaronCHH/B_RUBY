require 'date'
WEEKS, DAYS = 6, 7

# 匯入國定假日檔案
@holiday = IO.readlines("q63.txt").map{|h|
  h.split('/').map(&:to_i)
}

# 計算月曆內側最大長方形的面積
def max_rectangle(cal)
  s = 0
  WEEKS.times{|row|
    DAYS.times{|left|
      (left..(DAYS - 1)).each{|right|
        # 算出高度
        h = (left..right).map{|w| cal[w + row * DAYS]}
        # 以高度的最小值與寬度算出面積
        s = [s, h.min * (right - left + 1)].max
      }
    }
  }
  s
end

# 指定年月、取得面積
def calc(y, m)
  cal = Array.new(WEEKS * DAYS, 0)
  first = wday = Date.new(y, m, 1).wday # 取得1號的星期
  Date.new(y, m, -1).day.times{|d|      # 以該月的天數重覆執行
    if 1 <= wday && wday <= 5 && !@holiday.include?([y, m, d + 1])
      # 上方的平日天數為何？
      cal[first + d] = cal[first + d - DAYS] + 1
    end
    wday = (wday + 1) % DAYS
  }
  max_rectangle(cal)
end

yyyymm = [*2006..2015].product([*1..12])
puts yyyymm.map{|y ,m| calc(y, m)}.inject(:+)
