
# Chapter 6: Classes, Objects, and Modules
<!-- toc orderedList:0 depthFrom:1 depthTo:6 -->

* [Chapter 6: Classes, Objects, and Modules](#chapter-6-classes-objects-and-modules)
  * [6.1 Why Use Object Orientation?](#61-why-use-object-orientation)
  * [6.2 Object-Orientation Basics](#62-object-orientation-basics)
    * [6.2.1 Local, Global, Object, and Class Variables](#621-local-global-object-and-class-variables)
    * [6.2.2 Class Methods versus Instance Methods](#622-class-methods-versus-instance-methods)
    * [6.2.3 Inheritance](#623-inheritance)
    * [6.2.4 Overriding Existing Methods](#624-overriding-existing-methods)
    * [6.2.5 Reflection and Discovering an Object's Methods](#625-reflection-and-discovering-an-objects-methods)
    * [6.2.6 Encapsulation](#626-encapsulation)
    * [6.2.7 Polymorphism](#627-polymorphism)
    * [6.2.8 Nested Classes](#628-nested-classes)
    * [6.2.9 The Scope of Constants](#629-the-scope-of-constants)
  * [6.3 Modules, Namespaces, and Mix-Ins](#63-modules-namespaces-and-mix-ins)
    * [6.3.1 Namespaces](#631-namespaces)
    * [6.3.2 Mix-Ins](#632-mix-ins)
  * [6.4 Building a Dungeon Text Adventure with Objects](#64-building-a-dungeon-text-adventure-with-objects)
    * [6.4.1 Dungeon Concepts](#641-dungeon-concepts)
    * [6.4.2 Creating the Initial Classes](#642-creating-the-initial-classes)
    * [6.4.3 Structs: Quick and Easy Data Classes](#643-structs-quick-and-easy-data-classes)
    * [6.4.4 Creating Rooms](#644-creating-rooms)
    * [6.4.5 Making the Dungeon Work](#645-making-the-dungeon-work)
  * [6.5 Summary](#65-summary)

<!-- tocstop -->


## 6.1 Why Use Object Orientation?


```ruby
def perimeter_of_square(side_length)
  side_length * 4
end

def area_of_square(side_length)
  side_length * side_length
end

def perimeter_of_triangle(side1, side2, side3)
  side1 + side2 + side3
end

def area_of_triangle(base_width, height)
  base_width * height / 2
end
```




    :area_of_triangle




```ruby
class Shape
end

class Square < Shape
  def initialize(side_length)
    @side_length = side_length
  end

  def area
    @side_length * @side_length
  end

  def perimeter
    @side_length * 4
  end
end

class Triangle < Shape
  def initialize(base_width, height, side1, side2, side3)
    @base_width = base_width
    @height = height
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def area
    @base_width * @height / 2
  end

  def perimeter
    @side1 + @side2 + @side3
  end
end
```




    :perimeter




```ruby
puts area_of_triangle(6,6)
puts perimeter_of_square(5)
```

    18
    20



```ruby
my_square = Square.new(5)
my_triangle = Triangle.new(6, 6, 7.81, 7.81, 7.81)
puts my_square.area
puts my_square.perimeter
puts my_triangle.area
puts my_triangle.perimeter
```

    25
    20
    18
    23.43


## 6.2 Object-Orientation Basics

### 6.2.1 Local, Global, Object, and Class Variables


```ruby
class Square
  def initialize(side_length)
    @side_length = side_length
  end

  def area
    @side_length * @side_length
  end
end
```




    :area




```ruby
a = Square.new(10)
b = Square.new(5)
puts a.area
puts b.area
```

    100
    25


* __Local Variables__


```ruby
x = 10
puts x
```

    10



```ruby
def basic_method
  puts x
end

x = 10
basic_method
```


    NameError: undefined local variable or method `x' for main:Object

    <main>:1:in `basic_method'

    <main>:5:in `<main>'

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
def basic_method
  x = 50
  puts x
end

x = 10
basic_method
puts x
```

    50
    10


* __Global Variables__


```ruby
def basic_method
  puts $x
end

$x = 10
basic_method
```

    10


* __Instance or Object Variables__


```ruby
class Square
  def initialize(side_length)
    @side_length = side_length
  end
  def area
    @side_length * @side_length
  end
end
```




    :area




```ruby
a = Square.new(10)
b = Square.new(5)
puts a.area
puts b.area
```

    100
    25


* __Class Variables__


```ruby
class Square
  def initialize
    if defined?(@@number_of_squares)
      @@number_of_squares += 1
    else
      @@number_of_squares = 1
    end
  end
  def self.count
    @@number_of_squares
  end
end

a = Square.new
b = Square.new
puts Square.count
```

    2


### 6.2.2 Class Methods versus Instance Methods


```ruby
class Square
  def initialize(side_length)
    @side_length = side_length
  end
  def area
    @side_length * @side_length
  end
end
```




    :area




```ruby
class Square
  def self.test_method
    puts "Hello from the Square class!"
  end
  def test_method
    puts "Hello from an instance of class Square!"
  end
end

Square.test_method
Square.new.test_method
```

    Hello from the Square class!
    Hello from an instance of class Square!



```ruby
class Square
  def self.test_method
    puts "Hello from the Square class!"
  end
end
```




    :test_method



### 6.2.3 Inheritance


```ruby
class ParentClass
  def method1
    puts "Hello from method1 in the parent class"
  end
  def method2
    puts "Hello from method2 in the parent class"
  end
end

class ChildClass < ParentClass
  def method2
    puts "Hello from method2 in the child class"
  end
end

my_object = ChildClass.new
my_object.method1
```

    Hello from method1 in the parent class



```ruby
my_object.method2
```

    Hello from method2 in the child class



```ruby
class Person
  def initialize(name)
    @name = name
  end
  def name
    return @name
  end
end
```




    :name




```ruby
Person.new("Peter").name
```




    "Peter"




```ruby
class Doctor < Person
  def name
    "Dr. " + super
  end
end
```




    :name




```ruby
Doctor.new("Peter").name
```




    "Dr. Peter"




```ruby

```

### 6.2.4 Overriding Existing Methods


```ruby
x = "This is a test"
puts x.class
```

    String



```ruby
puts x.length
puts x.upcase
```

    14
    THIS IS A TEST



```ruby
1 + 1
```




    2




```ruby
class String
  def length
    20
  end
end
```


```ruby
puts "This is a test".length
puts "a".length
puts "A really long line of text".length
```

    14
    1
    26



```ruby
class Dog
  def talk
    puts "Woof!"
  end
end
my_dog = Dog.new
my_dog.talk
```

    Woof!



```ruby
class Dog
  def talk
    puts "Howl!"
  end
end
my_dog.talk
```

    Howl!


### 6.2.5 Reflection and Discovering an Object's Methods


```ruby
a = "This is a test"
puts a.methods.join(' ')
```

    unicode_normalize include? to_c unicode_normalize! unicode_normalized? % * + count partition unpack encode encode! next casecmp insert bytesize match succ! next! upto index rindex replace clear chr +@ -@ setbyte getbyte <=> << scrub scrub! byteslice == === dump =~ downcase [] []= upcase downcase! capitalize swapcase upcase! oct empty? eql? hex chars split capitalize! swapcase! concat codepoints reverse lines bytes prepend scan ord reverse! center sub freeze inspect intern end_with? gsub chop crypt gsub! start_with? rstrip sub! ljust length size strip! succ rstrip! chomp strip rjust lstrip! tr! chomp! squeeze lstrip tr_s! to_str to_sym chop! each_byte each_char each_codepoint to_s to_i tr_s delete encoding force_encoding sum delete! squeeze! tr to_f valid_encoding? slice slice! rpartition each_line b ascii_only? hash to_r to_json to_json_raw to_json_raw_object < > <= >= between? instance_of? public_send instance_variable_get instance_variable_set instance_variable_defined? remove_instance_variable private_methods kind_of? instance_variables tap is_a? extend to_enum enum_for !~ respond_to? display object_id send method public_method singleton_method define_singleton_method nil? class singleton_class clone dup itself taint tainted? untaint untrust trust untrusted? methods protected_methods frozen? public_methods singleton_methods ! != __send__ equal? instance_eval instance_exec __id__



```ruby
class Person
  attr_accessor :name, :age
end

p = Person.new
p.name = "Fred"
p.age = 20
puts p.instance_variables
```

    [:@name, :@age]


### 6.2.6 Encapsulation


```ruby
class Person
  def initialize(name)
    set_name(name)
  end
  def name
    @first_name + ' ' + @last_name
  end
  def set_name(name)
    first_name, last_name = name.split(/\s+/)
    set_first_name(first_name)
    set_last_name(last_name)
  end
  def set_first_name(name)
    @first_name = name
  end
  def set_last_name(name)
    @last_name = name
  end
end
```




    :set_last_name




```ruby
p = Person.new("Fred Bloggs")
puts p.name
```

    Fred Bloggs



```ruby
p = Person.new("Fred Bloggs")
p.set_last_name("Smith")
puts p.name
```

    Fred Smith



```ruby
class Person
  def initialize(name)
    set_name(name)
  end
  def name
    @first_name + ' ' + @last_name
  end

# private

  def set_name(name)
    first_name, last_name = name.split(/\s+/)
    set_first_name(first_name)
    set_last_name(last_name)
  end
  def set_first_name(name)
    @first_name = name
  end
  def set_last_name(name)
    @last_name = name
  end
end
```




    :set_last_name




```ruby
p = Person.new("Fred Bloggs")
p.set_last_name("Smith")
```


```ruby
class Person
  def initialize(age)
    @age = age
  end
  def age
    @age
  end
  def age_difference_with(other_person)
    (self.age - other_person.age).abs
  end
  protected :age
end

fred = Person.new(34)
chris = Person.new(25)
puts chris.age_difference_with(fred)
puts chris.age
```

    9
    25


### 6.2.7 Polymorphism


```ruby
class Animal
  attr_accessor :name
  def initialize(name)
    @name = name
  end
end

class Cat < Animal
  def talk
    "Meaow!"
  end
end

class Dog < Animal
  def talk
    "Woof!"
  end
end

animals = [Cat.new("Flossie"), Dog.new("Clive"), Cat.new("Max")]
animals.each do |animal|
  puts animal.talk
end
```

    Meaow!
    Woof!
    Meaow!





    [#<Cat:0x00000003039708 @name="Flossie">, #<Dog:0x00000003039668 @name="Clive">, #<Cat:0x00000003039618 @name="Max">]




```ruby
puts 1000.to_s
puts [1,2,3].to_s
puts ({ :name => 'Fred', :age => 10 }).to_s
```

    1000
    [1, 2, 3]
    {:name=>"Fred", :age=>10}


### 6.2.8 Nested Classes


```ruby
class Drawing
  class Line
  end

  class Circle
  end
end
```


```ruby
class Drawing
  def self.give_me_a_circle
    Circle.new
  end

  class Line
  end

  class Circle
    def what_am_i
      "This is a circle"
    end
  end
end

a = Drawing.give_me_a_circle
puts a.what_am_i
a = Drawing::Circle.new
puts a.what_am_i
a = Circle.new
puts a.what_am_i
```

### 6.2.9 The Scope of Constants


```ruby
def circumference_of_circle(radius)
  2 * Pi * radius
end

Pi = 3.141592
puts circumference_of_circle(10)
```

    62.83184



```ruby
Pi = 3.141592

class OtherPlanet
  Pi = 4.5
  def self.circumference_of_circle(radius)
    radius * 2 * Pi
  end
end

puts OtherPlanet.circumference_of_circle(10)
```

    <main>:2: warning: already initialized constant Pi
    <main>:4: warning: previous definition of Pi was here


    90.0


## 6.3 Modules, Namespaces, and Mix-Ins

### 6.3.1 Namespaces


```ruby
def random
  rand(1000000)
end
puts random
```

    492148



```ruby
def random
  (rand(26) + 65).chr
end
```




    :random




```ruby
module NumberStuff
  def self.random
    rand(1000000)
  end
end

module LetterStuff
  def self.random
    (rand(26) + 65).chr
  end
end

puts NumberStuff.random
puts LetterStuff.random
```

    423999
    Q



```ruby
module ToolBox
  class Ruler
    attr_accessor :length
  end
end
```


```ruby
module Country
  class Ruler
    attr_accessor :name
  end

end

a = ToolBox::Ruler.new
a.length = 50
b = Country::Ruler.new
b.name = "Genghis Khan from Moskau"
```




    "Genghis Khan from Moskau"



### 6.3.2 Mix-Ins


```ruby
module UsefulFeatures
  def class_name
    self.class.to_s
  end
end

class Person
  include UsefulFeatures
end

x = Person.new
puts x.class_name
```

    Person



```ruby
module AnotherModule
  def do_stuff
    puts "This is a test"
  end
end
```




    :do_stuff




```ruby
include AnotherModule
do_stuff
```

    This is a test


* __Enumerable__


```ruby
[1,2,3,4,5].each { |number| puts number }
```

    1
    2
    3
    4
    5





    [1, 2, 3, 4, 5]




```ruby
my_array = %w{this is a test of the longest word check}
longest_word = ''

my_array.each do |word|
  longest_word = word if longest_word.length < word.length
end

puts longest_word
```

    longest



```ruby
my_array = %w{10 56 92 3 49 588 18}
highest_number = 0

my_array.each do |number|
  number = number.to_i
  highest_number = number if number > highest_number
end

puts highest_number
```

    588



```ruby
[1,2,3,4].collect { |i| i.to_s + "x" }
```




    ["1x", "2x", "3x", "4x"]




```ruby
[1,2,3,4].detect { |i| i.between?(2,3) }
```




    2




```ruby
[1,2,3,4].select { |i| i.between?(2,3) }
```




    [2, 3]




```ruby
[4,1,3,2].sort
```




    [1, 2, 3, 4]




```ruby
[1,2,3,4].max
```




    4




```ruby
[1,2,3,4].min
```




    1




```ruby
class AllVowels
  VOWELS = %w{a e i o u}
  def each
    VOWELS.each { |v| yield v }
  end
end
```




    :each




```ruby
x = AllVowels.new
x.each { |v| puts v }
```

    a
    e
    i
    o
    u





    ["a", "e", "i", "o", "u"]




```ruby
class AllVowels
  include Enumerable
  VOWELS = %w{a e i o u}
  def each
    VOWELS.each { |v| yield v }
  end
end
```

    <main>:2: warning: already initialized constant AllVowels::VOWELS
    <main>:1: warning: previous definition of VOWELS was here





    :each




```ruby
x = AllVowels.new
```




    #<AllVowels:0x00000002f8da70>




```ruby
x.collect { |i| i + "x" }
```




    ["ax", "ex", "ix", "ox", "ux"]




```ruby
x.detect { |i| i > "j" }
```




    "o"




```ruby
x.select { |i| i > "j" }
```




    ["o", "u"]




```ruby
x.sort
```




    ["a", "e", "i", "o", "u"]




```ruby
x.max
```




    "u"




```ruby
x.min
```




    "a"



* __Comparable__


```ruby
1 <=> 2
```




    -1




```ruby
1 <=> 1
```




    0




```ruby
2 <=> 1
```




    1




```ruby
class Song
  include Comparable
  attr_accessor :length

  def <=>(other)
    @length <=> other.length
  end
  def initialize(song_name, length)
    @song_name = song_name
    @length = length
  end
end

a = Song.new('Rock around the clock', 143)
b = Song.new('Bohemian Rhapsody', 544)
c = Song.new('Minute Waltz', 60)
```




    #<Song:0x00000002d791a8 @song_name="Minute Waltz", @length=60>




```ruby
a < b
```




    true




```ruby
b >= c
```




    true




```ruby
c > a
```




    false




```ruby
a.between?(c,b)
```




    true



* __Using Mix-Ins with Namespaces and Classes__


```ruby
module ToolBox
  class Ruler
    attr_accessor :length
  end
end

module Country
  class Ruler
    attr_accessor :name
  end
end

a = ToolBox::Ruler.new
a.length = 50
b = Country::Ruler.new
b.name = "Genghis Khan of Moskau"
```




    "Genghis Khan of Moskau"




```ruby
include Country
c = Ruler.new
c.name = "King Henry VIII"
```




    "King Henry VIII"



## 6.4 Building a Dungeon Text Adventure with Objects

### 6.4.1 Dungeon Concepts

### 6.4.2 Creating the Initial Classes


```ruby
class Dungeon
  attr_accessor :player
  def initialize(player)
    @player = player
    @rooms = {}
  end
end

class Player
  attr_accessor :name, :location
  def initialize(player_name)
    @name = player_name
  end
end

class Room
  attr_accessor :reference, :name, :description, :connections
  def initialize(reference, name, description, connections)
    @reference = reference
    @name = name
    @description = description
    @connections = connections
  end
end
```




    :initialize




```ruby
me = Player.new("Fred Bloggs")
my_dungeon = Dungeon.new(me)
puts my_dungeon.player.name
```

    Fred Bloggs


### 6.4.3 Structs: Quick and Easy Data Classes


```ruby
Person = Struct.new(:name, :gender, :age)
fred = Person.new("Fred", "male", 50)
chris = Person.new("Chris", "male", 25)
puts fred.age + chris.age
```

    <main>:1: warning: already initialized constant Person
    <main>:6: warning: previous definition of Person was here


    75



```ruby
class Person
  attr_accessor :name, :gender, :age
  def initialize(name, gender, age)
    @name = name
    @gender = gender
    @age = age
  end
end
```




    :initialize




```ruby
class Dungeon
  attr_accessor :player
  def initialize(player)
    @player = player
    @rooms = {}
  end
end

Player = Struct.new(:name, :location)
Room = Struct.new(:reference, :name, :description, :connections)
```

    <main>:8: warning: already initialized constant Player
    <main>:8: warning: previous definition of Player was here
    <main>:9: warning: already initialized constant Room
    <main>:15: warning: previous definition of Room was here





    Room




```ruby
class Person
  attr_accessor :name, :age
end

x = Person.new
x.name = "Fred"
x.age = 10
puts x.name, x.age
```


```ruby
class Person
  def name
    @name
  end
  def name=(name)
    @name = name
  end
  def age
    @age
  end
  def age=(age)
    @age = age
  end
end
```




    :age=



### 6.4.4 Creating Rooms


```ruby
class Dungeon
  def add_room(reference, name, description, connections)
    @rooms[reference] = Room.new(reference, name, description, connections)
  end
end
```




    :add_room




```ruby
my_dungeon.add_room(:largecave, "Large Cave", "a large cavernous cave", { :west => :smallcave })
```




    #<struct Room reference=:largecave, name="Large Cave", description="a large cavernous cave", connections={:west=>:smallcave}>




```ruby
my_dungeon.add_room(:smallcave, "Small Cave", "a small, claustrophobic cave", { :east => :largecave })
```




    #<struct Room reference=:smallcave, name="Small Cave", description="a small, claustrophobic cave", connections={:east=>:largecave}>



### 6.4.5 Making the Dungeon Work


```ruby
class Dungeon
  def start(location)
    @player.location = location
    show_current_description
  end

  def show_current_description
    puts find_room_in_dungeon(@player.location).full_description
  end

  def find_room_in_dungeon(reference)
    @rooms[reference]
  end
end

class Room
  def full_description
    @name + "\n\nYou are in " + @description
  end
end
```


```ruby
class Dungeon
  attr_accessor :player

  def initialize(player)
    @player = player
    @rooms = {}
  end

  def add_room(reference, name, description, connections)
    @rooms[reference] = Room.new(reference, name, description, connections)
  end

  def start(location)
    @player.location = location
    show_current_description
  end

  def show_current_description
    puts find_room_in_dungeon(@player.location).full_description
  end

  def find_room_in_dungeon(reference)
    @rooms[reference]
  end

  def find_room_in_direction(direction)
    find_room_in_dungeon(@player.location).connections[direction]
  end

  def go(direction)
    puts "You go " + direction.to_s
    @player.location = find_room_in_direction(direction)
    show_current_description
  end
end
```


```ruby
class Player
  attr_accessor :name, :location

  def initialize(name)
    @name = name
  end
end

class Room
  attr_accessor :reference, :name, :description, :connections

  def initialize(reference, name, description, connections)
    @reference = reference
    @name = name
    @description = description
    @connections = connections
  end

  def full_description
    @name + "\n\nYou are in " + @description
  end
end
```


```ruby
player = Player.new("Fred Bloggs")
my_dungeon = Dungeon.new(player)

# Add rooms to the dungeon
my_dungeon.add_room(:largecave,
                    "Large Cave",
                    "a large cavernous cave",
                    { :west => :smallcave })

my_dungeon.add_room(:smallcave,
                    "Small Cave",
                    "a small, claustrophobic cave",
                    { :east => :largecave })

# Start the dungeon by placing the player in the large cave
my_dungeon.start(:largecave)
```


```ruby
def find_room_in_direction(direction)
  find_room_in_dungeon(@player.location).connections[direction]
end

def go(direction)
  puts "You go " + direction.to_s
  @player.location = find_room_in_direction(direction)
  show_current_description
end
```


```ruby
my_dungeon.add_room(:largecave,
                    "Large Cave",
                    "a large cavernous cave",
                    { :west => :smallcave })
```


```ruby
my_dungeon.show_current_description
```


```ruby
my_dungeon.go(:west)
```


```ruby
my_dungeon.go(:east)
```

## 6.5 Summary


```ruby

```
