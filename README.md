# Hopper

*Hopper* (noun): A storage container used to collect granular materials designed to easily dispense these materials through the use of gravity. (http://en.wikipedia.org/wiki/Hopper)

**Hopper** accumulates items and executes a block of code when its capacity is reached, or the timeout is reached, whichever event occurs first.

**Hopper** is useful for collecting a certain number of items before processing them, whilst not blocking too long if the capacity is not reached.

## Installation

Add this line to your application's Gemfile:

    gem 'hopper'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hopper

## Usage


Create a hopper:

    h = Hopper.new capacity: 28, timeout: 1 do |items, timed_out|
      puts "I have #{items.size} items"
      puts "I timed out" if timed_out
    end

Add items to the hopper:

    h << 'an item'

To run the block even when there are no items present:

    h = Hopper.new capacity: 28, timeout: 1 do |items, timed_out|
      puts "I have #{items.size} items"
      puts "I timed out" if timed_out
    end
    
To stop the hopper:

    h.stop
    
Hopper raises an exception if an item is added to the hopper while its not running.
    
    

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
