# IICallback

A callback class for activerecord.

## Dependencies

* ruby 2.3+
* activesupport 5.0+
* activerecord 5.0+

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ii_callback'
```

Then execute:

    $ bundle

## Usage

Prepare callback:

```ruby
class SaveCallback < IICallback::Base
  def after_save
    puts 'called after save'
  end
end
```

Prepare model:

```ruby
class Item < ActiveRecord::Base
  after_save SaveCallback
end
```

Use as follows:

```ruby
Item.new.save
#=> called after save
```

### Basis

A callback class is based on activerecord's one, but some points are different:

* A callback method like `after_save` takes no arguments. Instead of them, you can access activerecord instance by `@record` attribute.
* You can use only instance method as a callback method. Class method like `self.after_save` is used internally in `IICallback::Base`, so you can not define it by yourself.

A callback class has following attributes:

```ruby
class SaveCallback < IICallback::Base
  def after_save
    puts "record: #{@record}"
    puts "method: #{@method}"
  end
end

Item.new.save
#=> record: #<Item: ...>
#   method: after_save
```

#### Coactors

You can chain multiple callback classes by using `coact`. For example:

```ruby
class Save1Callback < IICallback::Base
  def after_save
    puts "called after save 1"
  end
end

class Save2Callback < IICallback::Base
  def after_save
    puts "called after save 2"
  end
end

class SaveCallback < IICallback::Base
  coact Save1Callback, Save2Callback
end

Item.new.save
#=> called after save 1
#   called after save 2
```

See [coactive](https://github.com/kanety/coactive) for more `coact` examples:

#### Callback hooks

Following hooks are available in callback class:

* before_all, around_all, after_all
* before_call, around_call, after_call

*_all wraps all coactors, and *_call wraps callback method. That is, before_all is called before running all coactors, and before_call is called before running callback method. For example:

```ruby
class SaveCallback < IICallback::Base
  before_call :set_variable

  def set_variable
    @variable = "some value"
  end

  def after_save
    puts @variable
  end
end

Item.new.save
#=> some value
```

### Logging

Callback supports instrumentation hook supplied by `ActiveSupport::Notifications`.
You can enable log subscriber as follows:

```ruby
IICallback::LogSubscriber.attach_to :ii_callback
```

This subscriber will write logs in debug mode as the following example:

```
Calling ItemCallback with #<IICallback::Context record=#<Item:...> method=before_save>
...
Called ItemCallback (Duration: 9.9ms, Allocations: 915)
```

## Contributing

Bug reports and pull requests are welcome at https://github.com/kanety/ii_callback.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
