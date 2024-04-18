require_relative 'player'
require_relative 'board'
require_relative 'show'

class Game
    attr_accessor :board, :players

    def initialize(player1, player2)
        @players = [player1, player2]
        @current_player = player1
        @board = Board.new
        @show = Show.new(@board)
        @turn_count = 0
    end

    def switch_player #permet le changer le joueur qui joue en passant de player1 à player2
        @current_player = @current_player == @players[0] ? @players[1] : @players[0]
    end

    def check_winner
        b = @board.cases
        #vérifie pour chaque ligne horizontale du tableau  si la condition de victoire est respectée
        return true if b["A1"].value == b["A2"].value && b["A1"].value == b["A3"].value && b["A1"].value != " "
        return true if b["B1"].value == b["B2"].value && b["B1"].value == b["B3"].value && b["B1"].value != " "
        return true if b["C1"].value == b["C2"].value && b["C1"].value == b["C3"].value && b["C1"].value != " "
        (0..2).each do |i| #vérifie pour chaque colonne verticale du tableau si la condition de victoire est respectée
            return true if b["A#{i+1}"].value == b["B#{i+1}"].value && b["B#{i+1}"].value == b["C#{i+1}"].value && b["A#{i+1}"].value != " "
        end
        #vérifie pour chaque diagonale si la condition de victoire est respectée
        return true if b["A1"].value == b["B2"].value && b["B2"].value == b["C3"].value && b["A1"].value != " "
        return true if b["A3"].value == b["B2"].value && b["B2"].value == b["C1"].value && b["A3"].value != " "
        false
    end

    def check_draw
        @turn_count == 9
    end

    def play
        loop do
            @show.display_board
            puts "#{@current_player.name}'s turn (#{@current_player.symbol})".colorize(:pink)
            position = gets.chomp.upcase
            if @board.cases[position] && @board.cases[position].value == " "
                @board.update(position, @current_player.symbol)
                @turn_count += 1
                if check_winner
                    @show.display_board
                    puts "Waaa et c'est une".colorize(:yellow) + " " + "v".colorize(:red) + "i".colorize(:orange) + "c".colorize(:yellow) + "t".colorize(:green) + "o".colorize(:blue) + "i".colorize(:indigo) + "r".colorize(:purple) + "e".colorize(:red) + " " + "de  #{@current_player.name} !!".colorize(:yellow)
                    break
                elsif check_draw
                    @show.display_board
                    puts "Aucun vainqueur ! C'est une égalité :)".colorize(:grey)
                    break
                else
                    switch_player
                end
            else
                puts "Tu le fais exprès ⁉️ Choisis une autre position celle là est déjà prise ! 💢 ".colorize(:red)
            end
        end
    end
end