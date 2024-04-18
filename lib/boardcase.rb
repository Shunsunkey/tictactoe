class BoardCase
    attr_accessor :position, :value

    def initialize(position)
        @position = position
        @value = ' '
    end

    def to_s
        @value
    end
end