class ID
    attr_reader :value
    def initialize(value)
        @value = value
    end
end

unit = ->(x){ ID.new(x) }
bind = ->(fn, id){ fn.(id.value) }

increment = ->(x){ unit.(x + 1) }
decrement = ->(x){ unit.(x - 1) }

m = unit.(1)
p bind.(increment, m)
p increment.(1)

p bind.(unit, m)
p m


