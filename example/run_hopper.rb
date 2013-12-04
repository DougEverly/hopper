#!/bin/env ruby

require 'hopper'

h = Hopper.new capacity: 10, timeout: 1, exact: true do |items, timed_out|
    puts "I have #{items.size} items"
end


22.times do |i|
  h << i
end

h.stop
# h.start


sleep 3
begin
1005.times do |i|
  h << i
end
rescue Exception => e
  puts e.message
end


# h.stop
