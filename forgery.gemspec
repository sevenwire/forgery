# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{forgery}
  s.version = "0.2.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Nathan Sutton"]
  s.date = %q{2009-02-07}
  s.description = %q{TODO}
  s.email = %q{nate@sevenwire.com}
  s.files = ["README.markdown", "VERSION.yml", "generators/forgery", "generators/forgery/forgery_generator.rb", "generators/forgery/USAGE", "lib/dictionaries", "lib/dictionaries/cities", "lib/dictionaries/colors", "lib/dictionaries/company_names", "lib/dictionaries/countries", "lib/dictionaries/female_first_names", "lib/dictionaries/frequencies", "lib/dictionaries/genders", "lib/dictionaries/languages", "lib/dictionaries/last_names", "lib/dictionaries/lorem_ipsum", "lib/dictionaries/male_first_names", "lib/dictionaries/name_suffixes", "lib/dictionaries/name_titles", "lib/dictionaries/province_abbrevs", "lib/dictionaries/provinces", "lib/dictionaries/races", "lib/dictionaries/shirt_sizes", "lib/dictionaries/state_abbrevs", "lib/dictionaries/states", "lib/dictionaries/street_suffixes", "lib/dictionaries/streets", "lib/dictionaries/top_level_domains", "lib/dictionaries.rb", "lib/extensions", "lib/extensions/array.rb", "lib/extensions/hash.rb", "lib/extensions/range.rb", "lib/extensions/string.rb", "lib/file_reader.rb", "lib/forgeries", "lib/forgeries/address_forgery.rb", "lib/forgeries/basic_forgery.rb", "lib/forgeries/internet_forgery.rb", "lib/forgeries/lorem_ipsum_forgery.rb", "lib/forgeries/monetary_forgery.rb", "lib/forgeries/name_forgery.rb", "lib/forgeries/personal_forgery.rb", "lib/forgery.rb", "lib/formats", "lib/formats/phone", "lib/formats/street_number", "lib/formats/zip", "lib/formats.rb", "spec/dictionaries_spec.rb", "spec/extensions", "spec/extensions/array_spec.rb", "spec/extensions/range_spec.rb", "spec/extensions/string_spec.rb", "spec/file_reader_spec.rb", "spec/forgeries", "spec/forgeries/address_forgery_spec.rb", "spec/forgeries/basic_forgery_spec.rb", "spec/forgeries/internet_forgery_spec.rb", "spec/forgeries/lorem_ipsum_forgery_spec.rb", "spec/forgeries/monetary_forgery_spec.rb", "spec/forgeries/name_forgery_spec.rb", "spec/forgeries/personal_forgery_spec.rb", "spec/forgery_spec.rb", "spec/formats_spec.rb", "spec/spec_helper.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/sevenwire/forgery}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{TODO}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
