require_relative 'lib/game.rb'

require 'bundler'
Bundler.require

def afficher_dessin_ascii
    dessin = <<-ASCII
                             _             
                            (_)            
_ __ ___   ___  _ __ _ __  _  ___  _ __  
| '_ ` _ \\ / _ \\| '__| '_ \\| |/ _ \\| '_ \\ 
| | | | | | (_) | |  | |_) | | (_) | | | |
|_| |_| |_|\\___/|_|  |_.__/|_|\\___/|_| |_|
| |                  | | 
|_|                  |_| 
ASCII
    puts dessin
end

afficher_dessin_ascii

puts "Hey ! Viens jouer au morpion codé à 01:10 :)".colorize(:blue)

loop do
    puts "Quel est le nom du premier joueur ?".colorize(:green)
    print "📝➞ "
    name1 = gets.chomp
    puts "Ok toi tu joueras avec 🏀".colorize(:green)
    puts "Et ducoup qui est le deuxième ?".colorize(:red)
    print "📝➞ "
    name2 = gets.chomp
    puts "Et toi tu joueras avec 🔮".colorize(:red)
    player1 = Player.new(name1, "🏀")
    player2 = Player.new(name2, "🔮")
    game =Game.new(player1, player2)
    game.play
    puts "Encore une partie ? :D (oui/non)"
    break if gets.chomp.downcase != "oui"
end