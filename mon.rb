module Monad
    def bind
        raise "Not implemented"
    end

    def unit
        raise "Not implemented"
    end
end

class Writer
    include Monad
end
x = Writer.new

class ID
    include Monad
    attr_reader :value
    def initialize(value)
        @value = value
    end

    def bind(fn)
        self.method(fn).call()
    end

    def increment
        ID.new(@value + 1)
    end

    def decrement
        ID.new(@value - 1)
    end
end

m = ID.new(1)
p m.bind(:increment)
p m.bind(:decrement)
p m


