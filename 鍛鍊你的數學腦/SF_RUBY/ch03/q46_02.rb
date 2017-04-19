N = 4

def search(rows)
  return 1 if rows.size == N     # 所有的列都搜尋過之後結束程式
  count = 0
  (2**N).times{|row|
    # 檢查4個角落是否呈○×交互配置的情況
    cross = rows.select{|r| (row & ~r) > 0 && (~row & r) > 0}
    count += search(rows + [row]) if cross.count == 0
  }
  count
end

puts search([])
