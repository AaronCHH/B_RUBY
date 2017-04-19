require "prime"

# 取得3位數的質數
primes = Prime.each(1000).select{|i| i >= 100}

# 以開頭的位數建立雜湊
prime_h = {0 => []}
primes.chunk{|c| c / 100}.each{|k, v|
  prime_h[k] = v
}

cnt = 0
primes.each{|r1|                                   # 第1列
  prime_h[r1 / 100].each{|c1|                      # 第1排
    prime_h[(c1 % 100) / 10].each{|r2|             # 第2列
      prime_h[(r1 % 100) / 10].each{|c2|           # 第2排
        if (r2 % 100) / 10 == (c2 % 100) / 10 then # 中央點
          prime_h[c1 % 10].each{|r3|               # 第3列
            if c2 % 10 == (r3 % 100) / 10 then
              c3 = (r1 % 10) * 100 + (r2 % 10) * 10 + (r3 % 10)
              if primes.include?(c3) then          # 第3排是否為質數
                cnt += 1 if [r1, r2, r3, c1, c2, c3].uniq.size == 6
              end
            end
          }
        end
      }
    }
  }
}
puts cnt
