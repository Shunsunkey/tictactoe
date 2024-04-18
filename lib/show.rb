require_relative 'board'

class Show
  def initialize(board)
    @board = board
  end

  def display_board
    puts "   1   2   3"
    puts " -------------"
    ('A'..'C').each do |row|
      print "#{row} |"
      (1..3).each do |col|
        print " #{@board.cases["#{row}#{col}"]} |"
      end
      puts "\n -------------"
    end
  end
end
