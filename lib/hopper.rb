require_relative "hopper/version"
require 'thread'

class Hopper
  
  def initialize(capacity: 10, timeout: 2, always: false, exact: true, &block)
    @capacity = capacity
    @timeout  = timeout
    @always   = always
    @exact    = exact

    @running = false
    @condvar = ConditionVariable.new
    @hopper_mutex = Mutex.new
    @signal_mutex = Mutex.new
    @hopper = Array.new
    @block = block
    @thread = nil
    
    start
  end

  def start
    @running = true
    @thread = Thread.new do
      while @running
        timed_out = false

        # wait for signal or timeout
        @signal_mutex.synchronize {
          if @condvar.wait(@signal_mutex, @timeout) then
            timed_out = false
          else
            timed_out = true
          end
        }

        # yield passed block
        @hopper_mutex.synchronize {
          if @always || @hopper.size > 0
            @block.call @hopper, timed_out if @block
          end
          @hopper = Array.new
          @condvar.signal if @exact
        }

      end
    end
  end
  
  def stop
    @running = false
    @thread.join
  end
  
  def size
    @hopper_mutex.synchronize {
      return @hopper.size
    }
  end
  
  def <<(item)
    if !@running
      raise "Hopper is not running."
    end
    @hopper_mutex.synchronize {
      @hopper << item
      if @hopper.size >= @capacity then
        @condvar.signal
        @condvar.wait(@hopper_mutex) if @exact
      end
    }
  end

end