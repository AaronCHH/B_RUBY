
# Chapter 8: Documentation, Error Handling, Debugging, and Testing
<!-- toc orderedList:0 depthFrom:1 depthTo:6 -->

* [Chapter 8: Documentation, Error Handling, Debugging, and Testing](#chapter-8-documentation-error-handling-debugging-and-testing)
  * [8.1 Documentation](#81-documentation)
    * [8.1.1 Generating Documentation with RDoc](#811-generating-documentation-with-rdoc)
    * [8.1.2 RDoc Techniques](#812-rdoc-techniques)
    * [8.1.3 Producing Documentation for an Entire Project](#813-producing-documentation-for-an-entire-project)
    * [8.1.4 Modifiers and Options](#814-modifiers-and-options)
  * [8.2 Debugging and Errors](#82-debugging-and-errors)
    * [8.2.1 Exceptions and Error Handling](#821-exceptions-and-error-handling)
    * [8.2.2 Catch and Throw](#822-catch-and-throw)
    * [8.2.3 The Ruby Debugger](#823-the-ruby-debugger)
  * [8.3 Testing](#83-testing)
  * [8.4 The Philosophy of Test-Driven Development](#84-the-philosophy-of-test-driven-development)
    * [8.4.1 Unit Testing](#841-unit-testing)
    * [8.4.2 More Minitest Assertions](#842-more-minitest-assertions)
  * [8.5 Benchmarking and Profiling](#85-benchmarking-and-profiling)
    * [8.5.1 Simple Benchmarking](#851-simple-benchmarking)
    * [8.5.2 Profiling](#852-profiling)
  * [8.6 Summary](#86-summary)

<!-- tocstop -->


## 8.1 Documentation

### 8.1.1 Generating Documentation with RDoc


```ruby
# This class stores information about people.
class Person
  attr_accessor :name, :age, :gender

  # Create the person object and store their name
  def initialize(name)
    @name = name
  end

  # Print this person's name to the screen
  def print_name
    puts "Person called #{@name}"
  end
end
```

### 8.1.2 RDoc Techniques

* http://docs.ruby-lang.org/en/2.2.0/RDoc.html .

### 8.1.3 Producing Documentation for an Entire Project

* __Basic Formatting__


```ruby
#= RDoc Example
#
#== This is a heading
#
#* First item in an outer list
# * First item in an inner list
# * Second item in an inner list
#* Second item in an outer list
# * Only item in this inner list
#
#== This is a second heading
#
#Visit www.rubyinside.com
#
#== Test of text formatting features
#
#Want to see *bold* or _italic_ text? You can even embed
#+text that looks like code+ by surrounding it with plus
#symbols. Indented code will be automatically formatted:
#
# class MyClass
#   def method_name
#     puts "test"
#   end
# end

class MyClass
end

```

* http://docs.ruby-lang.org/en/2.2.0/RDoc/Markup.html

### 8.1.4 Modifiers and Options

* __:nodoc: Modifier__


```ruby
# This is a class that does nothing
class MyClass
  # This method is documented
  def some_method
  end
  def secret_method #:nodoc:
  end
end
```


```ruby
# This is a class that does nothing
class MyClass #:nodoc: all
  # This method is documented (or is it?)
  def some_method
  end


  def secret_method
  end
end
```

* __Turning RDoc Processing On and Off__


```ruby
# This section is documented and read by RDoc.
#--
# This section is hidden from RDoc and could contain developer
# notes, private messages between developers, etc.
#++
# RDoc begins processing again here after the ++.
```

* __Command-Line Options__

* --all : Usually RDoc processes only public methods, but--all forces RDoc to documentall methods within the source files.
* --fmt <format name> : Produce documentation in a certain format (which currently includes darkfish, pot, and ri).
* --help : Get help with using RDoc’s command-line options and find out which output formatters are available.
* --inline-source : Usually source code is shown using popups, but this option forces code to be shown inline with the documentation.
* --main <name> : Set the class, module, or file that appears as the main index page for the documentation to <name> (for example,rdoc --main MyClass ).

## 8.2 Debugging and Errors

### 8.2.1 Exceptions and Error Handling

* __Raising Exceptions__


```ruby
puts 10/0
```


    ZeroDivisionError: divided by 0

    <main>:in `/'

    <main>:in `<main>'

    C:/Ruby23-x64/lib/ruby/gems/2.3.0/gems/iruby-0.3/lib/iruby/backend.rb:44:in `eval'

    C:/Ruby23-x64/lib/ruby/gems/2.3.0/gems/iruby-0.3/lib/iruby/backend.rb:44:in `eval'

    C:/Ruby23-x64/lib/ruby/gems/2.3.0/gems/iruby-0.3/lib/iruby/backend.rb:12:in `eval'

    C:/Ruby23-x64/lib/ruby/gems/2.3.0/gems/iruby-0.3/lib/iruby/kernel.rb:87:in `execute_request'

    C:/Ruby23-x64/lib/ruby/gems/2.3.0/gems/iruby-0.3/lib/iruby/kernel.rb:47:in `dispatch'

    C:/Ruby23-x64/lib/ruby/gems/2.3.0/gems/iruby-0.3/lib/iruby/kernel.rb:37:in `run'

    C:/Ruby23-x64/lib/ruby/gems/2.3.0/gems/iruby-0.3/lib/iruby/command.rb:70:in `run_kernel'

    C:/Ruby23-x64/lib/ruby/gems/2.3.0/gems/iruby-0.3/lib/iruby/command.rb:34:in `run'

    C:/Ruby23-x64/lib/ruby/gems/2.3.0/gems/iruby-0.3/bin/iruby:5:in `<top (required)>'

    C:/Ruby23-x64/bin/iruby:22:in `load'

    C:/Ruby23-x64/bin/iruby:22:in `<main>'



```ruby
class Person
  def initialize(name)
    raise ArgumentError, "No name present" if name.empty?
  end
end
```


```ruby
fred = Person.new('')
```


```ruby
class BadDataException < RuntimeError
end

class Person
  def initialize(name)
    raise BadDataException, "No name present" if name.empty?
  end
end
```

* __Handling Exceptions__


```ruby
begin
  puts 10 / 0
rescue
  puts "You caused an error!"
end

```


```ruby
data = ""
begin
  # <..code to retrieve the contents of a Web page..>
  data = '' #<..content of Web page..>
rescue
  puts "The Web page could not be loaded! Using default data instead."
  data = '' #<..load data from local file..>
end
puts data
```


```ruby
begin
  #... code here ...
rescue ZeroDivisionError
  #... code to rescue the zero division exception here ...
rescue YourOwnException
  #... code to rescue a different type of exception here ...
rescue
  #... code that rescues all other types of exception here ...
end
```

* __Handling Passed Exceptions__


```ruby
begin
  puts 10 / 0
rescue => e
  puts e.class
end
```

### 8.2.2 Catch and Throw


```ruby
catch(:finish) do
  1000.times do
    x = rand(1000)
    throw :finish if x == 123
  end

  puts "Generated 1000 random numbers without generating 123!"
end
```


```ruby
def generate_random_number_except_123
  x = rand(1000)
  throw :finish if x == 123
end


catch(:finish) do
  1000.times { generate_random_number_except_123 }
  puts "Generated 1000 random numbers without generating 123!"
end
```

### 8.2.3 The Ruby Debugger


```ruby
i = 1
j = 0
until i > 1000000
  i *= 2
  j += 1
end
puts "i = #{i}, j = #{j}"
```


```ruby
ruby –r debug debugtest.rb
```

## 8.3 Testing


```ruby

```

## 8.4 The Philosophy of Test-Driven Development

* http://en.wikipedia.org/wiki/Test-driven_development


```ruby
class String
  def titleize
    self.capitalize
  end
end
```


```ruby
puts "this is a test".titleize
```


```ruby
raise "Fail 1" unless "this is a test".titleize == "This Is A Test"
raise "Fail 2" unless "another test 1234".titleize == "Another Test 1234"
raise "Fail 3" unless "We're testing titleize".titleize == "We're Testing Titleize"
```


```ruby
class String
  def titleize
    self.gsub(/\b\w/) { |letter| letter.upcase }
  end
end
```


```ruby
puts "We're testing titleize".titleize
```


```ruby
class String
  def titleize
    self.gsub(/\s\w/) { |letter| letter.upcase }
  end
end
```


```ruby
class String
  def titleize
    self.gsub(/(\A|\s)\w/){ |letter| letter.upcase }
  end
end
```

### 8.4.1 Unit Testing


```ruby
class String
  def titleize
    self.gsub(/(\A|\s)\w/){ |letter| letter.upcase }
  end
end

require '/'

class TestTitleize < Minitest::Test
  def test_basic
    assert_equal("This Is A Test", "this is a test".titleize)
    assert_equal("Another Test 1234", "another test 1234".titleize)
    assert_equal("We're Testing", "We're testing".titleize)
  end
end
```


```ruby
assert_equal("Let's make a test fail!", "foo".titleize)
```

### 8.4.2 More Minitest Assertions


```ruby
assert_equal("This Is A Test", "this is a test".titleize)

```

## 8.5 Benchmarking and Profiling

### 8.5.1 Simple Benchmarking


```ruby
require 'benchmark'
puts Benchmark.measure { 10000.times { print "." } }
```


```ruby
require 'benchmark'
iterations = 1000000

b = Benchmark.measure do
  for i in 1..iterations do
    x = i
  end
end

c = Benchmark.measure do
  iterations.times do |i|
    x = i
  end
end

puts b
puts c
```


```ruby
require 'benchmark'
iterations = 1000000

Benchmark.bm do |bm|
  bm.report("for:") do
    for i in 1..iterations do
      x = i
    end
  end
  bm.report("times:") do
    iterations.times do |i|
      x = i
    end
  end
end
```

### 8.5.2 Profiling


```ruby
# gem install ruby-prof
```


```ruby
# place this into calculator.rb
require 'profile'
class Calculator
  def self.count_to_large_number
    x = 0
    100000.times { x += 1 }
  end
  def self.count_to_small_number
    x = 0
    1000.times { x += 1 }
  end
end

Calculator.count_to_large_number
Calculator.count_to_small_number
```

## 8.6 Summary


```ruby

```
