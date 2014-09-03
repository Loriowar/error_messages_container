# ErrorMessagesContainer

This is simple container for storage and grouping error messages

## Installation

Add this line to your application's Gemfile:

    gem 'error_messages_container'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install error_messages_container

## Usage

### Initialize instance

    errors_container = ErrorMessagesContainer::ErrorMessages.new('Base application errors')

### Work with groups

Adding new group

     errors_container.add_group(:horrible_errors, 'My horrible errors')

Get group name

    errors_container.name_for_group(:horrible_errors) # => 'My horrible errors'

Get all groups type

    errors_container.all_group_types # => [:base, :horrible_errors]

### Adding errors to group

Add errors to base section

    errors_container.add('we catch simple error')

Add error to new section

    errors_container.add('occurred another error', :horrible_errors)

Add multiple messages

    errors_container.add(%w(many small messages), :horrible_errors)

### Reading errors group info

For example you can use this on you view

    %ul
      - @errors_container.all_messages.each do |group_name, messages|
        %li
          .error-type
            = @errors_container.name_for_group(group_name)
          %ul
            - messages.each do |message|
              %li
                = message

Get all messages for group

    errors_container.messages_for_group(group_name)

Get Hash with all messages, except empty groups

    errors_container.all_messages

### Helper methods

Here is 'blank?' and 'present?' for errors_container instance

### Helper methods for group

If you add group

    errors_container.add_group(:example, 'My group for example')
    errors_container.add('Test message', :example)

You automatically has follow methods

    errors_container.example_group_name # => 'My group for example'
    errors_container.example_group_messages # => ['Test message']

## Contributing

1. Fork it ( http://github.com/Loriowar/error_messages_container/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
