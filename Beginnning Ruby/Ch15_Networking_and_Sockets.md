
# Chapter 15: Networking and Sockets
<!-- toc orderedList:0 depthFrom:1 depthTo:6 -->

* [Chapter 15: Networking and Sockets](#chapter-15-networking-and-sockets)
  * [15.1 Networking Concepts](#151-networking-concepts)
    * [15.1.1 TCP and UDP](#1511-tcp-and-udp)
    * [15.1.2 IP Addresses and DNS](#1512-ip-addresses-and-dns)
  * [15.2 Basic Network Operations](#152-basic-network-operations)
    * [15.2.1 Checking Machine and Service Availability](#1521-checking-machine-and-service-availability)
    * [15.2.2 Performing DNS Queries](#1522-performing-dns-queries)
    * [15.2.3 Connecting to a TCP Server Directly](#1523-connecting-to-a-tcp-server-directly)
  * [15.3 Servers and Clients](#153-servers-and-clients)
    * [15.3.1 UDP Client and Server](#1531-udp-client-and-server)
    * [15.3.2 Building a Simple TCP Server](#1532-building-a-simple-tcp-server)
    * [15.3.3 Multi-Client TCP Servers](#1533-multi-client-tcp-servers)
    * [15.3.4 GServer](#1534-gserver)
    * [15.3.5 A GServer-Based Chat Server](#1535-a-gserver-based-chat-server)
    * [15.3.6 Web/HTTP Servers](#1536-webhttp-servers)
  * [15.4 Summary](#154-summary)

<!-- tocstop -->


## 15.1 Networking Concepts

### 15.1.1 TCP and UDP

### 15.1.2 IP Addresses and DNS

## 15.2 Basic Network Operations

### 15.2.1 Checking Machine and Service Availability


```ruby
require 'net/ping'
if Net::Ping::External.new('www.google.com').ping
    puts "Pong!"
else
    puts "No response"
end
```


```ruby
require 'net/ping'
if Net::Ping::TCP.new('www.google.com', 80).ping
    puts "Pong!"
else
    puts "No response"
end
```

### 15.2.2 Performing DNS Queries


```ruby
require 'resolv'
puts Resolv.getaddress("www.google.com")
```


```ruby
require 'resolv'
ip = "192.0.34.166"
begin
  puts Resolv.getname(ip)
rescue
  puts "No hostname associated with #{ip}"
end
```


```ruby
require 'resolv'
Resolv::DNS.open do |dns|
  mail_servers = dns.getresources("google.com", Resolv::DNS::Resource::IN::MX)
  mail_servers.each do |server|
    puts "#{server.exchange.to_s} - #{server.preference}"
  end
end
```


```ruby
require 'resolv'
require 'net/smtp'
from = "your-email@example.com"
to = "another-email@example.com"
message = <<MESSAGE_END
From: #{from}
To: #{to}
Subject: Direct e-mail test
```


```ruby
to_domain = to.match(/\@(.+)/)[1]
Resolv::DNS.open do |dns|
  mail_servers = dns.getresources(to_domain, Resolv::DNS::Resource::IN::MX)
  mail_server = mail_servers[rand(mail_servers.size)].exchange.to_s

  Net::SMTP.start(mail_server) do |smtp|
    smtp.send_message message, from, to
  end
end
```

* Note You can learn more about DNS at http://en.wikipedia.org/wiki/Domain_Name_System.

### 15.2.3 Connecting to a TCP Server Directly


```ruby
require 'net/telnet'
server = Net::Telnet::new('Host' => 'www.rubyinside.com',
  'Port' => 80,
  'Telnetmode' => false)
server.cmd("GET /test.txt HTTP/1.1\nHost: www.rubyinside.com\n") do |response|
  puts response
end
```

Net::Telnet connects towww.rubyinside.com on port 80 (the standard HTTP port) and issues these commands:
```
GET /test.txt HTTP/1.1
Host: www.rubyinside.com
```
These commands are part of the HTTP protocol and tell the remote web server to return you thetest.txt file fromwww.rubyinside.com .
The response is then printed to the screen where the first eight or so lines are HTTP headers, another part of the HTTP protocol.
This is equivalent to visiting http://www.rubyinside.com/test.txt in a web browser.

All these technicalities are shielded from you when you use the open-uri and Net::HTTP libraries, as you did in Chapter 14 , as those libraries create the correct HTTP commands and process the HTTP responses for you.
However, if you need to create a library to deal with a new or currently unsupported protocol in Ruby, you’ll probably need to use Net::Telnet or a similar library to get access to the raw TCP data.


## 15.3 Servers and Clients

### 15.3.1 UDP Client and Server


```ruby
require 'socket'
s = UDPSocket.new
s.bind(nil, 1234)
5.times do
  text, sender = s.recvfrom(16)
  puts text
end
```


```ruby
require 'socket'
s = UDPSocket.new
s.send("hello", 0, 'localhost', 1234)
```


```ruby
require 'socket'
host = 'localhost'
port = 1234
s = UDPSocket.new
s.bind(nil, port)
s.send("1", 0, host, port)
5.times do
  text, sender = s.recvfrom(16)
  remote_host = sender[3]
  puts "#{remote_host} sent #{text}"
  response = (text.to_i * 2).to_s
  puts "We will respond with #{response}"
  s.send(response, 0, host, port)
end
```

### 15.3.2 Building a Simple TCP Server


```ruby
require 'socket'
server = TCPServer.new(1234)
while connection = server.accept
  while line = connection.gets
    break if line =~ /quit/
    puts line
    connection.puts "Received!"
  end
  connection.puts "Closing the connection. Bye!"
  connection.close
end
```


```ruby
require 'net/telnet'
server = Net::Telnet::new('Host' => '127.0.0.1',
'Port' => 1234,
'Telnetmode' => false)
lines_to_send = ['Hello!', 'This is a test', 'quit']
lines_to_send.each do |line|
  server.puts(line)

  server.waitfor(/./) do |data|
    puts data
  end
end
```

### 15.3.3 Multi-Client TCP Servers


```ruby
require 'socket'
server = TCPServer.new(1234)
loop do
  Thread.start(server.accept) do |connection|
    while line = connection.gets
      break if line =~ /quit/
      puts line
      connection.puts "Received!"
    end
    connection.puts "Closing the connection. Bye!"
    connection.close
  end
end
```

### 15.3.4 GServer


```ruby
require 'gserver'
class HelloServer < GServer
  def serve(io)
    io.puts("Hello!")
  end
end

server = HelloServer.new(1234)
server.start
server.join
```


```ruby
require 'gserver'
class HelloServer < GServer
  def serve(io)
    io.puts("Say something to me:")
    line = io.gets
    io.puts("You said '#{line.chomp}'")
  end
end

server = HelloServer.new(1234, '127.0.0.1', 4)
server.start
server.join
```


```ruby
require 'gserver'
class HelloServer < GServer
  def serve(io)
    io.puts("Say something to me:")
    line = io.gets
    io.puts("You said '#{line.chomp}'")
  end
end

server = HelloServer.new(1234, '127.0.0.1', 4)
server.start

server2 = HelloServer.new(1235, '127.0.0.1', 4)
server2.start
sleep 10
```


```ruby
require 'gserver'

class HelloServer < GServer
  def serve(io)
    io.puts("To stop this server, type 'shutdown'")
    self.stop if io.gets =~ /shutdown/
  end
end

server = HelloServer.new(1234)
server.start

loop do
  break if server.stopped?
end

puts "Server has been terminated"
```


```ruby
if GServer.in_service?(1234)
  puts "Can't create new server. Already running!"
else
  server = HelloServer.new(1234)
end
```

### 15.3.5 A GServer-Based Chat Server


```ruby
require 'gserver'
class ChatServer < GServer
  def initialize(*args)
    super(*args)
    # Keep an overall record of the client IDs allocated
    # and the lines of chat
    @client_id = 0
    @chat = []
  end
end
```


```ruby
server = ChatServer.new(1234)
server.start

loop do
  break if server.stopped?
end
```

### 15.3.6 Web/HTTP Servers


```ruby
require 'gserver'
class ChatServer < GServer
  def initialize(*args)
    super(*args)
    # Keep an overall record of the client IDs allocated
    # and the lines of chat
    @client_id = 0
    @chat = []
  end

  def serve(io)
    # Increment the client ID so each client gets a unique ID
    @client_id += 1
    my_client_id = @client_id
    my_position = @chat.size

    io.puts("Welcome to the chat, client #{@client_id}!")

    # Leave a message on the chat queue to signify this client
    # has joined the chat
    @chat << [my_client_id, "<joins the chat>"]

    loop do
      # Every 2 seconds check to see if we are receiving any data
      if IO.select([io], nil, nil, 2)
        # If so, retrieve the data and process it...
        line = io.gets

        # If the user says 'quit', disconnect them
      if line =~ /quit/
        @chat << [my_client_id, "<leaves the chat>"]
        break
      end

      # Shut down the server if we hear 'shutdown'
      self.stop if line =~ /shutdown/

      # Add the client's text to the chat array along with the
      # client's ID
      @chat << [my_client_id, line]
    else
      # No data, so print any new lines from the chat stream
      @chat[my_position..(@chat.size - 1)].each_with_index do |line, index|
        io.puts("#{line[0]} says: #{line[1]}")
      end
      # Move the position to one past the end of the array
      my_position = @chat.size
    end
  end

end
end

server = ChatServer.new(1234)
server.start

loop do
  break if server.stopped?
end
```

## 15.4 Summary
