# Forgery

[![Build Status](https://travis-ci.org/sevenwire/forgery.svg)](https://travis-ci.org/sevenwire/forgery)
[![Code Climate](https://codeclimate.com/github/sevenwire/forgery.svg)](https://codeclimate.com/github/sevenwire/forgery)

**A Problem**:
It's harder than _absolutely easy_ to make meaningful, simple, data for testing and development.

**A Solution**:
A fake data generator that provides not only a host of basics and a rememberable syntax, but a customizable library to boot.

Welcome to Forgery, an excellent solution to a problem so hard you didn't know it was there.

## Using

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

## Installing

Like any gem, you can install Forgery two ways depending on it's use.

For normal Ruby development, you need simply use:

```bash
gem install forgery
```

This will add it to your gem library, just like any normal gem.
You can then use it like any normal gem library.
See examples for more.

### Rails 3.x

If you're using Rails 3.x you need to do a few extra things (that are probably rote).
First step is to add it to your `Rails.root/Gemfile`, we also suggest specifying the latest version (found on rubygems):

```ruby
gem 'forgery', '0.6.0'
```

Then you'll need to run `bundle install` to install and lock in your new gem.
Next you'll want to run the special Rails 3 generator:

```bash
bundle exec rails generate forgery
```

### Rails 2.x

For **Rails 2.x** you'll need to do something a little different, by first editing your `Rails.root/config/environment.rb` and adding this to the configuration block:

```ruby
config.gem 'forgery'
```

Then you'll need to run this in your command line:

```bash
script/generate forgery
```

### Generators

This Rails generators will make these directories in your Rails.root directory:

- Rails.root/lib/forgery
- Rails.root/lib/forgery/dictionaries
- Rails.root/lib/forgery/extensions
- Rails.root/lib/forgery/forgeries
- Rails.root/lib/forgery/formats

You can then use these directories to write your own dictionaries, class extensions, forgeries, and formats.

## Full List of Methods

| Address                              | Example Output    |
| :----------------------------------- | :---------------- |
| `Forgery('address').city`            | Loomis            |
| `Forgery('address').continent`       | South America     |
| `Forgery('address').country`         | Cameroon          |
| `Forgery('address').phone`           | +1 (693) 901-4549 |
| `Forgery('address').province`        | Alberta           |
| `Forgery('address').province_abbrev` | NT                |
| `Forgery('address').state`           | Alabama           |
| `Forgery('address').state_abbrev`    | SC                |
| `Forgery('address').street_address`  | 21 Hayes Park     |
| `Forgery('address').street_name`     | Oneill            |
| `Forgery('address').street_number`   | 222               |
| `Forgery('address').street_suffix`   | Drive             |
| `Forgery('address').zip`             | 11281-5568        |

| Basic                              | Example Output                           |
| :--------------------------------- | :--------------------------------------- |
| `Forgery('basic').boolean`         | `true` (`TrueClass`)                     |
| `Forgery('basic').color`           | Red                                      |
| `Forgery('basic').encrypt`         | fc0d835dd4e4df144a33a6a346298b0f23dcd14a |
| `Forgery('basic').frequency`       | Never                                    |
| `Forgery('basic').hex_color`       | #e1d82a                                  |
| `Forgery('basic').number`          | 4                                        |
| `Forgery('basic').password`        | KcLBHCv6                                 |
| `Forgery('basic').short_hex_color` | #c1d                                     |
| `Forgery('basic').text`            | G8gECFfvDs2                              |

| Credit Card                                  | Example Output     |
| :------------------------------------------- | :----------------- |
| `Forgery('credit_card').check_digit(number)` | 5                  |
| `Forgery('credit_card').number`              | 343682330855371    |
| `Forgery('credit_card').type`                | American Express   |
| `Forgery('currency').code`                   | XPF                |
| `Forgery('currency').description`            | Austria Schillings |

| Date                             | Example Output            |
| :------------------------------- | :------------------------ |
| `Forgery('date').date`           | Fri, 20 Mar 2009 (`Date`) |
| `Forgery('date').day`            | 15                        |
| `Forgery('date').day_of_week`    | Monday                    |
| `Forgery('date').delta(options)` | 3                         |
| `Forgery('date').month`          | January                   |
| `Forgery('date').year`           | 1994                      |

| Email                      | Example Output                               |
| :------------------------- | :------------------------------------------- |
| `Forgery('email').address` | gsmith@kamba.org                             |
| `Forgery('email').body`    | Lorem ipsum dolor sit amet, consectetuer ... |
| `Forgery('email').subject` | Lorem Ipsum Dolor Sit Amet...                |

| Geo                                  | Example Output               |
| :----------------------------------- | :--------------------------- |
| `Forgery('geo').latitude`            | -8.095096815540515 (`Float`) |
| `Forgery('geo').latitude_degrees`    | -49                          |
| `Forgery('geo').latitude_direction`  | N                            |
| `Forgery('geo').latitude_minutes`    | 14                           |
| `Forgery('geo').latitude_seconds`    | 45                           |
| `Forgery('geo').longitude`           | -22.56746406884514 (`Float`) |
| `Forgery('geo').longitude_degrees`   | 100                          |
| `Forgery('geo').longitude_direction` | W                            |
| `Forgery('geo').longitude_minutes`   | 47                           |
| `Forgery('geo').longitude_seconds`   | 41                           |

| Internet                               | Example Output                          |
| :------------------------------------- | :-------------------------------------- |
| `Forgery('internet').cctld`            | cf                                      |
| `Forgery('internet').domain_name`      | bubbletube.net                          |
| `Forgery('internet').email_address`    | cwalker@quire.name                      |
| `Forgery('internet').email_subject`    | Lorem Ipsum Dolor Sit Amet...           |
| `Forgery('internet').ip_v4`            | 94.120.51.103                           |
| `Forgery('internet').ip_v6`            | c61e:5926:15e6:d225:8eef:fb39:7412:e9d5 |
| `Forgery('internet').top_level_domain` | com                                     |
| `Forgery('internet').user_name`        | sdixon                                  |

| Lorem Ipsum                                            | Example Output                            |
| :----------------------------------------------------- | :---------------------------------------- |
| `Forgery('lorem_ipsum').character`                     | l                                         |
| `Forgery('lorem_ipsum').characters`                    | lorem ipsu                                |
| `Forgery('lorem_ipsum').lorem_ipsum_characters`        | lorem ipsum dolor sit amet...             |
| `Forgery('lorem_ipsum').lorem_ipsum_words`             | ["lorem", "ipsum", "dolor", ...](`Array`) |
| `Forgery('lorem_ipsum').paragraph`                     | Lorem ipsum dolor sit amet...             |
| `Forgery('lorem_ipsum').paragraphs`                    | Lorem ipsum dolor sit amet...             |
| `Forgery('lorem_ipsum').range_from_quantity(quantity)` | 0..4 (`Range`)                            |
| `Forgery('lorem_ipsum').sentence`                      | Lorem ipsum dolor sit amet...             |
| `Forgery('lorem_ipsum').sentences`                     | Lorem ipsum dolor sit amet...             |
| `Forgery('lorem_ipsum').text`                          | Lorem ipsum dolor sit amet...             |
| `Forgery('lorem_ipsum').title`                         | Lorem Ipsum Dolor Sit Amet...             |
| `Forgery('lorem_ipsum').word`                          | lorem                                     |
| `Forgery('lorem_ipsum').words`                         | lorem ipsum dolor sit amet...             |

| Monetary                              | Example Output  |
| :------------------------------------ | :-------------- |
| `Forgery('monetary').formatted_money` | \$5.49          |
| `Forgery('monetary').money`           | 9.20 (`String`) |

| Name                                | Example Output     |
| :---------------------------------- | :----------------- |
| `Forgery('name').company_name`      | Bubbletube         |
| `Forgery('name').female_first_name` | Judy               |
| `Forgery('name').first_name`        | Albert             |
| `Forgery('name').full_name`         | Evelyn Wallace     |
| `Forgery('name').industry`          | Toy & Hobby Stores |
| `Forgery('name').job_title`         | Analyst Programmer |
| `Forgery('name').job_title_suffix`  | III                |
| `Forgery('name').last_name`         | Jackson            |
| `Forgery('name').location`          | Try-N-Save         |
| `Forgery('name').male_first_name`   | Donald             |
| `Forgery('name').suffix`            | Sr                 |
| `Forgery('name').title`             | Mr                 |

| Personal                                 | Example Output |
| :--------------------------------------- | :------------- |
| `Forgery('personal').abbreviated_gender` | F              |
| `Forgery('personal').gender`             | Female         |
| `Forgery('personal').language`           | Bislama        |
| `Forgery('personal').race`               | Indonesian     |
| `Forgery('personal').shirt_size`         | 2XL            |

| Bank Account                   | Example Output   |
| :----------------------------- | :--------------- |
| `Forgery('bank_account').iban` | BE68539007547034 |
| `Forgery('bank_account').bic`  | VBRSDE33345      |

| Russian Tax                             | Example Output       |
| :-------------------------------------- | :------------------- |
| `Forgery('russian_tax').account_number` | 56335652786612121479 |
| `Forgery('russian_tax').bik`            | 046533860            |
| `Forgery('russian_tax').inn`            | 7366543467           |
| `Forgery('russian_tax').legal_inn`      | 7822838630           |
| `Forgery('russian_tax').legal_ogrn`     | 3483465598635        |
| `Forgery('russian_tax').ogrn`           | 666325227817763      |
| `Forgery('russian_tax').person_inn`     | 451559765443         |
| `Forgery('russian_tax').person_ogrn`    | 195478617554621      |

| Time                   | Example Output       |
| :--------------------- | :------------------- |
| `Forgery('time').zone` | Amsterdam (`String`) |

## Contributing

This is a work in progress and an open source project, so feel free to contribute.

We'll take pull requests via git or suggestions via the issues tab.
Any work done on Forgery will get you into the credits list and in our hearts.
