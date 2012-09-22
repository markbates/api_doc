# ApiDoc

A quick and easy way to generate pretty API documentation for a Rails application using your (Rspec) controller specs.

## Installation

Add this line to your application's Gemfile:

    gem 'api_doc'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install api_doc

## Usage

Prepare your Rails project by running the generator inside your project:

    rails g api_doc:install

This will copy over the appropriate assets and mount the engine routes.

Next, add the following to your <code>spec/spec_helper.rb</spec>:

    require "api_doc/rspec"

Then tag each controller spec that you want to document like so:

    describe 'index' do
      it 'returns a list of questions', :api_doc => true do
        get :index
        response.status.should be(200)
      end
    end

Finally, run <code>rake api:doc</code> command and visit /api_docs to browse the generated documentation.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
