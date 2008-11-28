Forgery
=======

The Problem:
Making meaningful development data for your application.

The Solution:
A fake data generator that does more than just lorem ipsum and random text
(well, it does those too, but also does much more).

Forgery generates fake data from dictionaries, formats, and recipes.  The
plugin includes a generator providing directories to make your own forgeries.


Generator
=========

<pre><code>
./script/generate forgery
</code></pre>

In a rails project this generator creates:

* RAILS_ROOT/lib/forgery
* RAILS_ROOT/lib/forgery/dictionaries
* RAILS_ROOT/lib/forgery/extensions
* RAILS_ROOT/lib/forgery/forgeries
* RAILS_ROOT/lib/forgery/formats

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

<pre><code>
BasicForgery.password # => "wYMYvq"
BasicForgery.password :allow_special => true # => ";Qo^N[T"
BasicForgery.hex_color # => "#f4d841"

MonetaryForgery.money # => "8.21"
MonetaryForgery.formatted_money # => "$3.25"
MonetaryForgery.money :min => 100, :max => 1000 # => "848.97"
</code></pre>

TODO
====

* Add instanced forgeries for more relative information generation.

Thanks
======

Thanks to the authors and contributors:

* Nathan Sutton (nate aka fowlduck)
* Brandon Arbini (brandonarbini)
* Josh Nichols (technicalpickles)
* Jeremy Stephens (viking aka crookshanks)

Notes
=====

This is a work in progress.  If you find bugs or have forgeries to contribute,
we'll gladly take them and give credit.

Enjoy.

Nate Sutton (nate@sevenwire.com)