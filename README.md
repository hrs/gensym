## Gensym [![Build Status](https://secure.travis-ci.org/hrs/gensym.png?branch=master&.png)](http://travis-ci.org/hrs/gensym) [![Code Climate](https://codeclimate.com/github/hrs/gensym/badges/gpa.svg)](https://codeclimate.com/github/hrs/gensym)

Generate new, unbound variable names in your Ruby program. An homage to Lisp's
`gensym` macro.

Handy for the kind of metaprogramming you really shouldn't be doing.

## Usage

Instantiate a `Gensym` object by passing in a [`Binding`][]. You'll probably
want the binding of the current scope returned by `Kernel#binding`. Generate a
new symbol by calling `generate`:

```ruby
Gensym.new(binding).generate # => :gensym_OMUYsTEIbvjGwqhQgifkJNaByAHzxc
```

[`Binding`]: http://ruby-doc.org/core-2.4.1/Binding.html

## Installation

Add this line to your application's Gemfile:

```ruby
gem "gensym"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gensym

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run
`rake spec` to run the tests. You can also run `bin/console` for an interactive
prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To
release a new version, update the version number in `version.rb`, and then run
`bundle exec rake release`, which will create a git tag for the version, push
git commits and tags, and push the `.gem` file to [rubygems.org][].

[rubygems.org]: https://rubygems.org
