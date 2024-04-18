require_relative 'boardcase.rb'


class Board
    attr_reader :cases

    def initialize
        @cases = {}
        ('A'..'C').each do |row|
          (1..3).each do |col|
            @cases["#{row}#{col}"] = BoardCase.new("#{row}#{col}")
          end
        end
      end

    def update(position, symbol)
        @cases[position].value = symbol
    end
end