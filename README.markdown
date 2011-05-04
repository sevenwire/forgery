# Forgery

The Problem:
Making meaningful development data for your application.

The Solution:
A fake data generator that does more than just lorem ipsum and random text
(well, it does those too, but also does much more).

Forgery generates fake data from dictionaries, formats, and recipes.  The
plugin includes a generator providing directories to make your own forgeries.


## Install

### Run

    gem install forgery

### Rails 2

    # Add this to your config/environment.rb
    config.gem 'forgery'

### Rails 3

    # Add this to your Gemfile
    gem 'forgery'

## Rails 2 Generator

    ruby script/generate forgery

## Rails 3 Generator

    rails generate forgery

In a rails project this generator creates:

* Rails.root/lib/forgery
* Rails.root/lib/forgery/dictionaries
* Rails.root/lib/forgery/extensions
* Rails.root/lib/forgery/forgeries
* Rails.root/lib/forgery/formats

You can then use these directories to write your own dictionaries, class
extensions, forgeries, and formats.


Forgery will first look here for dictionaries and formats, so you can override
the ones used in the plugin.

See the forgeries in the plugin for examples of how to write your own.

See which dictionaries each forgery uses to override them with your own.


The Rails 3 plugin also registers a rake task which can generate new dictionaries
from html or xml on the web.

Writes to '${RAILS_ROOT}/lib/forgery/dictionaries' by default
(this can be overriden by setting Forgery::FileWriter#write_to!)

Parameters:
:dictionary_name  -- the name of your new dictionary file
:source_url       -- web page containing the data for your dictionary file
:css_or_xpath     -- css or xpath selector(s) to element(s) containing the desired data

Usage:
    rake create_dictionary[name_of_file,'http://www.html_or_xml_page.com','li']
## Examples

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

## Customization

You can utilize the directories generated in /lib to customize the behavior of forgery.

Examples of each of these components are available in the source.

### Dictionaries

Dictionaries are files with no extensions.  Entries are separated by new lines.

### Forgeries

Forgeries are classes that inherit from the Forgery class.  A basic forgery definition is as follows

    class NewForgery < Forgery
    end

### Extensions

Extensions are additional methods/functionality that are added to classes (Ruby core or otherwise) that are loaded by Forgery.  Follow standard Ruby practices.

### Formats

Formatting for numerical fields.  Each numerical entry corresponds to a # mark.

## DOCUMENTATION

Documentation can be found at [http://sevenwire.github.com/forgery/](http://sevenwire.github.com/forgery/)

## TODO

* Add instanced forgeries for more relative information generation.
* Add markov chains.
* Add a way to use probability in forgeries.

## Thanks

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

## Notes

This is a work in progress.  If you find bugs or have forgeries to contribute,
we'll gladly take them and give credit.

Enjoy.

Nate Sutton (nate@sevenwire.com)