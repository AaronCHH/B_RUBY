# 將足球世界盃的出賽國家名稱存入陣列
country = ["Brazil", "Croatia", "Mexico", "Cameroon",
           "Spain", "Netherlands", "Chile", "Australia",
           "Colombia", "Greece", "Cote d'Ivoire", "Japan",
           "Uruguay", "Costa Rica", "England", "Italy",
           "Switzerland", "Ecuador", "France", "Honduras",
           "Argentina", "Bosnia and Herzegovina", "Iran",
           "Nigeria", "Germany", "Portugal", "Ghana",
           "USA", "Belgium", "Algeria", "Russia",
           "Korea Republic"]
def search(countrys, prev, depth)
  # 取得接在後面國名之後的國名清單
  next_country = countrys.select{|c| c[0] == prev[-1].upcase}
  if next_country.size > 0 then
    # 若有可接龍的國名，則排除該國再進行遞迴搜尋
    next_country.each{|c|
      search(countrys - [c], c, depth + 1)
    }
  else
    # 若沒有可接續的國名，確認深度是否已達最大
    @max_depth = [@max_depth, depth].max
  end
end

# 從所有的國家開始
@max_depth = 0
country.each{|c|
  search(country - [c], c, 1)
}
# 顯示深度的最大值（用於接龍的國家名稱數)
puts @max_depth
