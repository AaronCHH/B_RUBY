require 'prime'

primes = Prime.take(6)        # 可放進a〜f裡的6個質數
min = primes[-1] * primes[-1] # 最大不會超過最大數字的平方
min_friend = []

primes.permutation{|prime|    # 6個質數依序排列
  # 從中選兩個數字相乘
  friends = prime.each_cons(2).map{|x, y| x * y}
  # 開頭與結尾都是相同數字的平方
  friends += [prime[0], prime[-1]].map{|x| x * x}
  if min > friends.max then   # 最小的數字更新的情況
    min = friends.max
    min_friend = friends
  end
}

puts min
p min_friend
