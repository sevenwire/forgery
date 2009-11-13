Forgery
=======

The Problem:
Making meaningful development data for your application.

The Solution:
A fake data generator that does more than just lorem ipsum and random text
(well, it does those too, but also does much more).

Forgery generates fake data from dictionaries, formats, and recipes.  The
plugin includes a generator providing directories to make your own forgeries.


Install
=======

    config.gem 'forgery', :source => 'http://gemcutter.org'


Generator
=========

    ruby script/generate forgery

In a rails project this generator creates:

* Rails.root/lib/forgery
* Rails.root/lib/forgery/dictionaries
* Rails.root/lib/forgery/extensions
* Rails.root/lib/forgery/forgeries
* Rails.root/lib/forgery/formats

You can then use these directories to write your own dictionaries, class
extensions, forgeries, and formats.

Forgery will look first here for dictionaries and formats, so you can override
the ones used in the plugin.

See the forgeries in the plugin for examples of how to write your own.

See which dictionaries each forgery uses to override them with your own.


Examples
========

Here I'll supply a few examples of how it works, in general.  See each forgery
for individual examples.

    # Traditional syntax
    Forgery::Basic.password # => "wYMYvq"
    Forgery::Basic.password :allow_special => true # => ";Qo^N[T"
    Forgery::Basic.hex_color # => "#f4d841"
    
    Forgery::Monetary.money # => "8.21"
    Forgery::Monetary.formatted_money # => "$3.25"
    Forgery::Monetary.money :min => 100, :max => 1000 # => "848.97"
    
    # Alternate syntax
    Forgery(:basic).password # => "b6qZTQEH"
    Forgery(:basic).password :allow_special => true # => "XlrhV%An"
    Forgery(:basic).hex_color # => "#46b73f"
    
    Forgery(:monetary).money # => "1.58"
    Forgery(:monetary).formatted_money # => "$3.48"
    Forgery(:monetary).money :min => 100, :max => 1000 # => "923.36"

DOCUMENTATION
=============

Documentation can be found at [http://docs.github.com/sevenwire/forgery](http://docs.github.com/sevenwire/forgery)

TODO
====

* Add instanced forgeries for more relative information generation.
* Add markov chains.
* Add a way to use probability in forgeries.

Thanks
======

Thanks to the authors and contributors:

* Nate Sutton (nate aka fowlduck)
* Brandon Arbini (brandonarbini)
* Josh Nichols (technicalpickles)
* Jeremy Stephens (viking aka crookshanks)

Notes
=====

This is a work in progress.  If you find bugs or have forgeries to contribute,
we'll gladly take them and give credit.

Enjoy.

Nate Sutton (nate@sevenwire.com)