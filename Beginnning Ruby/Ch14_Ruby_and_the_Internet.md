
# Chapter 14: Ruby and the Internet
<!-- toc orderedList:0 depthFrom:1 depthTo:6 -->

* [Chapter 14: Ruby and the Internet](#chapter-14-ruby-and-the-internet)
  * [14.1 HTTP and the Web](#141-http-and-the-web)
    * [14.1.1 Downloading Web Pages](#1411-downloading-web-pages)
    * [14.1.2 Processing Web Content](#1412-processing-web-content)
  * [14.2 E-Mail](#142-e-mail)
    * [14.2.1 Receiving Mail with POP3](#1421-receiving-mail-with-pop3)
    * [14.2.2 Sending Mail with SMTP](#1422-sending-mail-with-smtp)
    * [14.2.3 Sending Mail with ActionMailer](#1423-sending-mail-with-actionmailer)
  * [14.3 File Transfers with FTP](#143-file-transfers-with-ftp)
    * [14.3.1 Connection and Basic FTP Actions](#1431-connection-and-basic-ftp-actions)
    * [14.3.2 Downloading Files](#1432-downloading-files)
    * [14.3.3 Uploading Files](#1433-uploading-files)
  * [14.4 Summary](#144-summary)

<!-- tocstop -->


## 14.1 HTTP and the Web

### 14.1.1 Downloading Web Pages

* __The net/http Library__


```ruby
require 'net/http'

Net::HTTP.start('www.rubyinside.com') do |http|
  req = Net::HTTP::Get.new('/test.txt')
  puts http.request(req).body
end
```

    Hello Beginning Ruby reader!



This example loads the net/http library, connects to the web serverwww.rubyinside.com (the semi-official blog associated with this book; take a look!), and performs an HTTPGET request for/test.txt .
This file’s contents are then returned and displayed.
The equivalent URL for this request is http://www.rubyinside.com/test.txt, and if you load that URL in your web browser, you’ll get the same response as Ruby.


* Note http://www.rubyinside.com/test.txt is a live document that you can use in all the HTTP request tests safely, and has been created specifically for readers of this book.


```ruby
require 'net/http'

url = URI.parse('http://www.rubyinside.com/test.txt')

Net::HTTP.start(url.host, url.port) do |http|
  req = Net::HTTP::Get.new(url.path)
  puts http.request(req).body
end
```


```ruby
require 'net/http'

url = URI.parse('http://www.rubyinside.com/test.txt')
response = Net::HTTP.get_response(url)
puts response.body
```

* __Checking for Errors and Redirects__


```ruby
require 'net/http'

def get_web_document(url)
  uri = URI.parse(url)
  response = Net::HTTP.get_response(uri)

  case response
    when Net::HTTPSuccess
      return response.body
    when Net::HTTPRedirection
      return get_web_document(response['Location'])
    else
      return nil
  end
end

puts get_web_document('http://www.rubyinside.com/test.txt')
puts get_web_document('http://www.rubyinside.com/non-existent')
puts get_web_document('http://www.rubyinside.com/redirect-test')

```

    Hello Beginning Ruby reader!


    Hello Beginning Ruby reader!



* Note http://www.rubyinside.com/redirect-test has been set up as a redirect to http://www.rubyinside.com/test.txt.
This helps to demonstrate that the redirect is handled correctly.

* Note A list of HTTP errors and their associated Net::HTTP response classes is available at http://www.ruby-doc.org/stdlib/libdoc/net/http/rdoc/classes/Net/HTTP.html.

* __Basic Authentication__


```ruby
require 'net/http'

url = URI.parse('http://browserspy.dk/password-ok.php')

Net::HTTP.start(url.host, url.port) do |http|
  req = Net::HTTP::Get.new(url.path)
  req.basic_auth('test', 'test')
  puts http.request(req).body
end
```

* __Posting Form Data__


```ruby
require 'net/http'

url = URI.parse('http://www.rubyinside.com/test.cgi')

response = Net::HTTP.post_form(url,{'name' => 'David', 'age' => '24'})
puts response.body
```

    You say David is 24 years old.



```ruby
require 'net/http'

url = URI.parse('http://www.rubyinside.com/test.cgi')

Net::HTTP.start(url.host, url.port) do |http|
  req = Net::HTTP::Post.new(url.path)
  req.set_form_data({ 'name' => 'David', 'age' => '24' })
  puts http.request(req).body
end
```

    You say David is 24 years old.


* __Using HTTP Proxies__


```ruby
web_proxy = Net::HTTP::Proxy('your.proxy.hostname.or.ip', 8080)
```


```ruby
require 'net/http'

web_proxy = Net::HTTP::Proxy('your.proxy.hostname.or.ip', 8080)

url = URI.parse('http://www.rubyinside.com/test.txt')

web_proxy.start(url.host, url.port) do |http|
  req = Net::HTTP::Get.new(url.path)
  puts http.request(req).body
end
```


```ruby
require 'net/http'

web_proxy = Net::HTTP::Proxy('your.proxy.hostname.or.ip', 8080)
url = URI.parse('http://www.rubyinside.com/test.txt')

response = web_proxy.get_response(url)
puts response.body
```


```ruby
require 'net/http'

http_class = ARGV.first ? Net::HTTP::Proxy(ARGV[0], ARGV[1]) : Net::HTTP
url = URI.parse('http://www.rubyinside.com/test.txt')

response = http_class.get_response(url)
puts response.body

```

* __Secure HTTP with HTTPS__


```ruby
require 'net/http'
require 'net/https'

url = URI.parse('https://example.com/')

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true if url.scheme == 'https'

request = Net::HTTP::Get.new(url.path)
puts http.request(request).body
```


```ruby
require 'net/http'
require 'net/https'

url = URI.parse('https://example.com/')

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true if url.scheme == 'https'

request = Net::HTTP::Post.new(url.path)
request.set_form_data({ 'credit_card_number' => '1234123412341234' })
puts http.request(request).body
```

* __The Open-Uri Library__


```ruby
require 'open-uri'

f = open('http://www.rubyinside.com/test.txt')

puts "The document is #{f.size} bytes in length"

f.each_line do |line|
  puts line
end
```


```ruby
require 'open-uri'

open('http://www.rubyinside.com/test.txt') do |f|
  puts f.readlines.join
end
```


```ruby
require 'open-uri'

url = URI.parse('http://www.rubyinside.com/test.txt')
url.open { |f| puts f.read }
```


```ruby
require 'open-uri'
puts URI.parse('http://www.rubyinside.com/test.txt').open.read
```


```ruby
require 'open-uri'

f = open('http://www.rubyinside.com/test.txt')

puts f.content_type
puts f.charset
puts f.last_modified
```


```ruby
require 'open-uri'

f = open('http://www.rubyinside.com/test.txt',
         {'User-Agent' => 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0)'})

puts f.read
```

### 14.1.2 Processing Web Content

* __Parsing HTML with Nokogiri__


```ruby
require 'nokogiri'

html = <<END_OF_HTML
<html>
<head>
  <title>This is the page title</title>
</head>

<body>
  <h1>Big heading!</h1>
  <p>A paragraph of text.</p>
  <ul><li>Item 1 in a list</li><li>Item 2</li><li class="highlighted">Item
3</li></ul>
</body>
</html>
END_OF_HTML

doc = Nokogiri::HTML(html)
puts doc.css("h1").first.inner_html
```


```ruby

require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open('http://www.rubyinside.com/test.html'))
puts doc.css("h1").first.inner_html

```

* Note http://www.rubyinside.com/test.html contains the same HTML code as used in the prior example.


```ruby

list = doc.css("ul").first
list.css("li").each do |item|
  puts item.inner_html
end

```


```ruby
list = doc.at("ul")
```


```ruby
list = doc.at("ul")
highlighted_item = list.at(".highlighted")
puts highlighted_item.inner_html
```

* __Parsing XML with REXML__


```ruby
# <people>
#   <person>
#     <name>Peter Cooper</name>
#     <gender>Male</gender>
#   </person>
#   <person>
#     <name>Fred Bloggs</name>
#     <gender>Male</gender>
#   </person>
# </people>
```


```ruby
require 'rexml/document'

xml = <<END_XML
<people>
  <person>
    <name>Peter Cooper</name>
    <gender>Male</gender>
  </person>
  <person>
    <name>Fred Bloggs</name>
    <gender>Male</gender>
  </person>
</people>
END_XML

tree = REXML::Document.new(xml)

tree.elements.each("people/person") do |person|
  puts person.get_elements("name").first
end
```

* Note You can learn more about XPath and its syntax at http://en.wikipedia.org/wiki/XPath.
REXML also has support for XQuery, which you can learn more about at http://en.wikipedia.org/wiki/XQuery .

## 14.2 E-Mail

### 14.2.1 Receiving Mail with POP3


```ruby
require 'net/pop'

mail_server = Net::POP3.new('mail.mailservernamehere.com')

begin
  mail_server.start('username','password')
  if mail_server.mails.empty?
    puts "No mails"
  else
    puts "#{mail_server.mails.length} mails waiting"
  end
rescue
  puts "Mail error"
end
```


```ruby
mail_server.mails.each do |m|
  mail = m.pop
  puts mail
end
```


```ruby
mail_server.mails.each do |m|
  m.delete if m.pop =~ /\bthis is a spam e-mail\b/i
end
```


```ruby
mail_server.mails.each do |m|
  m.delete if m.header =~ /Subject:.+?medicines\b/i
end
```

### 14.2.2 Sending Mail with SMTP


```ruby
require 'net/smtp'

message = <<MESSAGE_END
From: Private Person <me@privacy.net>
To: Author of Beginning Ruby <test@rubyinside.com>
Subject: SMTP e-mail test

This is a test e-mail message.
MESSAGE_END

Net::SMTP.start('localhost') do |smtp|
  smtp.send_message message, 'me@privacy.net', 'test@rubyinside.com'
end
```


```ruby
Net::SMTP.start('mail.your-domain.com')
```


```ruby
Net::SMTP.start('mail.your-domain.com', 25, 'localhost', 'username', ➥
'password', :plain)
```

### 14.2.3 Sending Mail with ActionMailer


```ruby
require 'action_mailer'

class Emailer < ActionMailer::Base
  def test_email(email_address, email_body)
    mail(to: email_address, from: 'me@privacy.net', subject: 'test', body: email_body)
  end
end

Emailer.test_email('me@privacy.net', 'This is a test e-mail!').deliver_now

```


```ruby
ActionMailer::Base.smtp_settings = {
  :address => "mail.your-domain.com",
  :port => 25,
  :authentication => :login,
  :user_name => "username",
  :password => "password",
}

```

* Tip You can also check out Pony, a library that makes it easy to send e-mails from Ruby, at http://github.com/benprew/pony .

## 14.3 File Transfers with FTP


```ruby
require 'open-uri'

output = File.new('1.8.2-patch1.gz', 'wb')
open('ftp://ftp.ruby-lang.org/pub/ruby/1.8/1.8.2-patch1.gz') do |f|
  output.print f.read
end
output.close

```

### 14.3.1 Connection and Basic FTP Actions


```ruby

require 'net/ftp'
require 'uri'

uri = URI.parse('ftp://ftp.ruby-lang.org/')

Net::FTP.open(uri.host) do |ftp|
  ftp.login 'anonymous', 'me@privacy.net'
  ftp.passive = true
  ftp.list(uri.path) { |path| puts path }
end

```


```ruby
require 'net/ftp'

ftp = Net::FTP.new('ftp.ruby-lang.org')
ftp.passive = true
ftp.login
ftp.list('*') { |file| puts file }
ftp.close
```


```ruby
ftp.login(username, password)
```


```ruby
ftp.chdir('pub')
```


```ruby
ftp.chdir('/pub/ruby')
```


```ruby
ftp.mkdir('test')
```


```ruby
ftp.rename(filename, new_name)
ftp.delete(filename)
```

### 14.3.2 Downloading Files


```ruby
require 'net/ftp'

ftp = Net::FTP.new('ftp.ruby-lang.org')
ftp.passive = true
ftp.login
ftp.chdir('/pub/ruby/1.8')
ftp.getbinaryfile('1.8.2-patch1.gz')
ftp.close
```


```ruby
ftp.getbinaryfile('ruby-1.8.7.tar.gz', 'local-filename', 102400) do |blk|
  puts "A 100KB block of the file has been downloaded"
end
```


```ruby
ftp.getbinaryfile('ruby-1.8.7.tar.gz', 'local-filename', 102400) do |blk|
  .. do something with blk here ..
end
```

### 14.3.3 Uploading Files


```ruby
require 'net/ftp'

ftp = Net::FTP.new('ftp.domain.com')
ftp.passive = true
ftp.login
ftp.chdir('/your/folder/name/here')
ftp.putbinaryfile('local_file')
ftp.close
```


```ruby
require 'net/ftp'

ftp = Net::FTP.new('ftp.domain.com')
ftp.passive = true
ftp.login
ftp.chdir('/your/folder/name/here')

count = 0

ftp.putbinaryfile('local_file', 'local_file', 100000) do |block|
  count += 100000
  puts "#{count} bytes uploaded"
end

ftp.close
```


```ruby
require 'net/ftp'
require 'tempfile'

tempfile = Tempfile.new('test')

my_data = "This is some text data I want to upload via FTP."
tempfile.puts my_data

ftp = Net::FTP.new('ftp.domain.com')
ftp.passive = true
ftp.login
ftp.chdir('/your/folder/name/here')

ftp.puttextfile(tempfile.path, 'my_data')

ftp.close
tempfile.close

```

## 14.4 Summary

In this chapter, we looked at Ruby’s support for using various Internet systems and protocols, how Ruby can work with the Web, and how to process and manipulate data retrieved from the Internet.
Let’s reflect on the main concepts covered in this chapter:

* __HTTP (HyperText Transfer Protocol) :__
A protocol that defines the way web browsers (clients) and web servers talk to each other across a network such as the Internet.
* __HTTPS :__
A secure version of HTTP that ensures data being transferred in either direction is only readable at each end.
Anyone intercepting an HTTPS stream cannot decipher it.
It’s commonly used for e-commerce and for transmitting financial data on the Web.
* __HTML (HyperText Markup Language) :__
A text formatting and layout language used to represent web pages.
* __Nokogiri :__
An HTML and XML parser developed to make it easy to process and parse HTML and XML directly with Ruby.
It is noted for its speed, with portions that demand extra performance written in C.
* __POP3 (Post Office Protocol 3) :__
A mail server protocol commonly used when retrieving e-mail.
You can learn more about the protocol specifically at http://www.ietf.org/rfc/rfc1939.txt .
* __SMTP (Simple Mail Transfer Protocol) :__
A mail server protocol commonly used to transfer mail to a mail server or between mail servers.
From a typical user’s perspective, SMTP is used for sending mail, rather than receiving it.
You can learn more about the protocol specifically at http://www.faqs.org/rfcs/rfc821.html.
* __FTP (File Transfer Protocol) :__
An Internet protocol for providing access to files located on a server and allowing users to download from it and upload to it.
This chapter covered a variety of Internet-related functions, but in Chapter 15 we’re going to look more deeply at networking, servers, and network services.
Most of what is covered in Chapter 15 is also applicable to the Internet, but is at a much lower level than FTP or using the Web.



```ruby

```
