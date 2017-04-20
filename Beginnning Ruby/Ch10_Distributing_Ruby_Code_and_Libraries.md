
# Chapter 10: Distributing Ruby Code and Libraries
<!-- toc orderedList:0 depthFrom:1 depthTo:6 -->

* [Chapter 10: Distributing Ruby Code and Libraries](#chapter-10-distributing-ruby-code-and-libraries)
  * [10.1 Distributing Basic Ruby Programs](#101-distributing-basic-ruby-programs)
    * [10.1.1 The Shebang Line](#1011-the-shebang-line)
    * [10.1.2 Associated File Types in Windows](#1012-associated-file-types-in-windows)
  * [10.2 Detecting Ruby's Runtime Environment](#102-detecting-rubys-runtime-environment)
    * [10.2.1 Easy OS Detection with RUBY_PLATFORM](#1021-easy-os-detection-with-ruby_platform)
    * [10.2.2 Environment Variables](#1022-environment-variables)
    * [10.2.3 Accessing Command-Line Arguments](#1023-accessing-command-line-arguments)
  * [10.3 Distributing Ruby Libraries as Gems](#103-distributing-ruby-libraries-as-gems)
    * [10.3.1 Creating a Gem](#1031-creating-a-gem)
    * [10.3.2 Distributing a Gem](#1032-distributing-a-gem)
    * [10.3.3 RubyGems.org](#1033-rubygemsorg)
  * [10.4 Deploying Ruby Applications as Remote Services](#104-deploying-ruby-applications-as-remote-services)
    * [10.4.1 CGI Scripts](#1041-cgi-scripts)
    * [10.4.2 Generic HTTP Servers](#1042-generic-http-servers)
  * [10.5 Summary](#105-summary)

<!-- tocstop -->


## 10.1 Distributing Basic Ruby Programs


```ruby
puts "Your program works!"
```


```ruby
# ruby test.rb
```

### 10.1.1 The Shebang Line


```ruby
#!/usr/bin/env ruby
puts "Your program works!"
```

### 10.1.2 Associated File Types in Windows

## 10.2 Detecting Ruby's Runtime Environment

### 10.2.1 Easy OS Detection with RUBY_PLATFORM


```ruby
if RUBY_PLATFORM =~ /win32/
  puts "We're in Windows!"
elsif RUBY_PLATFORM =~ /linux/
  puts "We're in Linux!"
elsif RUBY_PLATFORM =~ /darwin/
  puts "We're in Mac OS X!"
elsif RUBY_PLATFORM =~ /freebsd/
  puts "We're in FreeBSD!"
else
  puts "We're running under an unknown operating system."
end
```

### 10.2.2 Environment Variables


```ruby
# irb(main):001:0> ENV.each {|e| puts e.join(': ') }
```


```ruby
tmp_dir = '/tmp'
if ENV['OS'] =~ /Windows_NT/
  puts "This program is running under Windows NT/2000/XP!"
  tmp_dir = ENV['TMP']
elsif ENV['PATH'] =~ /\/usr/
  puts "This program has access to a UNIX-style file system!"
else
  puts "I cannot figure out what environment I'm running in!"
  exit
end

# [.. do something here ..]
```

### 10.2.3 Accessing Command-Line Arguments


```ruby
p ARGV
```


```ruby
# ruby argvtest.rb these are command line parameters
```


```ruby
#!/usr/bin/env ruby
p ARGV
```


```ruby
# ./argvtest.rb these are command line parameters
```


```ruby
# cp /directory1/from_filename /directory2/destination_filename
```


```ruby
#!/usr/bin/env ruby
from_filename = ARGV[0]
destination_filename = ARGV[1]
```

## 10.3 Distributing Ruby Libraries as Gems

### 10.3.1 Creating a Gem


```ruby
class String
  def vowels
    scan(/[aeiou]/i)
  end
end
```


```ruby
"This is a test".vowels
```


```ruby
require_relative 'string_extend'
```

* __Structuring Your Files__

* __Creating a Specification File__


```ruby
Gem::Specification.new do |s|
  s.name = 'string_extend'
  s.version = '0.0.1'
  s.summary = "StringExtend adds useful features to the String class"
  s.platform = Gem::Platform::RUBY
  s.files = Dir.glob("**/**/**")
  s.test_files = Dir.glob("test/*_test.rb")
  s.author = "Your Name"
  s.email = "your-email-address@email.com"
  s.has_rdoc = false
s.required_ruby_version = '>= 1.8.2'
end
```


```ruby
s.name = 'string_extend'
```


```ruby
s.version = '0.0.1'
```


```ruby
s.summary = "StringExtend adds useful features to the String class"
```


```ruby
s.files = Dir.glob("**/**/**")
```


```ruby
s.test_files = Dir.glob("test/*_test.rb")
```


```ruby
s.required_ruby_version = '>= 1.8.2'
```

* http://guides.rubygems.org/specification-reference/ .

* __Building the Gem__


```ruby
# gem build <spec file>
```


```ruby
# gem build string_extend.gemspec
```

* __Easier Gem Creation__


```ruby
# bundle gem string_extend
```


```ruby
# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'string_extend/version'

Gem::Specification.new do |spec|
  spec.name          = "string_extend"
  spec.version       = StringExtend::VERSION
  spec.authors       = ["Peter Cooper"]
  spec.email         = ["git@peterc.org"]
  spec.summary       = %q{TODO: Write a short summary. Required.}
  spec.description   = %q{TODO: Write a longer description. Optional.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
```

### 10.3.2 Distributing a Gem


```ruby
# gem install gem_name
```

### 10.3.3 RubyGems.org

* RubyGems.org (http://rubygems.org/)


```ruby
gem push your_gems_filename-0.0.1.gem
```


```ruby
rake release
```

## 10.4 Deploying Ruby Applications as Remote Services

<div id="toc"></div>

### 10.4.1 CGI Scripts

* __A Basic CGI Script__


```ruby
#!/usr/bin/ruby

puts "Content-type: text/html\n\n"
puts "<html><body>This is a test</body></html>"
```


```ruby
#!/usr/bin/ruby

require 'cgi'

cgi = CGI.new

puts cgi.header
puts "<html><body>This is a test</body></html>"
```

* __Accepting CGI Variables__


```ruby
#!/usr/bin/ruby

require 'cgi'
cgi = CGI.new

text = cgi['text']

puts cgi.header
puts "<html><body>#{text.reverse}</body></html>"
```


```ruby
#!/usr/bin/ruby

require 'cgi'
cgi = CGI.new

from = cgi['from'].to_i
to = cgi['to'].to_i

number = rand(to-from+1) + from

puts cgi.header
puts "<html><body>#{number}</body></html>"
```


```ruby
# <form method="POST" action="http://www.example.com/test.cgi">
# For a number between <input type="text" name="from" value="" /> and
# <input type="text" name="to" value="" /> <input type="submit"
# value="Click here!" /></form>
```

### 10.4.2 Generic HTTP Servers

* __WEBrick__


```ruby
require 'webrick'

server = WEBrick::GenericServer.new( :Port => 1234 )

trap("INT"){ server.shutdown }

server.start do |socket|
   socket.puts Time.now
end

```


```ruby
require 'webrick'

class MyServlet < WEBrick::HTTPServlet::AbstractServlet
  def do_GET(request, response)
     response.status = 200
     response.content_type = "text/plain"
     response.body = "Hello, world!"
  end
end

server = WEBrick::HTTPServer.new( :Port => 1234 )
server.mount "/", MyServlet
trap("INT"){ server.shutdown }
server.start
```


```ruby
response.body = "You are trying to load #{request.path}"
```


```ruby
require 'webrick'

class MyNormalClass
  def MyNormalClass.add(a, b)
    a.to_i + b.to_i
  end
  def MyNormalClass.subtract(a,b)
    a.to_i - b.to_i
  end
end

class MyServlet < WEBrick::HTTPServlet::AbstractServlet
  def do_GET(request, response)
    if request.query['a'] && request.query['b']
      a = request.query['a']
      b = request.query['b']
      response.status = 200
      response.content_type = 'text/plain'
      result = nil

      case request.path
        when '/add'
          result = MyNormalClass.add(a,b)
        when '/subtract'
          result = MyNormalClass.subtract(a,b)
        else
          result = "No such method"
      end

      response.body = result.to_s + "\n"
    else
      response.status = 400
      response.body = "You did not provide the correct parameters"
    end
  end
end

server = WEBrick::HTTPServer.new(:Port => 1234)
server.mount '/', MyServlet
trap('INT'){ server.shutdown }
server.start
```

## 10.5 Summary

In this chapter, we looked at how to deploy Ruby programs and libraries, as well as how to make their functions available to web browsers and other applications over a network.
We also interrogated the environment so we can pursue different techniques on a per-operating system basis if we choose.
Let’s reflect on the main concepts covered in this chapter:
* Shebang line : A special line at the start of a source code file that determines which interpreter is used to process the file. Used primarily on UNIX-based operating systems, shebang lines can also work on Windows when used with the Apache web server.
* RUBY_PLATFORM : A special variable preset by Ruby that contains the name of the current platform (environment).
* Environment variables : Special variables set by the operating system or other processes that contain information relevant to the current execution environment and information about the operating system.
* RubyGems.org : A centralized repository and web site dedicated to hosting and distributing Ruby projects and libraries.
* GitHub : A popular hub and community site for users of the Git source code management system—now popular in the Ruby world.
You can find it at https://github.com/.
* CGI : Common Gateway Interface. A standard that enables web servers to execute scripts and provide an interface between web users and scripts located on that server.
* WEBrick : A simple and easy HTTP server library for Ruby that comes with Ruby as standard.


```ruby

```
