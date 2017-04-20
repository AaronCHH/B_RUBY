
# Chapter 5: The Ruby Ecosystem
<!-- toc orderedList:0 depthFrom:1 depthTo:6 -->

* [Chapter 5: The Ruby Ecosystem](#chapter-5-the-ruby-ecosystem)
  * [5.1 Ruby's History](#51-rubys-history)
    * [5.1.1 The Land of the Rising Sun](#511-the-land-of-the-rising-sun)
    * [5.1.2 Ruby's Influences](#512-rubys-influences)
    * [5.1.3 Go West](#513-go-west)
    * [5.1.4 Alternative Ruby Implementations](#514-alternative-ruby-implementations)
  * [5.2 Ruby on Rails](#52-ruby-on-rails)
    * [5.2.1 Why Rails Came into Existence](#521-why-rails-came-into-existence)
    * [5.2.2 How the Web (2.0) Was Won](#522-how-the-web-20-was-won)
  * [5.3 The Open Source Culture](#53-the-open-source-culture)
    * [5.3.1 What Is Open Source](#531-what-is-open-source)
  * [5.4 Where and How to Get Help](#54-where-and-how-to-get-help)
    * [5.4.1 Mailing Lists](#541-mailing-lists)
    * [5.4.2 Internet Relay Chat (IRC)](#542-internet-relay-chat-irc)
    * [5.4.3 Documentation](#543-documentation)
    * [5.4.4 Forums](#544-forums)
  * [5.5 Joining the Community](#55-joining-the-community)
    * [5.5.1 Give Help to Others](#551-give-help-to-others)
    * [5.5.2 Contribute Code](#552-contribute-code)
    * [5.5.3 News Sites and Sources](#553-news-sites-and-sources)
  * [5.6 Summary](#56-summary)

<!-- tocstop -->


## 5.1 Ruby's History

### 5.1.1 The Land of the Rising Sun

### 5.1.2 Ruby's Influences

### 5.1.3 Go West

Matz first began to officially promote the Ruby language in English in late 1998 with the creation of the ruby-talk mailing list, still one of the best places to discuss the Ruby language, as well as a useful resource with more than 300,000 messages archived at the list’s web site (http://blade.nagaokaut.ac.jp/ruby/ruby-talk/index.shtml ).

* Note You can subscribe toruby-talk yourself by sending an e-mail containing “subscribe” followed by your first and last name toruby-talk-ctl@ruby-lang.org .

An official English language web site soon followed in late 1999 with the creation ofruby-lang.org (http://www.ruby-lang.org/ ), which is still Ruby’s official English language web site (see Figures 5-1 and5-2 for a comparison of the official site between then and now).


### 5.1.4 Alternative Ruby Implementations

* JRuby (http://jruby.org/ ): A Ruby implementation that runs on the Java Virtual Machine (JVM).
Even in 2009, it was on par with Ruby 1.9 in terms of performance, and since then has proven to be faster than MRI in many situations.
As a Java-based implementation, JRuby gives Ruby developers access to the whole Java ecosystem, including Java libraries, distribution tools, and application servers.
Conversely, developers on the JVM platform get access to Ruby’s benefits.


* IronRuby (http://ironruby.net/ ): An implementation of Ruby for Microsoft’s .NET platform.
The head developer was John Lam, who worked for Microsoft.
As of 2012, the project appeared to no longer be regularly updated.


* Rubinius (http://rubini.us/):  A major attempt at implementing Rubyin Ruby.
It can run a lot of Ruby 1.8 code and is used in many production situations where high levels of concurrency or JIT are required.
It is under active development as of mid-2016.


## 5.2 Ruby on Rails

### 5.2.1 Why Rails Came into Existence

### 5.2.2 How the Web (2.0) Was Won

## 5.3 The Open Source Culture

### 5.3.1 What Is Open Source

## 5.4 Where and How to Get Help

### 5.4.1 Mailing Lists

### 5.4.2 Internet Relay Chat (IRC)

To use IRC, historically it has been necessary to download and install an IRC “client” onto your computer, which allows you to get onto the real-time IRC channels.
Although the installation of this software is beyond the scope of this book, I recommend the following clients for Windows, Linux, and OS X:
* Windows : mIRC (http://www.mirc.com/ ).
* Mac OS X : LimeChat ( http://limechat.net/mac/ ).
LimeChat was written using Ruby and it’s a great demonstration of a Ruby-powered GUI app.
* Linux/UNIX : XChat (http://www.xchat.org/ ) or Irssi (http://irssi.org/ ).

One benefit of the Freenode IRC server that the#ruby-lang and#rubyonrails channels are located on is that you can access the chatroom via a web browser if you prefer.
You can do this at https://webchat.freenode.net/.

Be sure to respect that other users in the channel are not solely there to answer your questions; otherwise you might be deemed a “help vampire” and be ignored!
However, with care, you can easily talk to some of the biggest names in the Ruby world on these channels.

* Note To learn more about IRC, seehttp://en.wikipedia.org/wiki/Internet_Relay_Chat .


### 5.4.3 Documentation

There’s a significant amount of documentation available on the Web (as well as within Ruby itself) for Ruby developers.
The site at http://www.ruby-doc.org/ provides a web-based rendering of the documentation that comes with Ruby 1.8 through to 2.3, and allows you to look up references for all of the internal classes and the standard library.

The API documentation for the current stable release of Ruby is available at http://www.ruby-doc.org/core/.
Produced automatically from the Ruby source code with Ruby’s built-in documentation tool, rdoc , the structure of the documentation isn’t immediately obvious.
Usually you can choose between viewing documentation for certain files that make up Ruby, documentation for each different base class, or documentation for certain methods.
You don’t get a logical order to follow, and there are no deep tutorials.
This sort of documentation is for reference purposes only.

Most Ruby libraries and applications use a similar scheme for their documentation, and the links to this are made available on their official sites.
For example, Ruby on Rails’ API documentation is available at http://api.rubyonrails.org/.


### 5.4.4 Forums

* Ruby-Forum.com (http://www.ruby-forum.com/ ): Ruby-Forum.com provides a forum style view onto some of the popular Ruby mailing lists.
This means it isn’t a true forum in the strictest sense, but people used to forums will appreciate the structure.

* SitePoint Ruby Forums (http://community.sitepoint.com/c/ruby ): SitePoint is a popular web development site that provides forums on many development-related topics.
Their Ruby forum is well populated and friendly.

* Rails Forum (http://railsforum.com/ ): Rails Forum is a popular forum focused on Ruby on Rails that began in 2006.
It’s particularly friendly to beginners.


## 5.5 Joining the Community

### 5.5.1 Give Help to Others

### 5.5.2 Contribute Code

### 5.5.3 News Sites and Sources

* RubyFlow (http://www.rubyflow.com/ ): This is a Ruby community link blog where all of the items are supplied by other Ruby developers.
You’ll find a lot of interesting Ruby-related announcements and links to tutorials scattered across the Web.
Of course, if you write anything helpful of your own, you can post it to RubyFlow and get the attention of the Ruby community.

* Ruby Weekly (http://rubyweekly.com/ ): A weekly e-mail newsletter dedicated to sharing the latest from the entire Ruby world.

* Ruby5 (https://ruby5.codeschool.com/ ): A podcast originally started by Gregg Pollack but now hosted by a rotating cast.
Ruby5 covers the gamut of Ruby-related news in five minutes or so on a weekly basis.

* Ruby on Reddit (http://reddit.com/r/ruby ): The Ruby section of the popular social bookmarking and discussion site aggregates most of the best Ruby blogs into a single page.


## 5.6 Summary

In this chapter, we’ve taken a break from coding to focus on the culture, community, and ecosystem surrounding the Ruby language.
Understanding the larger world around the Ruby language is extremely useful, as it’s from this community that most developers will get assistance, advice, code, and even paying work.
Being able to get help and give help in return benefits the community, helps the cause of Ruby to progress, and ultimately helps with your own programming skills.
The Ruby community is important and friendly to new Ruby developers, making it ideal to get involved as soon as possible when you begin to learn Ruby.
Make sure you use the resources the community provides to the fullest as you learn Ruby and begin to develop applications.
A single book cannot turn anyone into a Ruby expert, but a collection of valuable resources and participation in the community can.
Refer to Appendix B for a larger collection of URLs and links to other Ruby resources that are available online.


```python

```
