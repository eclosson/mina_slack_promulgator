# MinaSlackPromulgator

Simple mina deploy success/failure notifications to slack channels.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mina_slack_promulgator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mina_slack_promulgator

## Usage

Require within your mina deploy.rb:

```ruby
require 'mina/slack/promulgator'
```

Set the required mina variables:

```ruby
set :slack_promulgator_webhook_url, "your slack webhook url"
set :slack_promulgator_channel, "slack channel, e.g. #general"
set :slack_promulgator_application_emoji, "emoji, e.g. :smile:"
```

Call success on launch in deploy.rb:

```ruby
to :launch do
  { ... other launch tasks ... }
  invoke :'slack:promulgator:success'
end
```

Call failure on clean in deploy.rb:

```ruby
to :clean do
  { ... other cleanup tasks ... }
  invoke :'slack:promulgator:failure'
end
```

## Contributing

1. Fork it ( http://github.com/eclosson/mina_slack_promulgator/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
