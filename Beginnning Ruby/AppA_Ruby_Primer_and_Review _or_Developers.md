
# Appendix A: Ruby Primer and Review for Developers
<!-- toc orderedList:0 depthFrom:1 depthTo:6 -->
<!-- tocstop -->


## A.1 The Basics

### A.1.1 Definition and Concepts

* Note A useful resource is the official Ruby site’s “Ruby From Other Languages” section at http://www.ruby-lang.org/en/documentation/ruby-from-other-languages/, where you’ll find in-depth comparisons of Ruby against C, C++, Java, Perl, PHP, and Python.


```ruby
puts 10
```

    10



```ruby
puts 10.class
```

    Fixnum


### A.1.2 The Ruby Interpreter and Running Ruby Code


```ruby
# ruby name_of_script.rb
```


```ruby
# ruby -v
```


```ruby
# ruby -e "puts 2 + 2"
```


```ruby
#!/usr/bin/ruby
puts "Hello, world!"
```

### A.1.3 Interactive Ruby


```ruby
# irb
# irb(main):001:0> puts "test"
# test
# => nil
# irb(main):002:0> 10 + 10
# => 20
# irb(main):003:0> 10 == 20
# => false
# irb(main):004:0> exit

```

## A.2 Expressions and Flow Control

### A.2.1 Basic Expressions


```ruby
"a" + "b" + "c"
```


```ruby
10 + 20 + 30
```


```ruby
("a" * 5) + ("c" * 6)
```


```ruby
a = 10
b = 20
a * b
```

### A.2.2 Class Mismatches


```ruby
# "20" + 10   -- this won't work
```


```ruby
"20" + 10.to_s
```


```ruby
"20".to_i + 10
```

### A.2.3 Comparison Expressions


```ruby
2 == 1
```


```ruby
2 == 2
```


```ruby
(2 == 2) && (1 == 1)
```


```ruby
x = 12
x * 2 == x + 1
```


```ruby
x * x == x ** 2
```


```ruby
(2 == 5) || (1 == 1)
```


```ruby
(2 == 2) && !(1 == 2)
```


```ruby
(2 == 2) && (1 != 2)
```

### A.2.4 Flow

* __Branching and Conditional Execution__


```ruby
puts "The universe is broken!" if 2 == 1
```


```ruby
if 2 == 1
  puts "The universe is broken!"
end
```


```ruby
if 2 == 1
  puts "The universe is broken!"
else
  puts "The universe is okay!"
end
```


```ruby
x = 12
if x == 1 || x == 3 || x == 5 || x == 7 || x == 9
  puts "x is odd and under 10"
elsif x == 2 || x == 4 || x == 6 || x == 8
  puts "x is even and under 10"
else
  puts "x is over 10 or under 1"
end
```


```ruby
fruit = "apple"
color = case fruit
  when "orange"
    "orange"
  when "apple"
    "green"
  when "banana"
    "yellow"
  else
   "unknown"
end
puts color
```

* __The Ternary Operator (Conditional Expressions)__


```ruby
x = 10
puts x > 10 ? "Higher than ten" : "Lower or equal to ten"
```


```ruby
# expression ? true_expression : false_expression
```

* __Loops__


```ruby
i = 0
loop do
  i += 10
  puts i
  break if i > 100
end
```

    10
    20
    30
    40
    50
    60
    70
    80
    90
    100
    110



```ruby
i = 0
while (i < 15)
  i += 1
  next if i % 2 == 0
  puts i
end
```

    1
    3
    5
    7
    9
    11
    13
    15


* Noteuntil is the opposite of ```while.until (i >= 15)``` is equivalent to ```while (i < 15)```

## A.3 Object Orientation


```ruby
puts 10.class
```

### A.3.1 Objects


```ruby
# function1(function2(function3(something)))
```


```ruby
# something.function3.function2.function1
```


```ruby
"this is a test".reverse
```


```ruby
"this is a test".reverse.upcase.split(' ').reverse.join('-')
```

### A.3.2 Classes and Methods


```ruby
class Person
  def initialize(name, age)
    @name = name
    @age = age
  end

  def name
    return @name
  end

  def age
    return @age
  end
end

person1 = Person.new('Chris', 25)
person2 = Person.new('Laura', 23)
puts person1.name
puts person2.age
```


```ruby
class Person
  def name=(new_name)
    @name = new_name
  end

  def age=(new_age)
    @age = new_age
  end
end

person1.name = "Barney"
person2.age = 101
puts person1.name
puts person2.age
```


```ruby
class Person
  attr_accessor :name, :age
end
```


