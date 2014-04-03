Forgery
=======

[![Build Status](https://travis-ci.org/sevenwire/forgery.png)](https://travis-ci.org/sevenwire/forgery)
[![Code Climate](https://codeclimate.com/github/sevenwire/forgery.png)](https://codeclimate.com/github/sevenwire/forgery)


**A Problem**:
It's harder than *absolutely easy* to make meaningful, simple, data for testing and development.

**A Solution**:
A fake data generator that provides not only a host of basics and a rememberable syntax, but a customizable library to boot.

Welcome to Forgery, an excellent solution to a problem so hard you didn't know it was there.


Using
-----

You'll want to read individual Forgery categories for more information, but these are the basics:

```ruby
Forgery(:basic).password
  #=> "b6qZTQEH"

Forgery(:internet).email_address
  #=> "krainboltgreene@crt.net"

Forgery(:monetary).money
  #=> "1.58"

Forgery(:lorem_ipsum).words(10)
  #=> "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam egestas."

Forgery(:monetary).formatted_money :min => 100, :max => 1000
  #=> "$923.36"
```

And many many more!

Alternatively you can write it like this: 

```ruby
Forgery::Basic.hex_color
Forgery::Name.full_name
Forgery::Personal.shirt_size
```

In addition, you can always write your own dictionaries and formats, overriding the ones in the gem.
Fully explained here.


Installing
----------

Like any gem, you can install Forgery two ways depending on it's use.

For normal Ruby development, you need simply use:

```bash
$ gem install forgery
```

This will add it to your gem library, just like any normal gem.
You can then use it like any normal gem library.
See examples for more.


**Rails 3.x**

If you're using Rails 3.x you need to do a few extra things (that are probably rote).
First step is to add it to your `Rails.root/Gemfile`, we also suggest specifying the latest version (found on rubygems):

```ruby
gem 'forgery', '0.6.0'
```

Then you'll need to run `bundle install` to install and lock in your new gem.
Next you'll want to run the special Rails 3 generator:

```
$ [bundle exec] rails generate forgery
```

**Rails 2.x**

For **Rails 2.x** you'll need to do something a little different, by first editing your `Rails.root/config/environment.rb` and adding this to the configuration block:

```ruby
config.gem 'forgery'
```

Then you'll need to run this in your command line:

```bash
$ script/generate forgery
```

**Generators**

This Rails generators will make these directories in your Rails.root directory:

- Rails.root/lib/forgery
- Rails.root/lib/forgery/dictionaries
- Rails.root/lib/forgery/extensions
- Rails.root/lib/forgery/forgeries
- Rails.root/lib/forgery/formats

You can then use these directories to write your own dictionaries, class extensions, forgeries, and formats.


Contributing
------------

This is a work in progress and an open source project, so feel free to contribute.
We'll take pull requests via git or suggestions via the issues tab.
Any work done on Forgery will get you into the credits list and in our hearts.


Credits
-------

Thanks to the authors and contributors:

* Nate Sutton (nate aka fowlduck)
* Brandon Arbini (brandonarbini)
* Josh Nichols (technicalpickles)
* Jeremy Stephens (viking aka crookshanks)
* Darcy Laycock (Sutto)
* Lukas Westermann (lwe)
* Mike Dungan
* Andrew Selder (aselder)
* Thomas Sinclair (anathematic)
* Stafford Brunk (wingrunr21)
* SixArm (SixArm)
* Akira Matsuda (amatsuda)
* Diego Plentz (plentz)
* Gabe Berke-Williams (gabebw)
* Todd Mazierski (toddmazierski)


Licensing
---------

Copyright (c) 2007 Sevenwire LLC

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

On that note, have fun!
