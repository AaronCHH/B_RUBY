
# Chapter 7: Projects and Libraries
<!-- toc orderedList:0 depthFrom:1 depthTo:6 -->

* [Chapter 7: Projects and Libraries](#chapter-7-projects-and-libraries)
  * [7.1 Projects and Using Code from Other Files](#71-projects-and-using-code-from-other-files)
    * [7.1.1 Basic File Inclusion](#711-basic-file-inclusion)
    * [7.1.2 Inclusions from Other Directories](#712-inclusions-from-other-directories)
    * [7.1.3 Logic and Including Code](#713-logic-and-including-code)
    * [7.1.4 Nested Inclusions](#714-nested-inclusions)
  * [7.2 Libraries](#72-libraries)
    * [7.2.1 The Standard Libraries](#721-the-standard-libraries)
    * [7.2.2 RubyGems](#722-rubygems)
    * [7.2.3 Bundler](#723-bundler)
  * [7.3 Summary](#73-summary)

<!-- tocstop -->


## 7.1 Projects and Using Code from Other Files

### 7.1.1 Basic File Inclusion


```ruby
puts "This is a test".vowels.join('-')
```

    i-i-a-e



```ruby
# place this into string_extensions.rb
class String
  def vowels
   self.scan(/[aeiou]/i)
  end
end
```




    :vowels




```ruby
class String
  def vowels
    self.scan(/[aeiou]/i)
  end
end
```




    :vowels




```ruby
require './string_extensions'
puts "This is a test".vowels.join('-')
```


```ruby
require_relative 'string_extensions'
puts "This is a test".vowels.join('-')
```


```ruby
load 'string_extensions.rb'
puts "This is a test".vowels.join('-')
```


```ruby
puts "Hello from a.rb"
```


```ruby
require_relative 'a'
puts "Hello from b.rb"
require_relative 'a'
puts "Hello again from b.rb"
```


```ruby
load 'a.rb'
puts "Hello from b.rb"
load 'a.rb'
puts "Hello again from b.rb"
```

### 7.1.2 Inclusions from Other Directories

### 7.1.3 Logic and Including Code

### 7.1.4 Nested Inclusions

## 7.2 Libraries


```ruby
class String
  def vowels
    self.scan(/[aeiou]/i)
  end
end
```




    :vowels



### 7.2.1 The Standard Libraries

* __net/http__


```ruby
require 'net/http'
Net::HTTP.get_print('www.rubyinside.com', '/')
```


```ruby
require 'net/http'
url = URI.parse('http://www.rubyinside.com/')
response = Net::HTTP.start(url.host, url.port) do |http|
  http.get(url.path)
end
content = response.body
```

* __OpenStruct__


```ruby
Person = Struct.new(:name, :age)
me = Person.new("Fred Bloggs", 25)
me.age += 1
```


```ruby
require 'ostruct'
person = OpenStruct.new
person.name = "Fred Bloggs"
person.age = 25
```

### 7.2.2 RubyGems

* __Finding Gems__


```ruby

```

* __Installing a Simple Gem__


```ruby
gem install chronic
```


```ruby
gem install -v 0.10.2 chronic
```

* __Using Gems__


```ruby
require 'chronic'
puts Chronic.parse('may 10th')
```

    2017-05-10 12:00:00 +0800


* __Upgrading and Uninstalling Gems__


```ruby
gem update
```


```ruby
gem uninstall feedtools
```


```ruby
gem uninstall rubyforge
```

* __Creating Your Own Gems__


```ruby

```

### 7.2.3 Bundler


```ruby
require 'bundler/setup'
require 'rack'
# Now Rack 1.1 or above is loaded properly
```

## 7.3 Summary


```ruby

```
