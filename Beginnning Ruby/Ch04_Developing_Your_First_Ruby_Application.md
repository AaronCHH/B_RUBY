
# Chapter 4: Developing Your First Ruby Application
<!-- toc orderedList:0 depthFrom:1 depthTo:6 -->

* [Chapter 4: Developing Your First Ruby Application](#chapter-4-developing-your-first-ruby-application)
  * [4.1 Working with Source Code Files](#41-working-with-source-code-files)
    * [4.1.1 Creating a Test File](#411-creating-a-test-file)
    * [4.1.2 A Simple Source Code File](#412-a-simple-source-code-file)
    * [4.1.3 Running Your Source Code](#413-running-your-source-code)
  * [4.2 Our Application: A Text Analyzer](#42-our-application-a-text-analyzer)
    * [4.2.1 Required Basic Features](#421-required-basic-features)
    * [4.2.2 Building the Basic Application](#422-building-the-basic-application)
    * [4.2.3 Obtaining Some Dummy Text](#423-obtaining-some-dummy-text)
    * [2.1.4 Loading Text Files and Counting Lines](#214-loading-text-files-and-counting-lines)
    * [4.2.5 Counting Characters](#425-counting-characters)
    * [4.2.6 Counting Words](#426-counting-words)
    * [4.2.7 Counting Sentences and Paragraphs](#427-counting-sentences-and-paragraphs)
    * [4.2.8 Calculating Averages](#428-calculating-averages)
    * [4.2.9 The Source Code So Far](#429-the-source-code-so-far)
  * [4.3 Adding Extra Features](#43-adding-extra-features)
    * [4.3.1 Percentage of “Useful” Words](#431-percentage-of-useful-words)
    * [4.3.2 Summarizing by Finding “Interesting” Sentences](#432-summarizing-by-finding-interesting-sentences)
    * [4.3.3 Analyzing Files Other Than text.txt](#433-analyzing-files-other-than-texttxt)
  * [4.4 The Completed Program](#44-the-completed-program)
  * [4.5 Summary](#45-summary)

<!-- tocstop -->


## 4.1 Working with Source Code Files

### 4.1.1 Creating a Test File

* __Visual Studio Code__

https://www.jetbrains.com/ruby/

* __Alternatives to Linux__

### 4.1.2 A Simple Source Code File


```ruby
x = 2
print "This program is running okay if 2 + 2 = #{x + x}"
```

    This program is running okay if 2 + 2 = 4

### 4.1.3 Running Your Source Code

* __Windows__

* __Mac OS X / macOS__

* __Linux and Other UNIX-Based Systems__

## 4.2 Our Application: A Text Analyzer

### 4.2.1 Required Basic Features

### 4.2.2 Building the Basic Application

### 4.2.3 Obtaining Some Dummy Text

http://www.rubyinside.com/book/

http://www.rubyinside.com/book/oliver.txt

### 2.1.4 Loading Text Files and Counting Lines


```ruby
File.open("text.txt").each { |line| puts line }
```


```ruby
line_count = 0
File.open("text.txt").each { |line| line_count += 1 }
puts line_count
```


```ruby
text=''
line_count = 0
File.open("text.txt").each do |line|
  line_count += 1
  text << line
end
puts "#{line_count} lines"
```


```ruby
lines = File.readlines("text.txt")
line_count = lines.size
text = lines.join
puts "#{line_count} lines"
```

### 4.2.5 Counting Characters


```ruby
total_characters = text.length
puts "#{total_characters} characters"
```


```ruby
"this is a test".gsub(/t/, 'X')
```


```ruby
total_characters_nospaces = text.gsub(/\s+/, '').length
puts "#{total_characters_nospaces} characters excluding spaces"
```

### 4.2.6 Counting Words


```ruby
puts "this is a test".scan(/\w/).join
```

    thisisatest



```ruby
puts "this is a test".scan(/\w+/).join('-')
```

    this-is-a-test



```ruby
puts "this is a test".scan(/\w+/).length
```

    4



```ruby
puts "this is a test".split.length
```

    4



```ruby
text = "First-class decisions require clear-headed thinking."
puts "Scan method: #{text.scan(/\w+/).length}"
puts "Split method: #{text.split.length}"
```

    Scan method: 7
    Split method: 5



```ruby
word_count = text.split.length
puts "#{word_count} words"
```

    5 words


### 4.2.7 Counting Sentences and Paragraphs


```ruby
sentence_count = text.split(/\.|\?|!/).length
```




    1




```ruby
puts "Test code! It works. Does it? Yes.".split(/\.|\?|!/).length
```

    4



```ruby
text = %q{
This is a test of
paragraph one.
This is a test of
paragraph two.
This is a test of
paragraph three.
}
puts text.split(/\n\n/).length
```

    1



```ruby
paragraph_count = text.split(/\n\n/).length
puts "#{paragraph_count} paragraphs"
```

    1 paragraphs



```ruby
sentence_count = text.split(/\.|\?|!/).length
puts "#{sentence_count} sentences"
```

    4 sentences


### 4.2.8 Calculating Averages


```ruby
puts "#{sentence_count / paragraph_count} sentences per paragraph (average)"
puts "#{word_count / sentence_count} words per sentence (average)"
```

    4 sentences per paragraph (average)
    1 words per sentence (average)


### 4.2.9 The Source Code So Far


```ruby
lines = File.readlines("text.txt")
line_count = lines.size
text = lines.join
word_count = text.split.length
character_count = text.length
character_count_nospaces = text.gsub(/\s+/, '').length
paragraph_count = text.split(/\n\n/).length
sentence_count = text.split(/\.|\?|!/).length
puts "#{line_count} lines"
puts "#{character_count} characters"
puts "#{character_count_nospaces} characters excluding spaces"
puts "#{word_count} words"
puts "#{paragraph_count} paragraphs"
puts "#{sentence_count} sentences"
puts "#{sentence_count / paragraph_count} sentences per paragraph (average)"
puts "#{word_count / sentence_count} words per sentence (average)"
```

## 4.3 Adding Extra Features

### 4.3.1 Percentage of “Useful” Words

* Note For more information about stop words, including links to complete lists, visit
http://en.wikipedia.org/wiki/Stop_words .


```ruby
stopwords = %w{the a by on for of are with just but and to the my I has some in}
```




    ["the", "a", "by", "on", "for", "of", "are", "with", "just", "but", "and", "to", "the", "my", "I", "has", "some", "in"]




```ruby
text = %q{Los Angeles has some of the nicest weather in the country.}
stopwords = %w{the a by on for of are with just but and to the my in I has some}
```




    ["the", "a", "by", "on", "for", "of", "are", "with", "just", "but", "and", "to", "the", "my", "in", "I", "has", "some"]




```ruby
words = text.scan(/\w+/)
keywords = words.select { |word| !stopwords.include?(word) }
```




    ["Los", "Angeles", "nicest", "weather", "country"]




```ruby
puts keywords.join(' ')
```

    Los Angeles nicest weather country



```ruby
keywords = words.select { |word| !stopwords.include?(word) }
```




    ["Los", "Angeles", "nicest", "weather", "country"]




```ruby
((keywords.length.to_f / words.length.to_f) * 100).to_i
```




    45




```ruby
stopwords = %w{the a by on for of are with just but and to the my I has some in}
lines = File.readlines(“text.txt”)
line_count = lines.size
text = lines.join
```


```ruby
# Count the words, characters, paragraphs and sentences
word_count = text.split.length
character_count = text.length
character_count_nospaces = text.gsub(/\s+/, '').length
paragraph_count = text.split(/\n\n/).length
sentence_count = text.split(/\.|\?|!/).length
# Make a list of words in the text that aren't stop words,
# count them, and work out the percentage of non-stop words
# against all words
all_words = text.scan(/\w+/)
good_words = all_words.reject{ |word| stopwords.include?(word) }
good_percentage = ((good_words.length.to_f / all_words.length.to_f) * 100).to_i
# Give the analysis back to the user
puts "#{line_count} lines"
puts "#{character_count} characters"
puts "#{character_count_nospaces} characters (excluding spaces)"
puts "#{word_count} words"
puts "#{sentence_count} sentences"
puts "#{paragraph_count} paragraphs"
puts "#{sentence_count / paragraph_count} sentences per paragraph (average)"
puts "#{word_count / sentence_count} words per sentence (average)"
puts "#{good_percentage}% of words are non-fluff words"
```

### 4.3.2 Summarizing by Finding “Interesting” Sentences


```ruby
text = %q{
Ruby is a great programming language. It is object oriented
and has many groovy features. Some people don't like it, but that's
not our problem! It's easy to learn. It's great. To learn more about Ruby,
visit the official Ruby web site today.
}
sentences = text.gsub(/\s+/, ' ').strip.split(/\.|\?|!/)
sentences_sorted = sentences.sort_by { |sentence| sentence.length }
one_third = sentences_sorted.length / 3
ideal_sentences = sentences_sorted.slice(one_third, one_third + 1)
ideal_sentences = ideal_sentences.select { |sentence| sentence =~ /is|are/ }
puts ideal_sentences.join(". ")
```


```ruby
sentences = text.gsub(/\s+/, ' ').strip.split(/\.|\?|!/)
```




    ["Los Angeles has some of the nicest weather in the country"]




```ruby
sentences_sorted = sentences.sort_by { |sentence| sentence.length }
```




    ["Los Angeles has some of the nicest weather in the country"]




```ruby
one_third = sentences_sorted.length / 3
ideal_sentences = sentences_sorted.slice(one_third, one_third + 1)
```




    ["Los Angeles has some of the nicest weather in the country"]




```ruby
ideal_sentences = ideal_sentences.select { |sentence| sentence =~ /is|are/ }
```




    []




```ruby
puts ideal_sentences.join(". ")
```




### 4.3.3 Analyzing Files Other Than text.txt


```ruby
puts ARGV.join('-')
```

    kernel-C:\Users\AaronHsu\AppData\Roaming\jupyter\runtime\kernel-e2dcf565-80c4-45fb-be91-3877ff1f9de0.json



```ruby
lines = File.readlines(ARGV[0])
```

## 4.4 The Completed Program

*  Note Remember that source code for this book is available in the Source Code area at http://www.apress.com , so it isn’t strictly necessary to type in code directly from the book.


```ruby
# analyzer.rb -- Text Analyzer
stopwords = %w{the a by on for of are with just but and to the my I has some in}
lines = File.readlines(ARGV[0])
line_count = lines.size
text = lines.join
# Count the words, characters, paragraphs and sentences
word_count = text.split.length
character_count = text.length
character_count_nospaces = text.gsub(/\s+/, '').length
paragraph_count = text.split(/\n\n/).length
sentence_count = text.split(/\.|\?|!/).length
# Make a list of words in the text that aren't stop words,
# count them, and work out the percentage of non-stop words
# against all words
all_words = text.scan(/\w+/)
good_words = all_words.reject{ |word| stopwords.include?(word) }
good_percentage = ((good_words.length.to_f / all_words.length.to_f) * 100).to_i
# Summarize the text by cherry picking some choice
sentences = text.gsub(/\s+/, ' ').strip.split(/\.|\?|!/)
sentences_sorted = sentences.sort_by { |sentence| sentence.length }
one_third = sentences_sorted.length / 3
ideal_sentences = sentences_sorted.slice(one_third, one_third + 1)
ideal_sentences = ideal_sentences.select { |sentence| sentence =~ /is|are/ }
# Give the analysis back to the user
puts "#{line_count} lines"
puts "#{character_count} characters"
puts "#{character_count_nospaces} characters (excluding spaces)"
puts "#{word_count} words"
puts "#{sentence_count} sentences"
puts "#{paragraph_count} paragraphs"
puts "#{sentence_count / paragraph_count} sentences per paragraph (average)"
puts "#{word_count / sentence_count} words per sentence (average)"
puts "#{good_percentage}% of words are non-fluff words"
puts "Summary:\n\n" + ideal_sentences.join(". ")
puts "-- End of analysis"
```


```ruby
puts “2+2 = #{2+2}” # Adds 2+2 to make 4
# A comment on a line by itself
```

## 4.5 Summary


```ruby

```
