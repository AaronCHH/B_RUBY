
# Chapter 13: Two Web Application Approaches: Rails and Sinatra
<!-- toc orderedList:0 depthFrom:1 depthTo:6 -->

* [Chapter 13: Two Web Application Approaches: Rails and Sinatra](#chapter-13-two-web-application-approaches-rails-and-sinatra)
  * [13.1 Background](#131-background)
    * [13.1.1 The Limitations and Benefits of Our Approach](#1311-the-limitations-and-benefits-of-our-approach)
    * [13.1.2 Pros and Cons of the Frameworks Covered](#1312-pros-and-cons-of-the-frameworks-covered)
  * [13.2 Rails: Ruby's Killer App](#132-rails-rubys-killer-app)
    * [13.2.1 What Is Rails and Why Use It](#1321-what-is-rails-and-why-use-it)
    * [13.2.2 Installing Rails](#1322-installing-rails)
    * [13.2.3 Building a Basic Rails Application](#1323-building-a-basic-rails-application)
    * [13.2.4 Controllers and Views](#1324-controllers-and-views)
    * [13.2.5 Models and Relationships](#1325-models-and-relationships)
    * [13.2.6 Sessions and Filters](#1326-sessions-and-filters)
    * [13.2.7 Other Features](#1327-other-features)
    * [13.2.8 Where to Go Next: References, Books, and Example Apps](#1328-where-to-go-next-references-books-and-example-apps)
  * [13.3 Sinatra: Lightweight, Simple Web Applications](#133-sinatra-lightweight-simple-web-applications)
    * [13.3.1 The Extreme Simplicity of Sinatra](#1331-the-extreme-simplicity-of-sinatra)
    * [13.3.2 General URL Routing and Parameter Matching](#1332-general-url-routing-and-parameter-matching)
    * [13.3.3 Views, Templates, and Static Files](#1333-views-templates-and-static-files)
    * [13.3.4 Request Flow Control](#1334-request-flow-control)
  * [13.4 Summary](#134-summary)

<!-- tocstop -->


## 13.1 Background

### 13.1.1 The Limitations and Benefits of Our Approach

### 13.1.2 Pros and Cons of the Frameworks Covered

## 13.2 Rails: Ruby's Killer App

### 13.2.1 What Is Rails and Why Use It

*  Note You can learn more about the MVC paradigm at http://en.wikipedia.org/wiki/Model-view controller .

### 13.2.2 Installing Rails


```ruby
gem install rails
```

* __Database Considerations__


```ruby
gem install sqlite3
```


```ruby
apt-get install sqlite3 libsqlite3-dev
```


```ruby
yum install sqlite sqlite-devel
```

### 13.2.3 Building a Basic Rails Application

* __Creating a Blank Rails Application__

* __ Rails Command-Line Tool__


```ruby
rails new mydiary
```


```ruby
run bundle install
```

* __Files and Directories Within a Rails Application__

* __Database Configuration__

* __Using Scaffolding__


```ruby
rails generate scaffold Entry title:string content:text
```

* __Database Migrations__


```ruby
class CreateEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :entries do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
```

* __Running the Basic, Scaffolded App__


```ruby

```

### 13.2.4 Controllers and Views

* __Controller Actions__


```ruby

class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :edit, :update, :destroy]

  # GET /entries
  # GET /entries.json
  def index
    @entries = Entry.all
  end

  # GET /entries/1
  # GET /entries/1.json
  def show
  end

  # GET /entries/new
  def new
    @entry = Entry.new
  end

  # GET /entries/1/edit
  def edit
  end

  # POST /entries
  # POST /entries.json
  def create
    @entry = Entry.new(entry_params)

    respond_to do |format|
      if @entry.save
        format.html { redirect_to @entry, notice: 'Entry was successfully created.' }
        format.json { render :show, status: :created, location: @entry }
      else
        format.html { render :new }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entries/1
  # PATCH/PUT /entries/1.json
  def update
    respond_to do |format|
      if @entry.update(entry_params)
        format.html { redirect_to @entry, notice: 'Entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @entry }
      else
        format.html { render :edit }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entries/1
  # DELETE /entries/1.json
  def destroy
    @entry.destroy
    respond_to do |format|
      format.html { redirect_to entries_url, notice: 'Entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entry
      @entry = Entry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entry_params
      params.require(:entry).permit(:title, :content)
    end
end

```


```ruby
# GET /entries
# GET /entries.json
def index
  @entries = Entry.all
end
```

* __Views and Embedded Ruby (ERB)__


```ruby

# <p id="notice"><%= notice %></p>
#
# <h1>Entries</h1>
#
# <table>
#   <thead>
#     <tr>
#       <th>Title</th>
#       <th>Content</th>
#       <th colspan="3"></th>
#     </tr>
#   </thead>
#
#   <tbody>
#     <% @entries.each do |entry| %>
#       <tr>
#         <td><%= entry.title %></td>
#         <td><%= entry.content %></td>
#         <td><%= link_to 'Show', entry %></td>
#         <td><%= link_to 'Edit', edit_entry_path(entry) %></td>
#         <td><%= link_to 'Destroy', entry, method: :delete, data: { confirm: 'Are you sure?' } %></td>
#       </tr>
#     <% end %>
#   </tbody>
# </table>
#
# <br>
#
# <%= link_to 'New Entry', new_entry_path %>
```


```ruby
# <% @entries.each do |entry| %>
#   <tr>
#     <td><%= entry.title %></td>
#     <td><%= entry.content %></td>
#     <td><%= link_to 'Show', entry %></td>
#     <td><%= link_to 'Edit', edit_entry_path(entry) %></td>
#     <td><%= link_to 'Destroy', entry, method: :delete, data: { confirm: 'Are you sure?' } %></td>
#   </tr>
# <% end %>
```


```ruby
# <td><%= link_to 'Show', entry %></td>
# <td><%= link_to 'Edit', edit_entry_path(entry) %></td>
# <td><%= link_to 'Destroy', entry, method: :delete, data: { confirm: 'Are you sure?' } %></td>
```

### 13.2.5 Models and Relationships


```ruby
entry = Entry.find(1)
entry.title = 'Title of the first entry'
entry.save
```


```ruby
entry = Entry.find(1)
entry.user.name = 'Name of whoever posted the entry'
entry.user.email = 'Their e-mail address'
```


```ruby
class Entry < ActiveRecord::Base
  belongs_to :user
end
```


```ruby
class User < ActiveRecord::Base
  has_many :entries
end
```


```ruby
<p>Posted by <%= entry.user.name %> at <%= entry.created_at %></p>
```

The variety of relationships possible are documented in the official Ruby on Rails documentation at http://api.rubyonrails.org/classes/ActiveRecord/Associations/ClassMethods.html .

### 13.2.6 Sessions and Filters


```ruby
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
```


```ruby
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :count_requests_in_session

  def count_requests_in_session
    session[:requests] ||= 0
    session[:requests] += 1
  end
end
```

* Tip Learn more about filters at http://api.rubyonrails.org/classes/ActionController/Filters/ClassMethods.html.


```ruby
<%= session[:requests] %>
```

### 13.2.7 Other Features

* __Layouts__


```ruby
# <!doctype html>
# <html lang="en">
# <head>
#   <meta charset="utf-8">
#   <title>Page Title Here</title>
#   <link rel="stylesheet" href="styles.css">
# </head>
# <body>
```


```ruby
# <!DOCTYPE html>
# <html>
#   <head>
#     <title>Mydiary</title>
#     <%= csrf_meta_tags %>
#     <%= action_cable_meta_tag %>
#
#     <%= stylesheet_link_tag    'application', media: 'all', 'data-turbolinks-track' => 'reload' %>
#     <%= javascript_include_tag 'application', 'data-turbolinks-track' => 'reload' %>
#   </head>
#
#   <body>
#     <%= yield %>
#   </body>
# </html>
```

* Note You can learn more about layouts at http://api.rubyonrails.org/classes/ActionController/Layout/ClassMethods.html .

### 13.2.8 Where to Go Next: References, Books, and Example Apps

* __Reference Sites and Tutorials__

Following are some useful reference sites and tutorials to help you get started using Rails:
* Official Ruby on Rails API(http://api.rubyonrails.org/):
The official documentation for the Ruby on Rails framework.
Almost every class and method provided by Rails is documented.
* Ruby on Rails guides(http://guides.rubyonrails.org/):
A useful set of guides for Ruby on Rails written by prominent community members.
They're very well written and kept up to date with the latest version of Rails.
* Getting Started with Rails(http://guides.rubyonrails.org/getting_started.html):
A beautifully written introduction to Rails that covers much of the same ground as this chapter.
The benefit of this guide, however, is that it will be kept up to date with the latest version of Rails, which may be useful to you in case there are major changes.


* __Rails Books__

There are several books that will walk you through Rails from start to finish, from setting up and looking at scaffolded apps (as in this chapter) to building complete apps with multiple models and customized views that are deployed on the Web.
I recommend investigating the following:

* __Agile Web Development with Rails 4__, by Sam Ruby, Dave Thomas, and David Heinemeier Hansson (Pragmatic Bookshelf, 2013): Many Rails developers consider Agile Web Development with Rails to be the canonical Rails tutorial book, particularly as Rails’ creator David Heinemeier Hansson has always been involved in its development.
Its latest edition came out in September 2013, and it covers Rails 4.0 specifically, although much of it will continue to be relevant now.

* __The Rails Tutorial__, by Michael Hartl: In the past few years this has essentially become the Rails tutorial.
It's a paid for e-book and set of screencasts, but you can also read the material on the Web for free.
It's superb and walks you through the entire process of building a complete Rails app.
I strongly recommend you move onto it after reading this book.
It's available at http://railstutorial.org/.


## 13.3 Sinatra: Lightweight, Simple Web Applications

To install Sinatra, you can just rungem install sinatra or visit the project’s homepage at http://sinatrarb.com/.

### 13.3.1 The Extreme Simplicity of Sinatra


```ruby
require 'sinatra'

get '/' do
  "Hello, world!"
end
```

### 13.3.2 General URL Routing and Parameter Matching


```ruby
require 'sinatra'
get '/' do
  "Hello, world!"
end

get '/bye' do
  "Leaving already?"
end

get '/time' do
  Time.now.to_s
end
```


```ruby
get '/add/:a/:b' do
  (params[:a].to_i + params[:b].to_i).to_s
end
```


```ruby
get '/add/:a/:b' do |a, b|
  (a.to_i + b.to_i).to_s
end
```

*  Tip Sinatra also has support for wildcard and regular expression parameters. These are beyond the scope of this introduction, but basic examples can be found in Sinatra’s README document at http://www.sinatrarb.com/intro.html.


```ruby
get '/' do
  %q{<form method="post">
      Enter your name: <input type="text" name="name" />
      <input type="submit" value="Go!" />
    </form>}
end

post '/' do
  "Hello #{params[:name]}!"
end

```

### 13.3.3 Views, Templates, and Static Files

* __Inline and In-File Templates__


```ruby
before do
  @people = [
             { :name => "Beatrice", :age => 20 },
             { :name => "Eugenie", :age => 18 },
             { :name => "Louise", :age => 6 }
            ]
end

get '/' do
  erb %{
    <% @people.each do |person| %>
      <p><%= person[:name] %> is <%= person[:age] %> years old</p>
    <% end %>
  }
end
```


```ruby
get '/' do
  erb :index
end

__END__

@@ index
  <% @people.each do |person| %>
    <p><%= person[:name] %> is <%= person[:age] %> years old</p>
  <% end %>
```

* __Layouts__


```ruby
before do
  @people = [
             { :name => "Beatrice", :age => 20 },
             { :name => "Eugenie", :age => 18 },
             { :name => "Louise", :age => 6 }
            ]
end

get '/' do
  erb :index
end

__END__
@@ layout
  <html>
    <head><title>My App</title></head>
  <body>
    <h1>My App</h1>
    <%= yield %>
  </body>
  </html>

@@ index
  <% @people.each do |person| %>
    <p><%= person[:name] %> is <%= person[:age] %> years old</p>
  <% end %>
```


```ruby
erb :index, :layout => :anotherlayout
```


```ruby
erb :index, :layout => false
```

* __External Templates and Layouts__


```ruby
set :views, File.dirname( FILE ) + '/templates'
```


```ruby
erb :index, :layout => 'mylayout'
```

* __Static Files__


```ruby
set :public, File.dirname( FILE ) + '/myfiles'
```

### 13.3.4 Request Flow Control

* __Redirection__


```ruby

require 'sinatra'

get '/' do
  erb :index, :layout => :layout
end

post '/secretdata' do
  erb :secretdata
end

__END__
@@ layout
  <html><head><title>My App</title></head>
  <body><%= yield %></body></html>

@@ index
  <form method="POST" action="/secretdata">
  Password: <input type="text" name="password" />
  <input type="submit" value="Log in" />
  </form>

@@ secretdata
  Here's our secret data: <code>30'N 12'W</code>

```


```ruby
post '/secretdata' do
  redirect '/' if params[:password] != 'xyzzy'
  erb :secretdata
end

```


```ruby
redirect 'http://www.google.com/'
```

* __Halting__

* Tip Learn more about HTTP status codes and messages at http://en.wikipedia.org/wiki/List_of_HTTP_status_codes.


```ruby
post '/secretdata' do
  halt 403 if params[:password] != 'xyzzy'
  erb :secretdata
end
```

* __Error Handling__


```ruby
require 'sinatra'
not_found do
  "<html><body>Sorry, you're lost!</body></html>"
end

```


```ruby
require 'rubygems'
require 'sinatra'

set :show_exceptions, false

error do
  redirect 'http://en.wikipedia.org/wiki/Division_by_zero'
end

get '/divide/:a/:b' do |a, b|
  "#{a.to_i / b.to_i}"
end
```

## 13.4 Summary


```ruby

```
