
# Chapter 9: Files and Databases
<!-- toc orderedList:0 depthFrom:1 depthTo:6 -->

* [Chapter 9: Files and Databases](#chapter-9-files-and-databases)
  * [9.1 Input and Output](#91-input-and-output)
    * [9.1.1 Keyboard Input](#911-keyboard-input)
    * [9.1.2 File I/O](#912-file-io)
  * [9.2 Basic Databases](#92-basic-databases)
    * [9.2.3 Text File Databases](#923-text-file-databases)
    * [9.2.4 Storing Objects and Data Structures](#924-storing-objects-and-data-structures)
  * [9.3 Relational Databases and SQL](#93-relational-databases-and-sql)
    * [9.3.5 Relational Database Concepts](#935-relational-database-concepts)
    * [9.3.6 MySQL, PostgreSQL, and SQLite](#936-mysql-postgresql-and-sqlite)
    * [9.3.7 Installing SQLite](#937-installing-sqlite)
    * [9.3.8 A Crash Course in Basic Database Operations and SQL](#938-a-crash-course-in-basic-database-operations-and-sql)
    * [9.3.9 Using SQLite with Ruby](#939-using-sqlite-with-ruby)
    * [9.3.10 Connecting to Other Database Systems](#9310-connecting-to-other-database-systems)
    * [9.3.11 ActiveRecord: A Sneak Peek](#9311-activerecord-a-sneak-peek)
  * [9.4 Summary](#94-summary)

<!-- tocstop -->


## 9.1 Input and Output

### 9.1.1 Keyboard Input


```ruby
a = gets
puts a
```

* STANDARD INPUT AND OUTPUT


```ruby
ruby test.rb < somedata.txt
```


```ruby
lines = readlines
puts lines.length
```


```ruby
ruby linecount.rb < textfile.txt
```

### 9.1.2 File I/O

* __Opening and Reading Files__


```ruby
File.open("text.txt").each { |line| puts line }
```


```ruby
File.new("text.txt", "r").each { |line| puts line }
```


```ruby
File.open("text.txt") do |f|
   puts f.gets
end
```


```ruby
f = File.new("text.txt", "r")
puts f.gets
f.close
```


```ruby
class MyFile
  attr_reader :handle

  def initialize(filename)
    @handle = File.new(filename, "r")
  end

  def finished
    @handle.close
  end
end

f = MyFile.new("text.txt")
puts f.handle.gets
f.finished
```

* __More File-Reading Techniques__


```ruby
File.open("text.txt").each { |line| puts line }
```


```ruby
File.open("text.txt").each(',') { |line| puts line }
```


```ruby
File.open("text.txt").each_byte { |byte| puts byte }
```


```ruby
File.open("text.txt").each_char { |byte| puts byte }
```


```ruby
File.open("text.txt") do |f|
  2.times { puts f.gets }
end
```


```ruby
File.open("text.txt") do |f|
   2.times { puts f.gets(',') }
end
```


```ruby
File.open("text.txt") do |f|
  2.times { puts f.getc }
end
```


```ruby
puts File.open("text.txt").readlines.join("--")
```


```ruby
File.open("text.txt") do |f|
  puts f.read(6)
end
```


```ruby
data = File.read(“text.txt”)
```


```ruby
array_of_lines = File.readlines(“text.txt”)
```

* __Your Position Within a File__


```ruby
f = File.open("text.txt")
puts f.pos
puts f.gets
puts f.pos
```


```ruby
f = File.open("text.txt")
f.pos = 8
puts f.gets
puts f.pos
```

* __Writing to Files__


```ruby
File.open("text.txt", "w") do |f|
   f.puts "This is a test"
end
```


```ruby
f = File.new("logfile.txt", "a")
f.puts Time.now
f.close
```


```ruby
f = File.open("text.txt", "r+")
puts f.gets
f.puts "This is a test"
puts f.gets
f.close
```


```ruby
f = File.open("text.txt", "r+")
f.putc "X"
f.close
```


```ruby
f = File.open("text.txt", "r+")
f.write "123456"
f.close
```

* __Character Sets and Encodings__


```ruby
File.new("text.txt", "r:utf-8").each { |line| puts line }
```


```ruby
p File.open("text.txt", "r:iso-8859-1").external_encoding
p File.open("text.txt", "r").external_encoding
```


```ruby
File.open("text.txt", "r:utf-8:iso-8859-1") do |f|
  p f.external_encoding
  first_line = f.gets
  p first_line.encoding
end
```

* __Renaming and Deleting Files__


```ruby
File.rename("file1.txt", "file2.txt")
```


```ruby
File.delete("file1.txt")
File.delete("file2.txt", "file3.txt", "file4.txt")
File.unlink("file1.txt")
```

* __File Operations__

* Creating Filenames Platform-Independently


```ruby
File.join('full', 'path', 'here', 'filename.txt')
```


```ruby
File.join('full', 'path', 'here', 'filename.txt')
```


```ruby
File.join(File::SEPARATOR , 'full', 'path', 'here', 'filename.txt')
```


```ruby
File.expand_path("text.txt")
```

* Seeking


```ruby
f = File.open("text.txt", "r+")
f.seek(-5, IO::SEEK_END)
f.putc "X"
f.close
```


```ruby
f = File.open("text.txt", "r")
while a = f.getc
    puts a.chr
      f.seek(5, IO::SEEK_CUR)
end
```

* __Finding Out When a File Was Last Modified__


```ruby
puts File.mtime("text.txt")
```


```ruby
t = File.mtime("text.txt")
puts t.hour
puts t.min
puts t.sec
```

* __Checking Whether a File Exists__


```ruby
puts "It exists!" if File.exist?("file1.txt")
```


```ruby
class MyFile
  attr_reader :handle

  def initialize(filename)
    if File.exist?(filename)
      @handle = File.new(filename, "r")
    else
      return false
    end
  end
end
```

* __Getting the Size of a File__


```ruby
puts File.size("text.txt")
```

* __How to Know When You're at the End of a File__


```ruby
f = File.new("test.txt", "r")
while !f.eof?
  puts f.gets
end
f.close

```

* __Directories__

* __Navigating Through Directories__


```ruby
Dir.chdir("/usr/bin")
```


```ruby
puts Dir.pwd
```


```ruby
Dir.chdir("/usr/bin")
puts Dir.pwd
```


```ruby
puts Dir.entries("/usr/bin").join(' ')
```


```ruby
Dir.foreach("/usr/bin") do |entry|
  puts entry
end
```


```ruby
Dir["/usr/bin/*"]
```

* __Creating a Directory__


```ruby
Dir.mkdir("mynewdir")
```


```ruby
Dir.mkdir("/mynewdir")
Dir.mkdir("c:\test")
```

* __Deleting a Directory__


```ruby
Dir.delete("mynewdir")
```


```ruby
require 'fileutils'
FileUtils.rm_f(directory_name)
```

* __Creating Files in the Temporary Directory__


```ruby
require 'tmpdir'
puts Dir.tmpdir
```


```ruby

```


```ruby
require 'tmpdir'
tempfilename = File.join(Dir.tmpdir, "myapp.dat")
tempfile = File.new(tempfilename, "w")
tempfile.puts "This is only temporary"
tempfile.close
File.delete(tempfilename)
```


```ruby
require 'tempfile'
f = Tempfile.new('myapp')
f.puts "Hello"
puts f.path
f.close
```

## 9.2 Basic Databases

### 9.2.3 Text File Databases


```ruby
# Fred Bloggs,Manager,Male,45
# Laura Smith,Cook,Female,23
# Debbie Watts,Professor,Female,38
```

* __Reading and Searching CSV Data__


```ruby
require 'csv'
CSV.open('text.txt').each do |person|
  p person
end
```


```ruby
require 'csv'
people = CSV.parse(File.read('text.txt'))
puts people[0][0]
puts people[1][0]
puts people[2][0]
```


```ruby
require 'csv'
p CSV.read('text.txt')
```


```ruby
require 'csv'
people = CSV.read('text.txt')
laura = people.find { |person| person[0] =~ /Laura/ }
p laura
```


```ruby
young_people = people.find_all do |p|
  p[3].to_i.between?(20, 40)
end
p young_people
```

* __Saving Data Back to the CSV File__


```ruby
require 'csv'
people = CSV.read('text.txt')
laura = people.find { |person| person[0] =~ /Laura/ }
laura[0] = "Lauren Smith"

CSV.open('text.txt', 'w') do |csv|
  people.each do |person|
    csv << person
  end
end
```

### 9.2.4 Storing Objects and Data Structures

* __PStore__


```ruby
class Person
   attr_accessor :name, :job, :gender, :age
end
```


```ruby
fred = Person.new
fred.name = "Fred Bloggs"
fred.age = 45

laura = Person.new
laura.name = "Laura Smith"
laura.age = 23
```


```ruby
require 'pstore'
store = PStore.new("storagefile")
store.transaction do
  store[:people] ||= Array.new
  store[:people] << fred
  store[:people] << laura
end
```


```ruby
require 'pstore'
store = PStore.new("storagefile")
people = []
store.transaction do
  people = store[:people]
end

# At this point the Person objects inside people can be treated
# as totally local objects.
people.each do |person|
  puts person.name
end
```

* __YAML__


```ruby
require 'yaml'

class Person
  attr_accessor :name, :age
end

fred = Person.new
fred.name = "Fred Bloggs"
fred.age = 45

laura = Person.new
laura.name = "Laura Smith"
laura.age = 23
test_data = [ fred, laura ]

puts test_data.to_yaml
```


```ruby
require 'yaml'

class Person
  attr_accessor :name, :age
end

yaml_string = <<END_OF_DATA
---
- !ruby/object:Person
  age: 45
  name: Jimmy
- !ruby/object:Person
  age: 23
  name: Laura Smith
END_OF_DATA

test_data = YAML.load(yaml_string)
puts test_data[0].name
puts test_data[1].name
```

* To learn more about YAML formatting, read its Wikipedia entry at http://en.wikipedia.org/wiki/YAML, or refer to the official YAML web site at http://www.yaml.org/.

## 9.3 Relational Databases and SQL

### 9.3.5 Relational Database Concepts

### 9.3.6 MySQL, PostgreSQL, and SQLite

### 9.3.7 Installing SQLite


```ruby
require 'sqlite3'
puts "It's all okay!" if defined?(SQLite3::Database)
```

### 9.3.8 A Crash Course in Basic Database Operations and SQL

* __What Is SQL__

* __CREATE TABLE__


```ruby
# CREATE TABLE table_name (
# column_name data_type options,
# column_name data_type options,
# ...,
# ...
# );
```

* __INSERT INTO__


```ruby
# CREATE TABLE people (
# id integer primary key,
# name varchar(50),
# job varchar(50),
# gender varchar(6),
# age integer);
```


```ruby
# INSERT INTO people (name, age, gender, job) VALUES ("Chris Scott", 25, "Male", "Technician");
```


```ruby
# INSERT INTO people VALUES ("Chris Scott", 25, "Male", "Technician");
```

* __SELECT__


```ruby
# SELECT * FROM people;
```


```ruby
# SELECT name FROM people;
```


```ruby
# SELECT * FROM people WHERE id = 2;
```


```ruby
# SELECT * FROM people WHERE name = "Chris Scott";
```


```ruby
# SELECT * FROM people WHERE age >= 20 AND age <= 40;
```


```ruby
# SELECT * FROM people ORDER BY name DESC;
```


```ruby
# SELECT * FROM people WHERE age >= 20 AND age <= 40 ORDER BY age ASC;
```


```ruby
# SELECT * FROM people ORDER BY name DESC LIMIT 5;
```


```ruby
# SELECT * FROM people ORDER BY age DESC LIMIT 1;
```

* __DELETE__


```ruby
# DELETE FROM people WHERE name="Chris";
# DELETE FROM people WHERE age > 100;
# DELETE FROM people WHERE gender = "Male" AND age < 50;
```


```ruby
# DELETE FROM people WHERE age > 100 LIMIT 10;
```

* __UPDATE__


```ruby
# SELECT * FROM people WHERE name = "Chris";
# UPDATE people SET name = "Christopher" WHERE name = "Chris";
```


```ruby
# UPDATE people SET name = "Christopher" WHERE name = "Chris";
```


```ruby
# UPDATE people SET name = "Christopher", age = 44 WHERE name = "Chris";
```


```ruby
# UPDATE people SET name = "Christopher" WHERE name = "Chris" AND age = 25;
```


```ruby
# UPDATE people SET name = "Christopher";
```

### 9.3.9 Using SQLite with Ruby


```ruby

require 'sqlite3'
$db = SQLite3::Database.new("dbfile")
$db.results_as_hash = true

def disconnect_and_quit
  $db.close
  puts "Bye!"
  exit
end

def create_table
  puts "Creating people table"
  $db.execute %q{
    CREATE TABLE people (
    id integer primary key,
    name varchar(50),
    job varchar(50),
    gender varchar(6),
    age integer)
  }
end

def add_person
  puts "Enter name:"
  name = gets.chomp
  puts "Enter job:"
  job = gets.chomp
  puts "Enter gender:"
  gender = gets.chomp
  puts "Enter age:"
  age = gets.chomp
  $db.execute("INSERT INTO people (name, job, gender, age) VALUES (?, ?, ?, ?)",➥
    name, job, gender, age)
end

def find_person
  puts "Enter name or ID of person to find:"
  id = gets.chomp

  person = $db.execute("SELECT * FROM people WHERE name = ? OR id = ?", id, id.to_i).first

  unless person
    puts "No result found"
    return
  end

  puts %Q{Name: #{person['name']}
Job: #{person['job']}
Gender: #{person['gender']}
Age: #{person['age']}}
end

loop do
  puts %q{Please select an option:

    1. Create people table
    2. Add a person
    3. Look for a person
    4. Quit}

  case gets.chomp
    when '1'
      create_table
    when '2'
      add_person
    when '3'
      find_person
    when '4'
      disconnect_and_quit
  end
end

```

### 9.3.10 Connecting to Other Database Systems

* http://sequel.jeremyevans.net/


```ruby
require 'sequel'
require 'pg'

DB = Sequel.connect('postgres://user:password@localhost/dbname')

DB.create_table :people do
  primary_key :id
  String :first_name
  String :last_name
  Integer :age
end

people = DB[:people]
people.insert( :first_name => "Fred", :last_name => "Bloggs", :age => 32 )

puts "There are #{people.count} people in the database"

people.each do |person|
  puts person[:first_name]
end

DB.fetch("SELECT * FROM people") do |row|
  puts row[:first_name]
end
```

### 9.3.11 ActiveRecord: A Sneak Peek


```ruby
person = Person.where(name: “Chris”).first
person.age = 50
person.save
```


```ruby
# SELECT * FROM people WHERE name = "Chris";
# UPDATE people SET age = 50 WHERE name = "Chris";
```

## 9.4 Summary


```ruby

```
