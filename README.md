# MinaSlackPromulgator

Simple mina deploy success/failure notifications to slack channels.

## Installation

Add this line to your application's Gemfile:

    gem 'mina_slack_promulgator'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mina_slack_promulgator

## Usage

Require within your mina deploy.rb:

    require 'mina/slack/promulgator'
    
Call success on launch in deploy.rb:

    to :launch do
      { ... other launch tasks ... }
      invoke :'slack:promulgator:success'
    end
    
Call failure on clean in deploy.rb:

    to :clean do
      { ... other cleanup tasks ... }
      invoke :'slack:promulgator:failure'
    end

## Contributing

1. Fork it ( http://github.com/eclosson/mina_slack_promulgator/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
