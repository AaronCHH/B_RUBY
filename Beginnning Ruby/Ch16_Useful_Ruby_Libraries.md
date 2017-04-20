
# Chapter 16: Useful Ruby Libraries
<!-- toc orderedList:0 depthFrom:1 depthTo:6 -->

* [Chapter 16: Useful Ruby Libraries](#chapter-16-useful-ruby-libraries)
  * [16.1 abbrev](#161-abbrev)
    * [16.1.1 Installation](#1611-installation)
    * [16.1.2 Examples](#1612-examples)
    * [16.1.3 Further Information](#1613-further-information)
  * [16.2 base64](#162-base64)
    * [16.2.1 Installation](#1621-installation)
    * [16.2.2 Examples](#1622-examples)
    * [16.2.3 Further Information](#1623-further-information)
  * [16.3 Benchmark](#163-benchmark)
    * [16.3.1 Installation](#1631-installation)
    * [16.3.2 Examples](#1632-examples)
    * [16.3.3 Further Information](#1633-further-information)
  * [16.4 cgi](#164-cgi)
    * [16.4.1 Installation](#1641-installation)
    * [16.4.2 Examples](#1642-examples)
    * [16.4.3 Further Information](#1643-further-information)
  * [16.5 chronic](#165-chronic)
    * [16.5.1 Installation](#1651-installation)
    * [16.5.2 Examples](#1652-examples)
    * [16.5.3 Further Information](#1653-further-information)
  * [16.6 Digest](#166-digest)
    * [16.6.1 Installation](#1661-installation)
    * [16.6.2 Examples](#1662-examples)
    * [16.6.3 Further Information](#1663-further-information)
  * [16.7 English](#167-english)
    * [16.7.1 Installation](#1671-installation)
    * [16.7.2 Examples](#1672-examples)
    * [16.7.3 Further Information](#1673-further-information)
  * [16.8 ERB](#168-erb)
    * [16.8.1 Installation](#1681-installation)
    * [16.8.2 Examples](#1682-examples)
    * [16.8.3 Further Information](#1683-further-information)
  * [16.9 json](#169-json)
    * [16.9.1 Installation](#1691-installation)
    * [16.9.2 Examples](#1692-examples)
    * [16.9.3 Further Information](#1693-further-information)
  * [16.10 logger](#1610-logger)
    * [16.10.1 Installation](#16101-installation)
    * [16.10.2 Examples](#16102-examples)
    * [16.10.3 Further Information](#16103-further-information)
  * [16.11 Nokogiri](#1611-nokogiri)
    * [16.11.1 Installation](#16111-installation)
    * [16.11.2 Examples](#16112-examples)
    * [16.11.3 Further Information](#16113-further-information)
  * [16.12 pp](#1612-pp)
    * [16.12.1 Installation](#16121-installation)
    * [16.12.2 Examples](#16122-examples)
    * [16.12.3 Further Information](#16123-further-information)
  * [16.13 RedCarpet](#1613-redcarpet)
    * [16.13.1 Installation](#16131-installation)
    * [16.13.2 Examples](#16132-examples)
    * [16.13.3 Further Information](#16133-further-information)
  * [16.14 StringScanner](#1614-stringscanner)
    * [16.14.1 Installation](#16141-installation)
    * [16.14.2 Examples](#16142-examples)
    * [16.14.3 Further Information](#16143-further-information)
  * [16.15 tempfile](#1615-tempfile)
    * [16.15.1 Installation](#16151-installation)
    * [16.15.2 Examples](#16152-examples)
    * [16.15.3 Further Information](#16153-further-information)
  * [16.16 uri](#1616-uri)
    * [16.16.1 Installation](#16161-installation)
    * [16.16.2 Examples](#16162-examples)
    * [16.16.3 Further Information](#16163-further-information)
  * [16.17 zlib](#1617-zlib)
    * [16.17.1 Installation](#16171-installation)
    * [16.17.2 Examples](#16172-examples)
    * [16.17.3 Further Information](#16173-further-information)

<!-- tocstop -->


## 16.1 abbrev

### 16.1.1 Installation


```ruby
require 'abbrev'

```

### 16.1.2 Examples


```ruby
require 'abbrev'
require 'pp'

pp Abbrev::abbrev(%w{Peter Patricia Petal Petunia})
```


```ruby
require 'abbrev'

abbrevs = %w{Peter Paul Patricia Petal Pauline}.abbrev
puts "Please enter your name:"
name = gets.chomp

if a = abbrevs.find { |a, n| a.downcase == name.downcase }
  puts "Did you mean #{a.join(' or ')}?"
  name = gets.chomp
end
```

### 16.1.3 Further Information

* Official documentation for abbrev: http://www.ruby-doc.org/stdlib/libdoc/abbrev/rdoc/Abbrev.html

## 16.2 base64

* Note The Base64 standard is technically specified in RFC 2045 at https://www.ietf.org/rfc/rfc2045.txt.

### 16.2.1 Installation


```ruby
require 'base64'
```

### 16.2.2 Examples

* __Converting Binary Data to Base64__


```ruby
require 'base64'
puts Base64.encode64('testing')

```


```ruby
require 'base64'
puts Base64.encode64(File.read('/bin/bash'))
```

* __Converting Base64 Data to Binary Data__


```ruby

require 'base64'
puts Base64.decode64(Base64.encode64('testing'))

```

* __Using Compression to Make Base64 Efficient__


```ruby
require 'base64'
require 'zlib'

module Base64
  def Base64.new_encode64(data)
    encode64(Zlib::Deflate.deflate(data))
  end
  def Base64.new_decode64(data)
    Zlib::Inflate.inflate(decode64(data))
  end
end

test_data = 'this is a test' * 100

data = Base64.encode64(test_data)
puts "The uncompressed data is #{data.length} bytes long in Base64"

data = Base64.new_encode64(test_data)
puts "The compressed data is #{data.length} bytes long in Base64"

```

### 16.2.3 Further Information

The following are some links to good information on the base64 library, and on Base64 in general:
* Standard library documentation for base64 :http://www.ruby-doc.org/stdlib/libdoc/base64/rdoc/index.html
* General information about the Base64 standard :http://en.wikipedia.org/wiki/Base64
* A practical look at how Base64 works :http://email.about.com/cs/standards/a/base64_encoding.htm


## 16.3 Benchmark

### 16.3.1 Installation


```ruby
require 'benchmark'
```

### 16.3.2 Examples


```ruby
require 'benchmark'
puts Benchmark.measure { 10000000.times { rand } }
```


```ruby
require 'benchmark'

TIMES = 10000000
Benchmark.bm do |b|
  b.report("times") { TIMES.times { rand } }
  b.report("upto") { 1.upto(TIMES) { rand } }
  b.report("loop") {
    i = 0
    loop do
      rand
      i += 1
      break if i == TIMES
    end
  }
end
```

### 16.3.3 Further Information

* Official documentation for Benchmark: http://ruby-doc.org/stdlib-2.3.0/libdoc/benchmark/rdoc/Benchmark.html

## 16.4 cgi

### 16.4.1 Installation


```ruby
require 'cgi'
```

### 16.4.2 Examples

* __A Basic CGI Script__


```ruby
#!/usr/bin/ruby
require 'cgi'
cgi = CGI.new
puts cgi.header
puts "<html><body>This is a test</body></html>"
```

If this Ruby script were namedtest.cgi , uploaded to the aforementioned web host, and made executable (usingchmod ), it would be possible to access http://www.your-website.com/test.cgi and see “This is a test” in response.

You could also run a local Web server if you wanted to test this concept.
First, create acgi folder, place your CGI script (say,code.cgi ) into that folder,chmod that script to be executable (e.g.,chmod 777 code.cgi ), then run a Ruby-based HTTP server (using WEBrick) withruby -run -e httpd -- -p 5000.
 Finally, visit http://localhost:5000/ .



```ruby
#!/usr/bin/ruby
require 'cgi'
cgi = CGI.new
cgi.out do
  "<html><body>This is a test</body></html>"
end
```

* Note Learn more aboutout and what features it supports at http://www.ruby-doc.org/stdlib/libdoc/cgi/rdoc/classes/CGI.html#M000078 .

* __Accepting Passed Data__


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

number = rand(to - from + 1) + from

puts cgi.header
puts "<html><body>#{number}</body></html>"
```


```ruby
# <form method="POST" action="/test.cgi">
# For a number between <input type="text" name="from" value="" /> and
# <input type="text" name="to" value="" /> <input type="submit"
# value="Click here!" /></form>
```

* __Cookies__


```ruby

#!/usr/bin/ruby

require 'cgi'
cgi = CGI.new

cookie = cgi.cookies['count']
# If there is no cookie, create a new one
if cookie.empty?
  count = 1
  cookie = CGI::Cookie.new('count', count.to_s)
else
  # If there is a cookie, retrieve its value (note that cookie.value results
  # in an Array)
  count = cookie.value.first

  # Now send back an increased amount for the cookie to store
  cookie.value = (count.to_i + 1).to_s
end

cgi.out("cookie" => [cookie]) do
  "<html><body>You have loaded this page #{count} times</body></html>"
end

```

* __Sessions__


```ruby

#!/usr/bin/ruby
require 'cgi'
require 'cgi/session'
require 'cgi/session/pstore'

cgi = CGI.new
session = CGI::Session.new(cgi,
                           :session_key => 'count_app',
                           :database_manager => CGI::Session::PStore,
                           :prefix => 'session_id'
                           )

if session['count'] && session['count'].to_i > 0
  session['count'] = (session['count'].to_i + 1).to_s
else
  session['count'] = 1
end

cgi.out do
  "<html><body>You have loaded this page #{session['count']} times</body></html>"
end

session.close

```

* You can learn more about CGI::Session at http://www.ruby-doc.org/core/classes/CGI/Session.html , including how to makeCGI::Session store session data in different ways (such as in memory or in a plain
text format).

### 16.4.3 Further Information

* Standard library documentation for cgi :http://www.ruby-doc.org/stdlib/libdoc/cgi/rdoc/index.html
* Further information about CGI :http://www.w3.org/CGI/
* Further information about HTTP cookies :http://en.wikipedia.org/wiki/HTTP_cookie


## 16.5 chronic

### 16.5.1 Installation


```ruby
gem install chronic
```

### 16.5.2 Examples


```ruby
require 'chronic'
puts Chronic.parse('last tuesday 5am')
```

    2017-04-18 05:00:00 +0800



```ruby
puts Chronic.parse('last tuesday 5:33')
```

    2017-04-18 17:33:00 +0800



```ruby
puts Chronic.parse('last tuesday lunchtime')
```

    2017-04-18 12:00:00 +0800



```ruby
puts Chronic.parse('june 29th at 1am')
```

    2017-06-29 01:00:00 +0800



```ruby
puts Chronic.parse('in 3 years')
```

    2020-04-20 18:36:12 +0800



```ruby
puts Chronic.parse('sep 23 2033')
```

    2033-09-23 12:00:00 +0800



```ruby
puts Chronic.parse('2003-11-10 01:02')
```

    2003-11-10 01:02:00 +0800


* Note An extension to theTime class provided by the standard library can also parse times, although at a more preformatted level.
See http://ruby-doc.org/stdlib/libdoc/time/rdoc/Time.html for information.

### 16.5.3 Further Information

* Documentation for chronic :http://chronic.rubyforge.org/

## 16.6 Digest

### 16.6.1 Installation


```ruby
require 'digest/sha1'
or
require 'digest/md5'
```

### 16.6.2 Examples


```ruby
require 'digest/sha1'
puts Digest::SHA1.hexdigest('password')
```


```ruby
require 'digest/sha1'
puts Digest::SHA1.hexdigest('test' * 1000)
```


```ruby
require 'digest/md5'
puts Digest::MD5.hexdigest('test' * 1000)
```


```ruby
require 'digest/sha1'

puts "Enter the password to use this program:"
password = gets
if Digest::SHA1.hexdigest(password) == ➥
                         '24b63c0840ec7e58e5ab50d0d4ca243d1729eb65'
  puts "You've passed!"
else
  puts "Wrong!"
  exit
end
```


```ruby
Digest::SHA1.digest('test' * 1000)
```


```ruby
Digest::SHA1.digest('test' * 1000).each_byte do |byte|
  print byte, "-"
end
```


```ruby
require 'base64'
require 'digest/sha1'

puts Digest::SHA1.hexdigest('test')
puts Base64.encode64(Digest::SHA1.digest('test'))
```

### 16.6.3 Further Information

* Further information about SHA-1: http://en.wikipedia.org/wiki/SHA-1
* Further information about MD5: http://en.wikipedia.org/wiki/MD5

## 16.7 English

### 16.7.1 Installation


```ruby
require 'English'
```

### 16.7.2 Examples

### 16.7.3 Further Information

* Standard library documentation for English: http://ruby-doc.org/stdlib/libdoc/English/rdoc/English.html

## 16.8 ERB

### 16.8.1 Installation


```ruby
require 'erb'
```

### 16.8.2 Examples

* __Basic Templates and Rendering__


```ruby

# <% 1.upto(5) do |i| %>
#   <p>This is iteration <%= i %></p>
# <% end %>

```


```ruby
require 'erb'
template = <<EOF
<% 1.upto(5) do |i| %>
  <p>This is iteration <%= i %></p>
<% end %>
EOF
puts ERB.new(template).result

```


```ruby
ERB.new(template).run
```

* __Accessing Outside Variables__


```ruby
require 'erb'

array_of_stuff = %w{this is a test}

template = <<EOF
<% array_of_stuff.each_with_index do |item, index| %>
  <p>Item <%= index %>: <%= item %></p>
<% end %>
EOF
puts ERB.new(template).result(binding)

```

* __Safe Levels__


```ruby
require 'erb'

template = <<EOF
Let's try to do something crazy like access the filesystem..
<%= `ls` %>
EOF

puts ERB.new(template, 3).result # Using safe level 3!

```

### 16.8.3 Further Information

* Standard library documentation for ERB: http://www.ruby-doc.org/stdlib/libdoc/erb/rdoc/ERB.html

## 16.9 json

### 16.9.1 Installation

### 16.9.2 Examples


```ruby
# {"name":"Maggie Robertson","age":37,"interests":["Golf","Bridge","Food"]}

```


```ruby
require 'json'

json_data = %{
  {"name":"Maggie Robertson","age":37,"interests":["Golf","Bridge","Food"]}
}

obj = JSON.load(json_data)
puts obj.class
puts obj.keys
```

    Hash
    ["name", "age", "interests"]



```ruby
require 'json'

person = {
  name: 'Maggie Robertson',
  age: 37,
  interests: ['Golf', 'Bridge', 'Food']
}

puts person.to_json
```

    {"name":"Maggie Robertson","age":37,"interests":["Golf","Bridge","Food"]}


### 16.9.3 Further Information

* Introducing JSON: http://www.json.org/
* JSON tutorial: http://www.w3schools.com/json/
https://www.w3schools.com/js/js_json_intro.asp
* Ruby JSON documentation: http://ruby-doc.org/stdlib/libdoc/json/rdoc/JSON.html


## 16.10 logger

### 16.10.1 Installation


```ruby
require 'logger'
```

### 16.10.2 Examples

* __Setting Up a Logger__


```ruby
require 'logger'
logger = Logger.new(STDERR)
```


```ruby
logger = Logger.new('mylogfile.log')
logger = Logger.new('/tmp/some_log_file.log')
```


```ruby
logger = Logger.new('mylogfile.log', 'daily')
logger = Logger.new('mylogfile.log', 'weekly')
logger = Logger.new('mylogfile.log', 'monthly')
```


```ruby
logger = Logger.new('mylogfile.log', 10, 100000)
```

* __Logging Levels__


```ruby
logger.sev_threshold = Logger::FATAL
```


```ruby
logger.sev_threshold = Logger::DEBUG
```

* __Logging Messages__


```ruby
require 'logger'
logger = Logger.new(STDOUT)

logger.debug "test"
logger.info "test"
logger.fatal "test"
```


```ruby
logger.info("myprog") { "test" }
```


```ruby
logger.add(Logger::FATAL) { "message here" }
```

* __Closing a Logger__


```ruby
logger.close
```

### 16.10.3 Further Information

* Standard library documentation for logger: http://www.ruby-doc.org/stdlib/libdoc/logger/rdoc/Logger.html

## 16.11 Nokogiri

### 16.11.1 Installation


```ruby
gem install nokogiri
```

### 16.11.2 Examples


```ruby
require 'rubygems'
require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open('http://www.cnn.com/'))

doc.css('p').each do |para|
  puts para.inner_text
end
```

### 16.11.3 Further Information

* Nokogiri homepage: http://www.nokogiri.org/
* Spotlight on Gems: Nokogiri :http://ruby.about.com/od/gems/a/nokogiri.htm
* CSS Selector tutorial: http://www.456bereastreet.com/archive/200509/css_21_selectors_part_1/
* Nokogiri GitHub repository: http://github.com/sparklemotion/nokogiri


## 16.12 pp

### 16.12.1 Installation


```ruby
require 'pp'
```




    true



### 16.12.2 Examples


```ruby
person1 = { :name => "Peter", :gender => :male }
person2 = { :name => "Laura", :gender => :female }
people = [person1, person2, person1, person1, person1]
puts people.inspect
```

    [{:name=>"Peter", :gender=>:male}, {:name=>"Laura", :gender=>:female}, {:name=>"Peter", :gender=>:male}, {:name=>"Peter", :gender=>:male}, {:name=>"Peter", :gender=>:male}]



```ruby
pp people
```

    [{:name=>"Peter", :gender=>:male},
     {:name=>"Laura", :gender=>:female},
     {:name=>"Peter", :gender=>:male},
     {:name=>"Peter", :gender=>:male},
     {:name=>"Peter", :gender=>:male}]





    [{:name=>"Peter", :gender=>:male}, {:name=>"Laura", :gender=>:female}, {:name=>"Peter", :gender=>:male}, {:name=>"Peter", :gender=>:male}, {:name=>"Peter", :gender=>:male}]




```ruby
require 'pp'

class TestClass
  def initialize(count)
    @@a = defined?(@@a) ? @@a + 1 : 0
    @c = @@a
    @d = [:a => {:b => count }, :c => :d] * count end
  end

pp TestClass.new(2), STDOUT, 60
pp TestClass.new(3), $>, 60
pp TestClass.new(4), $>, 60
```


```ruby
pp TestClass.new(4), $>, 60
```

### 16.12.3 Further Information

* Standard library documentation for pp: http://www.ruby-doc.org/stdlib/libdoc/pp/rdoc/PP.html

## 16.13 RedCarpet

### 16.13.1 Installation


```ruby
gem install redcarpet
```

### 16.13.2 Examples


```ruby
markdown_text = %{
This is a title
===============

Here is some _text_ that's formatted according to [Markdown][1]
*specifications*. And how about a quote?

 [1]: http://daringfireball.net/projects/markdown/

> This section is a quote.. a block quote
> more accurately..

Lists are also possible:

* Item 1
* Item 2
* Item 3 }

require 'redcarpet'

markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
puts markdown.render(markdown_text)
```

### 16.13.3 Further Information

* Official RedCarpet homepage: https://github.com/vmg/redcarpet
* Official Markdown format homepage: http://daringfireball.net/projects/markdown/

## 16.14 StringScanner

### 16.14.1 Installation


```ruby
require 'strscan'
```

### 16.14.2 Examples


```ruby
require 'strscan'
string = StringScanner.new "This is a test"
puts string.scan(/\w+/)
puts string.scan(/\s+/)
puts string.scan(/\w+/)
puts string.scan(/\s+/)
puts string.rest
```


```ruby
puts string.scan(/\w+/)
puts string.scan(/\w+/)
puts string.scan(/\w+/)
puts string.scan(/\w+/)
```


```ruby
puts string.scan(/\w+\s*/)
puts string.scan(/\w+\s*/)
puts string.scan(/\w+\s*/)
puts string.scan(/\w+\s*/)
```


```ruby
string = StringScanner.new "I want to live to be 100 years old!"
puts string.scan(/\w+/)
puts string.scan_until(/\d+/)
```


```ruby
string = StringScanner.new("This is a test")
puts string.scan_until(/\w+/)
puts string.scan_until(/\w+/)
puts string.scan_until(/\w+/)
puts string.scan_until(/\w+/)
```


```ruby
string = StringScanner.new "I want to live to be 100 years old!"
puts string.scan(/\w+/)
string.unscan
puts string.scan_until(/\d+/)
string.unscan
puts string.scan_until(/live/)
```


```ruby
string = StringScanner.new "I want to live to be 100 years old!"
string.scan(/\w+/)
string.unscan
puts string.pos
string.scan_until(/\d+/)
puts string.pos
string.unscan string.scan_until(/live/)
puts string.pos
```


```ruby
string = StringScanner.new "I want to live to be 100 years old!"
string.pos = 12
puts string.scan(/...../)
```

### 16.14.3 Further Information

* Standard library documentation for StringScanner: http://www.ruby-doc.org/stdlib/libdoc/strscan/rdoc/StringScanner.html

## 16.15 tempfile

### 16.15.1 Installation


```ruby
require 'tempfile'
```

### 16.15.2 Examples


```ruby
require 'tempfile'
f = Tempfile.new('myapp')
f.puts "Hello"
puts f.path f.close
f.close
f.open
```


```ruby
require 'tempfile'
f = Tempfile.new('myapp')
f.puts "Hello" f.close
f.open
puts f.read
f.close!
```


```ruby
require 'tempfile'

f = Tempfile.new('myapp')
f.puts "Hello"
f.pos = 0
f.print "Y"
f.pos = f.size - 1
f.print "w"
f.flush f.pos = 0
puts f.read
f.close!
```


```ruby
f = Tempfile.new('myapp', '/my/secret/temporary/directory')
```


```ruby
require 'tempfile'

Tempfile.open('myapp') do |f|
  f.puts "Hello" f.pos = 0 f.print "Y"
  f.pos = f.size - 1
  f.print "w"
  f.flush
  f.pos = 0
  puts f.read
end
```

### 16.15.3 Further Information

* Standard library documentation for tempfile: http://www.ruby-doc.org/stdlib/libdoc/tempfile/rdoc/Tempfile.html

## 16.16 uri

You use the urilibrary to manage Uniform Resource Identifiers (URIs) , which are typically referred to as Uniform Resource Locators (URLs).
A URL is an address such as http://www.rubyinside.com/, ftp://your-ftp-site.com/directory/filename, or even mailto:your-email-address@privacy.net.uri makes it easy to detect, create, parse, and manipulate these addresses.



### 16.16.1 Installation


```ruby
require 'uri'
```

### 16.16.2 Examples

* __Extracting URLs from Text__


```ruby
require 'uri'
puts URI.extract('Check out http://www.rubyinside.com/ or e-mail ➥
mailto:me@privacy.net').inspect
```


```ruby
require 'uri'
puts URI.extract('http://www.rubyinside.com/ and mailto:me@privacy.net', ➥
['http']).inspect
```


```ruby
require 'uri'

email = %q{Some cool Ruby sites are http://www.ruby-lang.org/ and ➥
http://www.rubyinside.com/ and http://redhanded.hobix.com/}

URI.extract(email, ['http', 'https']) do |url|
  puts "Fetching URL #{url}"
  # Do some work here...
end
```

* __Parsing URLs__


```ruby
URI.parse('http://www.rubyinside.com/')
```


```ruby
require 'uri'
a = URI.parse('http://www.rubyinside.com/')
puts a.scheme
puts a.host
puts a.port
puts a.path
puts a.query
```


```ruby
require 'uri'
url = 'http://www.x.com:1234/test/1.html?x=y&y=z#top'
puts URI.parse(url).port
puts URI.parse(url).path
puts URI.parse(url).query
puts URI.parse(url).fragment
```


```ruby
u = URI('http://www.test.com/')
```


```ruby
URI.split('http://www.x.com:1234/test/1.html?x=y&y=z#top')
```

* __Creating URLs__


```ruby
require 'uri'
u = URI::HTTP.build( :host => 'rubyinside.com', :path => '/' )
puts u.to_s
puts u.request_uri
```


```ruby
ftp_url = URI::FTP.build( :userinfo => 'username:password',
:host => 'ftp.example.com',
:path => '/pub/folder',
:typecode => 'a')

puts ftp_url.to_s
```


```ruby
require 'uri'
my_url = "http://www.test.com/something/test.html"
url = URI.parse(my_url)
url.host = "www.test2.com"
url.port = 1234
puts url.to_s
```

### 16.16.3 Further Information

* Standard library documentation for uri: http://www.ruby-doc.org/stdlib/libdoc/uri/rdoc/URI.html
* Information about URLs and URIs: http://en.wikipedia.org/wiki/URL

## 16.17 zlib

### 16.17.1 Installation


```ruby
require 'zlib'
```

### 16.17.2 Examples


```ruby
require 'zlib'

test_text = 'this is a test string' * 100
puts "Original string is #{test_text.length} bytes long"
compressed_text = Zlib::Deflate.deflate(test_text)
puts "Compressed data is #{compressed_text.length} bytes long"
```

    Original string is 2100 bytes long
    Compressed data is 46 bytes long



```ruby
require 'zlib'
test_text = 'this is a test string' * 100
puts "Original string is #{test_text.length} bytes long" compressed_text = Zlib::Deflate.deflate(test_text)
puts "Compressed data is #{compressed_text.length} bytes long"
uncompressed_text = Zlib::Inflate.inflate(compressed_text)
puts "Uncompressed data is back to #{uncompressed_text.length} bytes in length"
```


```ruby
require 'zlib'

Zlib::GzipWriter.open('my_compressed_file.gz') do |gz|
  gz.write 'This data will be compressed automatically!'
end

Zlib::GzipReader.open('my_compressed_file.gz') do |my_file|
  puts my_file.read
end
```

    This data will be compressed automatically!


### 16.17.3 Further Information

* Standard library documentation for zlib: http://www.ruby-doc.org/stdlib/libdoc/zlib/rdoc/Zlib.html


```ruby

```
