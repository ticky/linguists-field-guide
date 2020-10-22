# Linguist's Field Guide 📖

[![Gem Version](https://badge.fury.io/rb/linguists_field_guide.svg)](https://rubygems.org/gems/linguists_field_guide) [![Build Status](https://travis-ci.org/ticky/linguists-field-guide.svg?branch=develop)](https://travis-ci.org/ticky/linguists-field-guide)

Field guide based on the knowledge imparted by `github-linguist`.

## Background

This contains data derived from GitHub's [`linguist`](https://github.com/github/linguist) Gem, which is in turn used by GitHub to detect languages of repositories and files.

Many consumers don't need all of `linguist`'s features or dependencies, and in many cases the list is sufficient to aid in interoperating with GitHub and other systems which use or rely on `linguist`.

The _Linguist's Field Guide_, therefore, provides the language information known to `linguist`, without requiring _all_ of `linguist`'s functionality. Just the information, not necessarily the skills!

## Installation

```shell
gem install linguists_field_guide
```

## Usage

`linguists_field_guide` provides an API modeled after `linguist`'s own.

`LinguistsFieldGuide::Language` provides a subset of `Linguist::Language`;

- An Array of all Languages can be retrieved by calling `LinguistsFieldGuide::Language.all`
- Other `Linguist::Language` class methods (`find_by_alias`, `find_by_extension`, `find_by_filename`, etc.) are not currently provided.
- `Language` instances contain readers for properties included in the version of `Linguist` it was built against, with these exceptions:
  - `Language` instances do not have a `group` property.  
    If a given `Language` is a group, the `group_name` property will contain the `name` of the Language it is a child of.
  - Derived methods (`default_alias`, `escaped_name`, `hash`, etc.) are not currently provided.

### Example

```ruby
require 'linguists_field_guide'

languages_to_check = ["Rust", "Ruby", "JavaScript", "Bash"]

languages_to_check.each do |language_name|
  if LinguistsFieldGuide::Language.all.any? { |lang| lang.name === language_name }
    puts "⭕️ #{language_name} is a known language name"
  else
    puts "❌ #{language_name} isn't a known language name!"
  end
end
```

Console output:

```text
⭕️ Rust is a known language name
⭕️ Ruby is a known language name
⭕️ JavaScript is a known language name
❌ Bash isn't a known language name!
```

## Development

### Requirements

* Ruby
* Bundler

### Initial setup

To install all the Ruby and Javascript dependencies, you can run:

```bash
bundle install
```

To update the Ruby source files based on the `emoji-regex` library:

```bash
rake regenerate
```

### Specs

A spec suite is provided, which can be run as:

```bash
rake spec
```

### Creating a release

1. Update the version in [linguists_field_guide.gemspec](linguists_field_guide.gemspec)
1. `rake release`
