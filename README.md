# CheckrCanada

This gem wraps the Checkr Canada API (https://checkr-canada.api-docs.io/v1/overview/getting-started) to run background checks in Canada.

An alternative gem is https://github.com/onboardiq/checkr-canada, but that would require the use of new(er) dependencies like the evil-client gem, which brings along other dependencies like the dry-types gem.

`gem-checkr-canada` has a simple dependency on Faraday.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'checkr-canada'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gem-checkr-canada

## Usage

For installation in a Rails project, create a file called
`config/initializers/gem-checkr-canada.rb`

```ruby
CheckrCanada.configure do |config|
  config.apikey = "your api key"
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/gem-checkr-canada. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

