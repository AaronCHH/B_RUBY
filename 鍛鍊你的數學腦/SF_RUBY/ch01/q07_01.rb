# 匯入操作日期的Date類別
require 'date'

# 設定篩選的日期範圍
term = Date.parse('19641010')..Date.parse('20200724')

# 數值化
term_list = term.map{|d|d.strftime('%Y%m%d').to_i}

# 輸出與處理結果相同的值
puts term_list.select{|d|d==d.to_s(2).reverse.to_i(2)}
