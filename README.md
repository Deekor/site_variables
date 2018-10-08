# SiteVariables
Over the years I have become accustomed to using the Rails `secrets.yml` file as a nice config file for any non-sensitve constant variables I'd like to use throughout my application. With Rails 5.2 `secrets.yml` is now removed in favor of encrypted credentials. Overall this is a good thing as it was bad practice to store and commit any sensitive variables into `secrets.yml`. 

The [site_variables](https://rubygems.org/gems/site_variables) gem allows me to continue my practice of using a YAML file for environment specific non-sensitive variables.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'site_variables'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install site_variables

## Usage

After installation run:

    $rails generate site_variables
    
This gives us two files:

1. `config/initializers/site_variables.rb`
2. `config/site_variables.yml`

The important file is `site_variables.yml` 
Edit the YAML file with the variables you would like to use. Any environment specific variables (in the `development` or `production` sections for example) will override any variables in the `shared` section.

You now can access your hash of site variables inside your Rails app with the `SITE_VARIABLES` constant.

### Example

`config/site_variables.yml`:

```
shared:
  base_url: this will be overriden by the environments
  site_name: My Awesome Site
  support_email: support@myawesomesite.com

development:
  base_url: https://somengroksubdomain.ngrok.io

production:
  base_url: https://myawesomesite.com
```

In a view:

```
Welcome to <%= SITE_VARIABLES['site_name'] %>
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/deekor/site_variables. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the SiteVariables project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/deekor/site_variables/blob/master/CODE_OF_CONDUCT.md).