```ruby
class Person
  @@count = 0

  def initialize
    @@count += 1
  end

  def self.count
    @@count
  end
end

a = Person.new
b = Person.new
c = Person.new
puts Person.count
```

### A.3.3 Reflection


```ruby
Hash.methods
```


```ruby
"testing".methods
```

### A.3.4 Reopening Classes


```ruby
class Fixnum
  alias_method :old_plus, :+

  def +(other_number)
    return 5 if self == 2 && other_number == 2
    old_plus other_number
    end
end

puts 2 + 2
```

### A.3.5 Method Visibility


```ruby
class MyClass
  def public_method
  end

  private
  def private_method1
  end

  def private_method2
  end

  protected
  def protected_method
  end
end
```


```ruby
class MyClass
  def public_method
  end

  def private_method1
  end

  def private_method2
  end

  def protected_method
  end

  public :public_method
  private :private_method1, :private_method2
  protected :protected_method
end
```

## A.4 Data

### A.4.1 Strings


```ruby
"this is a test".reverse.upcase.split(' ').reverse.join('-')
```

### A.4.2 Regular Expressions


```ruby
"this is a test".sub(/[aeiou]/, '*')
```


```ruby
"this is a test".gsub(/[aeiou]/, '*')
```


```ruby
"THIS IS A TEST".gsub(/[aeiou]/, '*')
```


```ruby
"THIS IS A TEST".gsub(/[aeiou]/i, '*')
```


```ruby
m = "this is a test".match(/\b..\b/)
m[0]
```


```ruby
m = "this is a test".match(/\b(.)(.)\b/)
m[0]
```


```ruby
m[1]
```


```ruby
m[2]
```


```ruby
"this is a test".scan(/[aeiou]/)
```


```ruby
"this is a test".scan(/\w+/)
```


```ruby
"this is a test".split(/\s/)
```

### A.4.3 Numbers


```ruby
10 / 3
```




    3




```ruby
10.to_f / 3
```




    3.3333333333333335




```ruby
10.0 / 3
```




    3.3333333333333335




```ruby
10 / Float(3)
```




    3.3333333333333335




```ruby
(2 ** 24).class
```




    Fixnum




```ruby
(2 ** 30).class
```




    Bignum




```ruby
2 ** 100
```




    1267650600228229401496703205376



### A.4.4 Arrays


```ruby
a = []
a.push(10)
a.push('test')
a.push(30)
a << 40
```


```ruby
puts a[0]
puts a[1]
puts a[2]
```

### A.4.5 Hashes (Associative Arrays)


```ruby
fred = {
  'name' => 'Fred Elliott',
  'age' => 63,
  'gender' => 'male',
  'favorite painters' => ['Monet', 'Constable', 'Da Vinci']
}
```




    {"name"=>"Fred Elliott", "age"=>63, "gender"=>"male", "favorite painters"=>["Monet", "Constable", "Da Vinci"]}




```ruby
puts fred['age']
```

    63



```ruby
puts fred['gender']
```

    male



```ruby
puts fred['favorite painters'].first
```

    Monet



```ruby
fred = {
  name: 'Fred Elliott',
  age: 63,
  gender: 'male',
  favorite_painters: ['Monet', 'Constable', 'Da Vinci']
}
```

### A.4.6 Complex Structures


```ruby
people = {
  'fred' => {
    'name' => 'Fred Elliott',
    'age' => 63,
    'gender' => 'male',
    'favorite painters' => ['Monet', 'Constable', 'Da Vinci']
  },
  'janet' => {
    'name' => 'Janet S Porter',
    'age' => 68,
    'gender' => 'female'
  }
}

puts people['fred']['age']
puts people['janet']['gender']
puts people['janet'].inspect

```

## A.5 Input/Output

### A.5.1 Files


```ruby
lines = []
file_handle = File.open("/file/name/here", "r")

while line = file_handle.gets
  lines << line
end

file_handle.close
```


```ruby
lines = File.readlines('/file/name/here')
```

### A.5.2 Databases

### A.5.3 Web Access


```ruby
require 'open-uri'
open('http://www.rubyinside.com/').readlines
```


```ruby
require 'net/http'

Net::HTTP.start('www.rubyinside.com') do |http|
  req = Net::HTTP::Get.new('/test.txt')
  puts http.request(req).body
end
```

## A.6 Libraries

### A.6.1 File Organization


```ruby
# place this code in mylib.rb
class MyLib
  def self.hello_world
    puts "Hello, world!"
  end
end
```


```ruby
# and then you can load and use it like so
require_relative 'mylib'
MyLib.hello_world
```

### A.6.2 Packaging


```ruby
# gem install rails
```


```ruby
# gem uninstall rails
```