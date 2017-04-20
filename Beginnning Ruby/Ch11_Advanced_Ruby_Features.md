
# Chapter 11: Advanced Ruby Features
<!-- toc orderedList:0 depthFrom:1 depthTo:6 -->

* [Chapter 11: Advanced Ruby Features](#chapter-11-advanced-ruby-features)
  * [11.1 Dynamic Code Execution](#111-dynamic-code-execution)
    * [11.1.1 Bindings](#1111-bindings)
    * [11.1.2 Other Forms of eval](#1112-other-forms-of-eval)
    * [11.1.3 Creating Your Own Version of attr_accessor](#1113-creating-your-own-version-of-attr_accessor)
  * [11.2 Running Other Programs from Ruby](#112-running-other-programs-from-ruby)
    * [11.2.1 Getting Results from Other Programs](#1121-getting-results-from-other-programs)
    * [11.2.2 Transferring Execution to Another Program](#1122-transferring-execution-to-another-program)
    * [11.2.3 Running Two Programs at the Same Time](#1123-running-two-programs-at-the-same-time)
    * [11.2.4 Interacting with Another Program](#1124-interacting-with-another-program)
  * [11.3 Safely Handling Data and Dangerous Methods](#113-safely-handling-data-and-dangerous-methods)
    * [11.3.1 Tainted Data and Objects](#1131-tainted-data-and-objects)
    * [11.3.2 Safe Levels](#1132-safe-levels)
  * [11.4 Working with Microsoft Windows](#114-working-with-microsoft-windows)
    * [11.4.1 Using the Windows API](#1141-using-the-windows-api)
    * [11.4.2 Controlling Windows Programs](#1142-controlling-windows-programs)
  * [11.5 Threads](#115-threads)
    * [11.5.1 Basic Ruby Threads in Action](#1151-basic-ruby-threads-in-action)
    * [11.5.2 Advanced Thread Operations](#1152-advanced-thread-operations)
  * [11.6 Fibers](#116-fibers)
    * [11.6.1 A Fiber in Action](#1161-a-fiber-in-action)
    * [11.6.2 Passing Data to a Fiber](#1162-passing-data-to-a-fiber)
    * [11.6.3 Why Fibers](#1163-why-fibers)
  * [11.7 RubyInline](#117-rubyinline)
    * [11.7.1 Why Use C as an Inline Language](#1171-why-use-c-as-an-inline-language)
    * [11.7.2 Creating a Basic Method or Function](#1172-creating-a-basic-method-or-function)
  * [11.8 Benchmarking C versus Ruby](#118-benchmarking-c-versus-ruby)
  * [11.9 Unicode, Character Encodings, and UTF-8 Support](#119-unicode-character-encodings-and-utf-8-support)
    * [11.9.1 Ruby 1.9 and Beyond's Character Encoding Support](#1191-ruby-19-and-beyonds-character-encoding-support)
  * [11.10 Summary](#1110-summary)

<!-- tocstop -->


## 11.1 Dynamic Code Execution


```ruby
eval "puts 2 + 2"
```

    4



```ruby
puts eval("2 + 2")
```

    4



```ruby
my_number = 15
my_code = %{#{my_number} * 2}
puts eval(my_code)
```

    30


### 11.1.1 Bindings


```ruby
def binding_elsewhere
  x = 20
  return binding
end

remote_binding = binding_elsewhere

x = 10
eval("puts x")
eval("puts x", remote_binding)
```

    10
    20



```ruby
eval("x = 10")
eval("x = 50", remote_binding)
eval("puts x")
eval("puts x", remote_binding)
```

    10
    50


### 11.1.2 Other Forms of eval


```ruby
class Person
end

def add_accessor_to_person(accessor_name)
  Person.class_eval %{
    attr_accessor :#{accessor_name}
  }
end

person = Person.new
add_accessor_to_person :name
add_accessor_to_person :gender
person.name = "Peter Cooper"
person.gender = "male"
puts "#{person.name} is #{person.gender}"

```

    Peter Cooper is male



```ruby
Person.class_eval %{
  attr_accessor :#{accessor_name}
}
```


```ruby
class Class
  def add_accessor(accessor_name)
    self.class_eval %{
      attr_accessor :#{accessor_name}
    }
  end
end

class Person
end

person = Person.new
Person.add_accessor :name
Person.add_accessor :gender
person.name = "Peter Cooper"
person.gender = "male"
puts "#{person.name} is #{person.gender}"
```


```ruby
class SomethingElse
  add_accessor :whatever
end
```


```ruby
class MyClass
  def initialize
    @my_variable = 'Hello, world!'
  end
end

obj = MyClass.new
obj.instance_eval { puts @my_variable }
```

### 11.1.3 Creating Your Own Version of attr_accessor


```ruby
class Person
  def name
    @name
  end

  def name=(name)
    @name = name
  end
end
```




    :name=




```ruby
class Person
  attr_accessor :name
end
```


```ruby
class Class
  def add_accessor(accessor_name)
    self.class_eval %{
      def #{accessor_name}
        @#{accessor_name}
      end

      def #{accessor_name}=(value)
        @#{accessor_name} = value
      end
    }
  end
end
```




    :add_accessor




```ruby
def name
  @name
end

def name=(value)
  @name = value
end
```




    :name=



## 11.2 Running Other Programs from Ruby

### 11.2.1 Getting Results from Other Programs


```ruby
x = system("date")
x = `date`
```




    "The current date is: 04/20/2017 Thu \nEnter the new date: (mm-dd-yy) "



### 11.2.2 Transferring Execution to Another Program


```ruby
exec "ruby another_script.rb"
puts "This will never be displayed"
```

### 11.2.3 Running Two Programs at the Same Time


```ruby
if fork.nil?
  exec "ruby some_other_file.rb"
end

puts "This Ruby script now runs alongside some_other_file.rb"
```


```ruby
child = fork do
  sleep 3
  puts "Child says 'hi'!"
end

puts "Waiting for the child process..."
Process.wait child
puts "All done!"
```

### 11.2.4 Interacting with Another Program


```ruby
ls = IO.popen("ls", "r")
while line = ls.gets
  puts line
end
ls.close
```


```ruby
handle = IO.popen("other_program", "r+")
handle.puts "send input to other program"
handle.close_write
while line = handle.gets
  puts line
end
```

## 11.3 Safely Handling Data and Dangerous Methods

### 11.3.1 Tainted Data and Objects


```ruby
while x = gets
  puts "=> #{eval(x)}"
end
```


```ruby
x = "Hello, world!"
puts x.tainted?

y = [x, x, x]
puts y.tainted?

z = 20 + 50
puts z.tainted?

a = File.open("somefile").readlines.first
puts a.tainted?

b = [a]
puts b.tainted?
```


```ruby
while x = gets
  next if x.tainted?
  puts "=> #{eval(x)}"
end
```


```ruby
def code_is_safe?(code)
  code =~ /[`;*-]/ ? false : true
end

while x = gets
  x.untaint if code_is_safe?(x)
  next if x.tainted?
  puts "=> #{eval(x)}"
end
```

### 11.3.2 Safe Levels

## 11.4 Working with Microsoft Windows

### 11.4.1 Using the Windows API


```ruby
require 'Win32API'

title = "My Application"
text = "Hello, world!"

Win32API.new('user32', 'MessageBox', %w{L P P L}, 'I').call(0, text, title, 0)

```




    1




```ruby
require 'Win32API'

title = "My Application"
text = "Hello, world!"

dialog = Win32API.new('user32', 'MessageBox', 'LPPL', 'I')
result = dialog.call(0, text, title, 1)

case result
  when 1
    puts "Clicked OK"
  when 2
    puts "Clicked Cancel"
  else
    puts "Clicked something else!"
end
```

    Clicked OK


### 11.4.2 Controlling Windows Programs


```ruby
require 'win32ole'

web_browser = WIN32OLE.new('InternetExplorer.Application')
web_browser.visible = true
web_browser.navigate('http://www.rubyinside.com/')
```


```ruby
require 'win32ole'

web_browser = WIN32OLE.new('InternetExplorer.Application')
web_browser.visible = true
web_browser.navigate('http://www.rubyinside.com/')

while web_browser.ReadyState != 4
  sleep 1
end

puts "Page is loaded"
```


```ruby
puts web_browser.document.getElementById('header').innerHtml.length
```

*  Note Many Windows applications implement OLE Automation and can be remotely controlled and used from Ruby in this manner, but it’s beyond the scope of this book to provide an advanced guide to Windows development.
The Win32Utils project provides further Windows-related Ruby libraries at http://rubyforge.org/projects/win32utils/.


## 11.5 Threads

### 11.5.1 Basic Ruby Threads in Action


```ruby
threads = []

10.times do
  thread = Thread.new do
    10.times { |i| print i; $stdout.flush; sleep rand(2) }
  end

  threads << thread
end

threads.each { |thread| thread.join }
```

    00000023333387478667768989977788899899




    [#<Thread:0x00000002ee1978@<main>:3 dead>, #<Thread:0x00000002ee1860@<main>:3 dead>, #<Thread:0x00000002ee1720@<main>:3 dead>, #<Thread:0x00000002ee1608@<main>:3 dead>, #<Thread:0x00000002ee14f0@<main>:3 dead>, #<Thread:0x00000002ee13d8@<main>:3 dead>, #<Thread:0x00000002ee12c0@<main>:3 dead>, #<Thread:0x00000002ee11a8@<main>:3 dead>, #<Thread:0x00000002ee1090@<main>:3 dead>, #<Thread:0x00000002ee0f78@<main>:3 dead>]



### 11.5.2 Advanced Thread Operations

* __Waiting for Threads to Finish Redux__


```ruby
threads.each do |thread|
  puts "Thread #{thread.object_id} didn't finish in 1s" unless thread.join(1)
end
```

* __Getting a List of All Threads__


```ruby
10.times { Thread.new { 10.times { |i| print i; $stdout.flush; sleep rand(2) } } } Thread.list.each { |thread| thread.join unless thread == Thread.main }
```

* __Thread Operations from Within Threads Themselves__


```ruby
Thread.new do
  10.times do |i|
    print i
    $stdout.flush
    Thread.stop
  end
end
```




    #<Thread:0x000000048ef838@<main>:0 run>



    0


```ruby
Thread.list.each { |thread| thread.run }
```

    1




    [#<Thread:0x00000002073f80 run>, #<Thread:0x000000030f0480@C:/Ruby23-x64/lib/ruby/gems/2.3.0/gems/iruby-0.3/lib/iruby/session/cztop.rb:14 run>, #<Thread:0x000000048ef838@<main>:0 sleep>]




```ruby
2.times { Thread.new { 10.times { |i| print i; $stdout.flush; Thread.pass } } } Thread.list.each { |thread| thread.join unless thread == Thread.main }
```

## 11.6 Fibers

### 11.6.1 A Fiber in Action


```ruby
sg = Fiber.new do
  s = 0
  loop do
    square = s * s
    Fiber.yield square
    s += 1
  end
end

10.times { puts sg.resume }
```

    0
    1
    4
    9
    16
    25
    36
    49
    64
    81





    10



### 11.6.2 Passing Data to a Fiber


```ruby
sg = Fiber.new do
  s = 0
  loop do
    square = s * s
    s += 1
    s = Fiber.yield(square) || s
  end
end

puts sg.resume
puts sg.resume
puts sg.resume
puts sg.resume
puts sg.resume 40
puts sg.resume
puts sg.resume
puts sg.resume 0
puts sg.resume
puts sg.resume

```

    0
    1
    4
    9
    1600
    1681
    1764
    0
    1
    4


### 11.6.3 Why Fibers

## 11.7 RubyInline


```ruby
gem install RubyInline
```

### 11.7.1 Why Use C as an Inline Language

### 11.7.2 Creating a Basic Method or Function


```ruby
class Fixnum
  def factorial
    (1..self).inject { |a, b| a * b }
  end
end

puts 8.factorial
```

    40320



```ruby
require 'benchmark'

Benchmark.bm do |bm|
  bm.report('ruby:') do
    100000.times do
      8.factorial
    end
  end
end
```


```ruby
require 'inline'
class CFactorial
  inline do |builder|
    builder.c "
    long factorial(int max) {
      int i=max, result=1;
      while (i >= 2) { result *= i--; }
      return result;
    }"
  end
end
c = CFactorial.new()
puts c.factorial(8)
```


```ruby
long factorial(int max) {
  int i=max, result=1;
  while (i >= 2) { result *= i--; }
  return result;
}
```

## 11.8 Benchmarking C versus Ruby


```ruby
require 'rubygems'
require 'inline'
require 'benchmark'

class CFactorial
  inline do |builder|
    builder.c "
      long factorial(int max) {
        int i=max, result=1;
        while (i >= 2) { result *= i--; }
        return result;
      }"
  end
end

class Fixnum
  def factorial
    (1..self).inject { |a, b| a * b }
  end
end

Benchmark.bm do |bm|
  bm.report('ruby:') do
    100000.times { 8.factorial }
  end
  bm.report('c:') do
    c = CFactorial.new
    100000.times { c.factorial(8) }
  end
end
```

## 11.9 Unicode, Character Encodings, and UTF-8 Support

*  Note For a full rundown of Unicode and how it works and relates to software development, read http://www.joelonsoftware.com/articles/Unicode.html .
The official Unicode site, at http://unicode.org/ , also has specifications and further details.

### 11.9.1 Ruby 1.9 and Beyond's Character Encoding Support

* __Strings__


```ruby
"this is a test".encoding
```




    #<Encoding:UTF-8>




```ruby
"ça va?".encoding
```




    #<Encoding:UTF-8>




```ruby
"ça va?".encode("ISO-8859-1")
```




    "\xE7a va?"




```ruby
"ça va?".encode("US-ASCII")
```


    Encoding::UndefinedConversionError: U+00E7 from UTF-8 to US-ASCII

    <main>:in `encode'

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


* __Source Code__


```ruby
# coding: utf-8
```

## 11.10 Summary

* Windows Automation (also known as OLE Automation) : This is a system that allows Windows applications to register servers for themselves that allow other applications to control them remotely.
You can learn more at http://en.wikipedia.org/wiki/OLE_Automation.


```ruby

```
