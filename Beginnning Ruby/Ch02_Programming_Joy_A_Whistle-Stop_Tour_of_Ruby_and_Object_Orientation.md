
# Chapter 2: Programming == Joy: A Whistle-Stop Tour of Ruby and Object Orientation
<!-- toc orderedList:0 depthFrom:1 depthTo:6 -->

* [Chapter 2: Programming == Joy: A Whistle-Stop Tour of Ruby and Object Orientation](#chapter-2-programming-joy-a-whistle-stop-tour-of-ruby-and-object-orientation)
  * [2.1 Baby Steps](#21-baby-steps)
    * [2.1.1 irb: Interactive Ruby](#211-irb-interactive-ruby)
    * [2.1.2 Ruby Is “English for Computers”](#212-ruby-is-english-for-computers)
    * [2.1.3 Why Ruby Makes a Great Programming Language](#213-why-ruby-makes-a-great-programming-language)
    * [2.1.4 Trails for the Mind](#214-trails-for-the-mind)
  * [2.2 Turning Ideas into Ruby Code](#22-turning-ideas-into-ruby-code)
    * [2.2.1 How Ruby Understands Concepts with Objects and Classes](#221-how-ruby-understands-concepts-with-objects-and-classes)
    * [2.2.2 The Making of a Person](#222-the-making-of-a-person)
    * [2.2.3 Basic Variables](#223-basic-variables)
    * [2.2.4 From People to Pets](#224-from-people-to-pets)
  * [2.3 Everything Is an Object](#23-everything-is-an-object)
    * [2.3.1 Kernel Methods](#231-kernel-methods)
    * [2.3.2 Passing Data to Methods](#232-passing-data-to-methods)
    * [2.3.3 Using the Methods of the String Class](#233-using-the-methods-of-the-string-class)
  * [2.4 Using Ruby in a Non–Object-Oriented Style](#24-using-ruby-in-a-nonobject-oriented-style)
  * [2.5 Summary](#25-summary)

<!-- tocstop -->


## 2.1 Baby Steps

### 2.1.1 irb: Interactive Ruby

### 2.1.2 Ruby Is “English for Computers”

### 2.1.3 Why Ruby Makes a Great Programming Language


```ruby
10.times do print "Hello, world!" end
```

    Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!Hello, world!




    10



### 2.1.4 Trails for the Mind


```ruby
print "test"
```

    test


```ruby
print "2+3 is equal to " + 2 + 3
```


    TypeError: no implicit conversion of Fixnum into String

    <main>:in `+'

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
print "2+3 is equal to " + (2 + 3).to_s
```

    2+3 is equal to 5


```ruby
10/3
```




    3




```ruby
10.0/3
```




    3.3333333333333335



## 2.2 Turning Ideas into Ruby Code

### 2.2.1 How Ruby Understands Concepts with Objects and Classes

### 2.2.2 The Making of a Person


```ruby
class Person
  attr_accessor :name, :age, :gender
end
```


```ruby
person_instance = Person.new
```




    #<Person:0x00000002edf5d8>




```ruby
person_instance.name = "Christine"
```




    "Christine"




```ruby
person_instance.age = 52
person_instance.gender = "female"
```




    "female"




```ruby
puts person_instance.name
```

    Christine


### 2.2.3 Basic Variables


```ruby
x = 10
```




    10




```ruby
x * 2
```




    20




```ruby

```

### 2.2.4 From People to Pets


```ruby
class Cat
  attr_accessor :name, :age, :gender, :color
end

class Dog
  attr_accessor :name, :age, :gender, :color
end

class Snake
  attr_accessor :name, :age, :gender, :color
end
```

* __Structuring Your Pets Logically__

Now that we’ve come up with some ideas to improve our code, let’s retype it from scratch.
To totally cleanse out and reset what you’re working on, you can restart irb.
irb doesn’t remember information between the different times you use it.
So restart irb (to exit irb, typeexit and press Enter) and rewrite the class definitions like so:



```ruby
class Pet
  attr_accessor :name, :age, :gender, :color
end

class Cat < Pet
end

class Dog < Pet
end

class Snake < Pet
end
```


```ruby
class Snake < Pet
  attr_accessor :length
end
```


```ruby
snake = Snake.new
```




    #<Snake:0x00000003015bc8>




```ruby
snake.name = "Sammy"
```




    "Sammy"




```ruby
snake.length = 500
```




    500




```ruby
lassie = Dog.new
```




    #<Dog:0x00000002f7b000>




```ruby
lassie.name = "Lassie"
```




    "Lassie"




```ruby
lassie.age = 20
```




    20




```ruby
lassie.length = 10
```


    NoMethodError: undefined method `length=' for #<Dog:0x00000002f7b000 @name="Lassie", @age=20>

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


* __Controlling Your Pets__


```ruby
class Dog < Pet
  def bark
    puts "Woof!"
  end
end
```




    :bark




```ruby
a_dog = Dog.new
```




    #<Dog:0x00000002e4e510>




```ruby
a_dog.bark
```

    Woof!


## 2.3 Everything Is an Object


```ruby
puts 1 + 10
```

    11



```ruby
puts a_dog.class
```

    Dog



```ruby
puts 2.class
```

    Fixnum



```ruby

```

### 2.3.1 Kernel Methods


```ruby
puts "Hello, world!"
```

    Hello, world!



```ruby
Kernel.puts "Hello, world!"
```

    Hello, world!


### 2.3.2 Passing Data to Methods


```ruby
class Dog
  def bark
    puts "Woof!"
  end
end
```




    :bark




```ruby
my_dog = Dog.new
```




    #<Dog:0x00000002ce9c10>




```ruby
my_dog.bark
```

    Woof!



```ruby
class Dog
  def bark(i)
    i.times do
      puts "Woof!"
    end
  end
end
```




    :bark




```ruby
my_dog = Dog.new
```




    #<Dog:0x000000031560a0>




```ruby
my_dog.bark(3)
```

    Woof!
    Woof!
    Woof!





    3



### 2.3.3 Using the Methods of the String Class


```ruby
class Dog
  def say(a, b, c)
    puts a
    puts b
    puts c
  end
end
```




    :say




```ruby
my_dog = Dog.new
```




    #<Dog:0x00000003026e28>




```ruby
my_dog.say("Dogs", "can’t", "talk!")
```

    Dogs
    can’t
    talk!



```ruby
puts "Hello"
```

    Hello



```ruby
puts("Hello")
```

    Hello



```ruby

```

## 2.4 Using Ruby in a Non–Object-Oriented Style


```ruby
puts "This is a test".length
```

    14



```ruby
puts "This is a test".upcase
```

    THIS IS A TEST



```ruby
"Test" + "Test"
```




    "TestTest"




```ruby
"test".capitalize
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



## 2.5 Summary
