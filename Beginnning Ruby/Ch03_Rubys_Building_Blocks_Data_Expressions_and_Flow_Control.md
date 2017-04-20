
# Chapter 3: Ruby's Building Blocks: Data, Expressions, and Flow Control
<!-- toc orderedList:0 depthFrom:1 depthTo:6 -->

* [Chapter 3: Ruby's Building Blocks: Data, Expressions, and Flow Control](#chapter-3-rubys-building-blocks-data-expressions-and-flow-control)
  * [3.1 Numbers and Expressions](#31-numbers-and-expressions)
    * [3.1.1 Basic Expressions](#311-basic-expressions)
    * [3.1.2 Variables](#312-variables)
    * [3.1.3 Comparison Operators and Expressions](#313-comparison-operators-and-expressions)
    * [3.1.4 Looping Through Numbers with Blocks and Iterators](#314-looping-through-numbers-with-blocks-and-iterators)
    * [3.1.5 Floating Point Numbers](#315-floating-point-numbers)
    * [3.1.6 Constants](#316-constants)
  * [3.2 Text and Strings](#32-text-and-strings)
    * [3.2.1 String Literals](#321-string-literals)
    * [3.2.2 String Expressions](#322-string-expressions)
    * [3.2.3 Interpolation](#323-interpolation)
    * [3.2.4 String Methods](#324-string-methods)
    * [3.2.5 Regular Expressions and String Manipulation](#325-regular-expressions-and-string-manipulation)
  * [3.3 Arrays and Lists](#33-arrays-and-lists)
    * [3.3.1 Basic Arrays](#331-basic-arrays)
    * [3.3.2 Splitting Strings into Arrays](#332-splitting-strings-into-arrays)
    * [3.3.3 Array Iteration](#333-array-iteration)
    * [3.3.4 Other Array Methods](#334-other-array-methods)
  * [3.4 Hashes](#34-hashes)
    * [3.4.1 Basic Hash Methods](#341-basic-hash-methods)
    * [3.4.2 Hashes Within Hashes](#342-hashes-within-hashes)
  * [3.5 Flow Control](#35-flow-control)
    * [3.5.1 if and unless](#351-if-and-unless)
    * [3.5.2 ?, the Ternary Operator](#352-the-ternary-operator)
    * [3.5.3 elsif and case](#353-elsif-and-case)
    * [3.5.4 while and until](#354-while-and-until)
    * [3.5.5 Code Blocks](#355-code-blocks)
  * [3.6 Other Useful Building Blocks](#36-other-useful-building-blocks)
    * [3.6.1 Dates and Times](#361-dates-and-times)
    * [3.6.2 Large Numbers](#362-large-numbers)
    * [3.6.3 Ranges](#363-ranges)
    * [3.6.4 Symbols](#364-symbols)
    * [3.6.5 Converting Objects to Other Classes](#365-converting-objects-to-other-classes)
  * [3.7 Summary](#37-summary)

<!-- tocstop -->


## 3.1 Numbers and Expressions

### 3.1.1 Basic Expressions


```ruby
5
```




    5




```ruby
1 + 2
```




    3




```ruby
"a" + "b" + "c"
```




    "abc"




```ruby
100 - 5 * (2 - 1)
```




    95




```ruby
x + y
```

### 3.1.2 Variables


```ruby
x = 10
puts(x)
```

    10



```ruby
x = 100
y = 10
puts x - y
```

    90



```ruby
x = 50
y = x * 100
x += y
puts x
```

    5050


### 3.1.3 Comparison Operators and Expressions


```ruby
age = 10
puts "You're too young to use this system" if age < 18
```

    You're too young to use this system



```ruby
age = 24
puts "You're a teenager" if age > 12 && age < 20
```


```ruby
age = 24
puts "You're NOT a teenager" unless age > 12 && age < 20
```

    You're NOT a teenager



```ruby
age = 24
puts "You're 24!" if age == 24
```

    You're 24!



```ruby
puts "You're a teenager" if age > 12 && age < 20
```


```ruby
puts "You're either very young or very old" if age > 80 || age < 10
```


```ruby
gender = "male"
age = 6
puts "A very young or old man" if gender == "male" && (age < 18 || age > 85)
```

    A very young or old man


### 3.1.4 Looping Through Numbers with Blocks and Iterators


```ruby
x = 1
puts x
x += 1
puts x
x += 1
puts x
```

    1
    2
    3



```ruby
5.times do puts "Test" end
```

    Test
    Test
    Test
    Test
    Test





    5




```ruby
5.times { puts "Test" }
```

    Test
    Test
    Test
    Test
    Test





    5




```ruby
1.upto(5) { ...code to loop here... }
10.downto(5) { ...code to loop here... }
0.step(50, 5) { ...code to loop here... }
```


```ruby
1.upto(5) { |number| puts number }
```

    1
    2
    3
    4
    5





    1




```ruby
1.upto(5) do |number|
  puts number
end
```

    1
    2
    3
    4
    5





    1




```ruby
1.upto(5) { |number|
  puts number
}
```

    1
    2
    3
    4
    5





    1



### 3.1.5 Floating Point Numbers


```ruby
puts 10 / 3
```

    3



```ruby
puts 10.0 / 3.0
```

    3.3333333333333335



```ruby
x = 10
y = 3
puts x / y
```

    3



```ruby
x = 10
y = 3
puts x.to_f / y.to_f
```

    3.3333333333333335



```ruby
puts 5.7.to_i
```

    5


### 3.1.6 Constants


```ruby
Pi = 3.141592
```




    3.141592




```ruby
Pi = 3.141592
Pi = 500
```

    <main>:1: warning: already initialized constant Pi
    <main>:1: warning: already initialized constant Pi
    <main>:1: warning: previous definition of Pi was here





    500



## 3.2 Text and Strings

### 3.2.1 String Literals


```ruby
puts "Hello, world!"
```

    Hello, world!



```ruby
puts "Hello, world!".class
```

    String



```ruby
x = "Test"
y = "String"
puts "Success!" if x + y == "TestString"
```

    Success!



```ruby
x = %q{This is a test
of the multi
line capabilities}
```




    "This is a test\nof the multi\nline capabilities"




```ruby
x = %q!This is a test
of the multi
line capabilities!
```




    "This is a test\nof the multi\nline capabilities"




```ruby
x = <<END_MY_STRING_PLEASE
This is the string
And a second line
END_MY_STRING_PLEASE
```




    "This is the string\nAnd a second line\n"



### 3.2.2 String Expressions


```ruby
puts "Success!" if "Test" + "String" == "TestString"
```

    Success!



```ruby
puts "abc" * 5
```

    abcabcabcabcabc



```ruby
puts "x" > "y"
```

    false



```ruby
puts "y" > "x"
```

    true



```ruby
puts "x".ord
```

    120



```ruby
puts "A".ord
```

    65



```ruby
puts 120.chr
```

    x


### 3.2.3 Interpolation


```ruby
x = 10
y = 20
puts "#{x} + #{y} = #{x + y}"
```

    10 + 20 = 30



```ruby
puts "100 * 5 = #{100 * 5}"
```

    100 * 5 = 500



```ruby
puts "#{x} + #{y} = #{x + y}"
```

    10 + 20 = 30



```ruby
x = "cat"
puts "The #{x} in the hat"
```

    The cat in the hat



```ruby
puts "It's a #{"bad " * 5}world"
```

    It's a bad bad bad bad bad world



```ruby
my_string = "It's a #{"bad " * 5}world"
puts my_string
```

    It's a bad bad bad bad bad world



```ruby
x = 10
y = 20
puts x.to_s + " + " + y.to_s + " = " + (x + y).to_s
puts "#{x} + #{y} = #{x + y}"
```

    10 + 20 = 30
    10 + 20 = 30


### 3.2.4 String Methods


```ruby
"Test" + "Test"
```




    "TestTest"




```ruby
"Test".capitalize
```




    "Test"




```ruby
"Test".downcase
```




    "test"




```ruby
"Test".chop
```




    "Tes"




```ruby
"Test".next
```




    "Tesu"




```ruby
"Test".reverse
```




    "tseT"




```ruby
"Test".sum
```




    416




```ruby
"Test".swapcase
```




    "tEST"




```ruby
"Test".upcase
```




    "TEST"




```ruby
"Test".upcase.reverse
```




    "TSET"




```ruby
"Test".upcase.reverse.next
```




    "TSEU"




```ruby
puts "This is a test".length
```

    14


### 3.2.5 Regular Expressions and String Manipulation

* __Substitutions__


```ruby
puts "foobar".sub('bar', 'foo')
```

    foofoo



```ruby
puts "this is a test".gsub('i', '')
```

    ths s a test



```ruby
x = "This is a test"
puts x.sub(/^../, 'Hello')
```

    Hellois is a test



```ruby
x = "This is a test"
puts x.sub(/..$/, 'Hello')
```

    This is a teHello


* __Iteration with a Regular Expression__


```ruby
"xyz".scan(/./) { |letter| puts letter }
```

    x
    y
    z





    "xyz"




```ruby
"This is a test".scan(/../) { |x| puts x }
```

    Th
    is
     i
    s
    a
    te
    st





    "This is a test"




```ruby
"This is a test".scan(/\w\w/) { |x| puts x }
```

    Th
    is
    is
    te
    st





    "This is a test"




```ruby
"The car costs $1000 and the cat costs $10".scan(/\d+/) do |x|
  puts x
end
```

    1000
    10





    "The car costs $1000 and the cat costs $10"




```ruby
"The car costs $1000 and the cat costs $10".scan(/\d/) do |x|
  puts x
end
```

    1
    0
    0
    0
    1
    0





    "The car costs $1000 and the cat costs $10"




```ruby
"This is a test".scan(/[aeiou]/) { |x| puts x }
```

    i
    i
    a
    e





    "This is a test"




```ruby
"This is a test".scan(/[a-m]/) { |x| puts x }
```

    h
    i
    i
    a
    e





    "This is a test"



* __Matching__


```ruby
puts "String has vowels" if "This is a test" =~ /[aeiou]/
```

    String has vowels



```ruby
puts "String contains no digits" unless "This is a test" =~ /[0-9]/
```

    String contains no digits



```ruby
puts "String has vowels" if "This is a test".match(/[aeiou]/)
```

    String has vowels



```ruby
x = "This is a test".match(/(\w+) (\w+)/)
puts x[0]
puts x[1]
puts x[2]
```

    This is
    This
    is



```ruby

```

## 3.3 Arrays and Lists

### 3.3.1 Basic Arrays


```ruby
x = [1, 2, 3, 4]
```




    [1, 2, 3, 4]




```ruby
x = [1, 2, 3, 4]
puts x[2]
```

    3



```ruby
x[2] += 1
puts x[2]
```

    4



```ruby
x[2] = "Fish" * 3
puts x[2]
```

    FishFishFish



```ruby
x = []
```




    []




```ruby
x = []
x << "Word"
```




    ["Word"]




```ruby
x.push("Word")
```




    ["Word", "Word"]




```ruby
x = []
x << "Word"
x << "Play"
x << "Fun"
puts x.pop
puts x.pop
puts x.length
```

    Fun
    Play
    1



```ruby
x = ["Word", "Play", "Fun"]
puts x.join
```

    WordPlayFun



```ruby
x = ["Word", "Play", "Fun"]
puts x.join(', ')
```

    Word, Play, Fun


### 3.3.2 Splitting Strings into Arrays


```ruby
puts "This is a test".scan(/\w/).join(',')
```

    T,h,i,s,i,s,a,t,e,s,t



```ruby
puts "Short sentence. Another. No more.".split(/\./).inspect
```

    ["Short sentence", " Another", " No more"]



```ruby
puts "Words with lots of spaces".split(/\s+/).inspect
```

    ["Words", "with", "lots", "of", "spaces"]



```ruby
p "Words with lots of spaces".split(/\s+/)
```

    ["Words", "with", "lots", "of", "spaces"]





    ["Words", "with", "lots", "of", "spaces"]



### 3.3.3 Array Iteration


```ruby
[1, "test", 2, 3, 4].each { |element| puts element.to_s + "X" }
```

    1X
    testX
    2X
    3X
    4X





    [1, "test", 2, 3, 4]




```ruby
[1, 2, 3, 4].collect { |element| element * 2 }
```




    [2, 4, 6, 8]




```ruby
a = [1, "test", 2, 3, 4]
i = 0
while (i < a.length)
  puts a[i].to_s + "X"
  i += 1
end
```

    1X
    testX
    2X
    3X
    4X


### 3.3.4 Other Array Methods

* __Array Addition and Concatenation__


```ruby
x = [1, 2, 3]
y = ["a", "b", "c"]
z = x + y
p z
```

    [1, 2, 3, "a", "b", "c"]





    [1, 2, 3, "a", "b", "c"]



* __Array Subtraction and Difference__


```ruby
x = [1, 2, 3, 4, 5]
y = [1, 2, 3]
z = x - y
p z
```

    [4, 5]





    [4, 5]



* __Checking for an Empty Array__


```ruby
x = []
puts "x is empty" if x.empty?
```

    x is empty


* __Checking an Array for a Certain Item__


```ruby
x = [1, 2, 3]
p x.include?("x")
p x.include?(3)
```

    false
    true





    true



* __Accessing the First and Last Elements of the Array__


```ruby
x = [1, 2, 3]
puts x.first
puts x.last
```

    1
    3



```ruby
x = [1, 2, 3]
puts x.first(2).join("-")
```

    1-2


* __Reversing the Order of the Array's Elements__


```ruby
x = [1, 2, 3]
p x.reverse
```

    [3, 2, 1]





    [3, 2, 1]



## 3.4 Hashes


```ruby
dictionary = { 'cat' => 'feline animal', 'dog' => 'canine animal' }
```




    {"cat"=>"feline animal", "dog"=>"canine animal"}




```ruby
puts dictionary.size
```

    2



```ruby
puts dictionary['cat']
```

    feline animal



```ruby
dictionary['cat'] = "fluffy animal"
puts dictionary['cat']
```

    fluffy animal


### 3.4.1 Basic Hash Methods

* __Iterating Through Hash Elements__


```ruby
x = { "a" => 1, "b" => 2 }
x.each { |key, value| puts "#{key} equals #{value}" }
```

    a equals 1
    b equals 2





    {"a"=>1, "b"=>2}



* __Retrieving Keys__


```ruby
x = { "a" => 1, "b" => 2, "c" => 3 }
p x.keys
```

    ["a", "b", "c"]





    ["a", "b", "c"]



* __Deleting Hash Elements__


```ruby
x = { "a" => 1, "b" => 2 }
x.delete("a")
p x
```

    {"b"=>2}





    {"b"=>2}



* __Deleting Hash Elements Conditionally__


```ruby
x = { "a" => 100, "b" => 20 }
x.delete_if { |key, value| value < 25 }
p x
```

    {"a"=>100}





    {"a"=>100}



### 3.4.2 Hashes Within Hashes


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
    'age' => 55,
    'gender' => 'female'
    }
  }
puts people['fred']['age']
puts people['janet']['gender']
p people['janet']
```

    63
    female
    {"name"=>"Janet S Porter", "age"=>55, "gender"=>"female"}





    {"name"=>"Janet S Porter", "age"=>55, "gender"=>"female"}




```ruby
puts people['fred']['favorite painters'].length
```

    3



```ruby
puts people['fred']['favorite painters'].join(", ")
```

    Monet, Constable, Da Vinci


## 3.5 Flow Control

### 3.5.1 if and unless


```ruby
age = 10
puts "You're too young to use this system" if age < 18
```

    You're too young to use this system



```ruby
age = 10
if age < 18
  puts "You're too young to use this system"
end
```

    You're too young to use this system



```ruby
age = 10
if age < 18
  puts "You're too young to use this system"
  puts "So we're going to exit your program now"
  exit
end
```

    You're too young to use this system
    So we're going to exit your program now



```ruby
age = 10
unless age >= 18
  puts "You're too young to use this system"
  puts "So we're going to exit your program now"
  exit
end
```

    You're too young to use this system
    So we're going to exit your program now



```ruby
age = 19
if age < 21
  puts "You can't drink in most of the United States"
  if age >= 18
    puts "But you can in the United Kingdom!"
  end
end
```

    You can't drink in most of the United States
    But you can in the United Kingdom!



```ruby
age = 10
if age < 18
  puts "You're too young to use this system"
else
  puts "You can use this system"
end
```

    You're too young to use this system



```ruby

```

### 3.5.2 ?, the Ternary Operator


```ruby
age = 10
type = age < 18 ? "child" : "adult"
puts "You are a " + type
```

    You are a child



```ruby
age = 10
type = 'child' if age < 18
type = 'adult' unless age < 18
puts "You are a " + type
```

    You are a child



```ruby
age = 10
if age < 18
  type = 'child'
else
  type = 'adult'
end
puts "You are a " + type
```

    You are a child



```ruby
age = 10
puts "You are a " + (age < 18 ? "child" : "adult")
```

    You are a child


### 3.5.3 elsif and case


```ruby
fruit = "orange"
color = "orange" if fruit == "orange"
color = "green" if fruit == "apple"
color = "yellow" if fruit == "banana"
```


```ruby
fruit = "orange"
if fruit == "orange"
  color = "orange"
elsif fruit == "apple"
  color = "green"
elsif fruit == "banana"
  color = "yellow"
else
  color = "unknown"
end
```




    "orange"




```ruby
fruit = "orange"
case fruit
when "orange"
  color = "orange"
when "apple"
  color = "green"
when "banana"
  color = "yellow"
else
  color = "unknown"
end
```




    "orange"




```ruby
fruit = "orange"
color = case fruit
when "orange"
  "orange"
when "apple"
  "green"
when "banana"
  "yellow"
  Else
  "unknown"
end
```




    "orange"



### 3.5.4 while and until


```ruby
1.upto(5) { |number| puts number }
```

    1
    2
    3
    4
    5





    1




```ruby
x = 1
while x < 100
  puts x
  x = x * 2
end
```

    1
    2
    4
    8
    16
    32
    64



```ruby
x = 1
until x > 99
  puts x
  x = x * 2
end
```

    1
    2
    4
    8
    16
    32
    64



```ruby
i = 1
i = i * 2 until i > 1000
puts i
```

    1024


### 3.5.5 Code Blocks


```ruby
x = [1, 2, 3]
x.each { |y| puts y }
```

    1
    2
    3





    [1, 2, 3]




```ruby
x = [1, 2, 3]
x.each do |y|
  puts y
end
```

    1
    2
    3





    [1, 2, 3]




```ruby
def each_vowel(&code_block)
  %w{a e i o u}.each { |vowel| code_block.call(vowel) }
end
each_vowel { |vowel| puts vowel }
```

    a
    e
    i
    o
    u





    ["a", "e", "i", "o", "u"]




```ruby
def each_vowel
  %w{a e i o u}.each { |vowel| yield vowel }
end
each_vowel { |vowel| puts vowel }
```

    a
    e
    i
    o
    u





    ["a", "e", "i", "o", "u"]




```ruby
print_parameter_to_screen = lambda { |x| puts x }
```




    #<Proc:0x0000000231d7e0@<main>:0 (lambda)>




```ruby
print_parameter_to_screen.call(100)
```

    100


## 3.6 Other Useful Building Blocks

### 3.6.1 Dates and Times


```ruby
puts Time.now
```

    2017-04-19 17:18:35 +0800



```ruby
puts Time.now
puts Time.now - 10
puts Time.now + 86400
```

    2017-04-19 17:18:40 +0800
    2017-04-19 17:18:30 +0800
    2017-04-20 17:18:40 +0800



```ruby
class Fixnum
  def seconds
    self
  end
  def minutes
    self * 60
  end
  def hours
    self * 60 * 60
  end
  def days
    self * 60 * 60 * 24
  end
end

puts Time.now
puts Time.now + 10.minutes
puts Time.now + 16.hours
puts Time.now - 7.days
```

    2017-04-19 17:19:21 +0800
    2017-04-19 17:29:21 +0800
    2017-04-20 09:19:21 +0800
    2017-04-12 17:19:21 +0800



```ruby
year = 2016
month = 1
day = 16
hour = 12
min = 57
sec = 10
msec = 42
Time.local(year, month, day, hour, min, sec, msec)
```




    2016-01-16 12:57:10 +0800




```ruby
Time.gm(year, month, day, hour, min, sec, msec)
```




    2016-01-16 12:57:10 UTC




```ruby
Time.utc(year, month, day, hour, min, sec, msec)
```




    2016-01-16 12:57:10 UTC




```ruby
Time.gm(2015, 05).to_i
```




    1430438400




```ruby
epoch_time = Time.gm(2015, 5).to_i
t = Time.at(epoch_time)
puts t.year, t.month, t.day
```

    2015
    5
    1


### 3.6.2 Large Numbers


```ruby
rice_on_square = 1
64.times do |square|
  puts "On square #{square + 1} are #{rice_on_square} grain(s)"
  rice_on_square *= 2
end
```

    On square 1 are 1 grain(s)
    On square 2 are 2 grain(s)
    On square 3 are 4 grain(s)
    On square 4 are 8 grain(s)
    On square 5 are 16 grain(s)
    On square 6 are 32 grain(s)
    On square 7 are 64 grain(s)
    On square 8 are 128 grain(s)
    On square 9 are 256 grain(s)
    On square 10 are 512 grain(s)
    On square 11 are 1024 grain(s)
    On square 12 are 2048 grain(s)
    On square 13 are 4096 grain(s)
    On square 14 are 8192 grain(s)
    On square 15 are 16384 grain(s)
    On square 16 are 32768 grain(s)
    On square 17 are 65536 grain(s)
    On square 18 are 131072 grain(s)
    On square 19 are 262144 grain(s)
    On square 20 are 524288 grain(s)
    On square 21 are 1048576 grain(s)
    On square 22 are 2097152 grain(s)
    On square 23 are 4194304 grain(s)
    On square 24 are 8388608 grain(s)
    On square 25 are 16777216 grain(s)
    On square 26 are 33554432 grain(s)
    On square 27 are 67108864 grain(s)
    On square 28 are 134217728 grain(s)
    On square 29 are 268435456 grain(s)
    On square 30 are 536870912 grain(s)
    On square 31 are 1073741824 grain(s)
    On square 32 are 2147483648 grain(s)
    On square 33 are 4294967296 grain(s)
    On square 34 are 8589934592 grain(s)
    On square 35 are 17179869184 grain(s)
    On square 36 are 34359738368 grain(s)
    On square 37 are 68719476736 grain(s)
    On square 38 are 137438953472 grain(s)
    On square 39 are 274877906944 grain(s)
    On square 40 are 549755813888 grain(s)
    On square 41 are 1099511627776 grain(s)
    On square 42 are 2199023255552 grain(s)
    On square 43 are 4398046511104 grain(s)
    On square 44 are 8796093022208 grain(s)
    On square 45 are 17592186044416 grain(s)
    On square 46 are 35184372088832 grain(s)
    On square 47 are 70368744177664 grain(s)
    On square 48 are 140737488355328 grain(s)
    On square 49 are 281474976710656 grain(s)
    On square 50 are 562949953421312 grain(s)
    On square 51 are 1125899906842624 grain(s)
    On square 52 are 2251799813685248 grain(s)
    On square 53 are 4503599627370496 grain(s)
    On square 54 are 9007199254740992 grain(s)
    On square 55 are 18014398509481984 grain(s)
    On square 56 are 36028797018963968 grain(s)
    On square 57 are 72057594037927936 grain(s)
    On square 58 are 144115188075855872 grain(s)
    On square 59 are 288230376151711744 grain(s)
    On square 60 are 576460752303423488 grain(s)
    On square 61 are 1152921504606846976 grain(s)
    On square 62 are 2305843009213693952 grain(s)
    On square 63 are 4611686018427387904 grain(s)
    On square 64 are 9223372036854775808 grain(s)





    64




```ruby
puts 4611686018427387903.class
```

    Bignum



```ruby
puts 4611686018427387904.class
```

    Bignum


### 3.6.3 Ranges


```ruby
x = ['A', 'B', 'C', 'D', 'E' .. and so on.. ]
```


```ruby
('A'..'Z')
```




    "A".."Z"




```ruby
('A'..'Z').to_a.each { |letter| print letter }
```

    ABCDEFGHIJKLMNOPQRSTUVWXYZ




    ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]




```ruby
('A'..'Z').each { |letter| print letter }
```

    ABCDEFGHIJKLMNOPQRSTUVWXYZ




    "A".."Z"




```ruby
('A'..'Z').include?('R')
```




    true




```ruby
('A'..'Z').include?('r')
```




    false




```ruby
a = [2, 4, 6, 8, 10, 12]
p a[1..3]
```

    [4, 6, 8]





    [4, 6, 8]




```ruby
a[1..3] = ["a", "b", "c"]
p a
```

    [2, "a", "b", "c", 10, 12]





    [2, "a", "b", "c", 10, 12]



### 3.6.4 Symbols


```ruby
current_situation = :good
puts "Everything is fine" if current_situation == :good
puts "PANIC!" if current_situation == :bad
```

    Everything is fine



```ruby
current_situation = "good"
puts "Everything is fine" if current_situation == "good"
puts "PANIC!" if current_situation == "bad"
```

    Everything is fine



```ruby
s = { :key => 'value' }
```




    {:key=>"value"}




```ruby
person1 = { :name => "Fred", :age => 20, :gender => :male }
person2 = { :name => "Laura", :age => 23, :gender => :female }
```




    {:name=>"Laura", :age=>23, :gender=>:female}



### 3.6.5 Converting Objects to Other Classes


```ruby
puts "12" + "10"
puts 12 + 10
```

    1210
    22



```ruby
puts "12".to_i + "10".to_i
puts 12.to_s + 10.to_s
```

    22
    1210


## 3.7 Summary

http://rubular.com/


```ruby

```
