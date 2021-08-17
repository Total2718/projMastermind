#the game of mastermind is a codebreaking game
#either the computer will be guessing the code that a player has made or the 
#computer will randomly generate a code to be guessed by the player
require_relative "game.rb" 
require_relative "display.rb"

currently_playing = true
def play()
    puts "Please enter your name."
    name = gets.chomp
    display = Display.new(name)
    type = nil
    while type != "Codebreaker" && type != "Codemaker"
        display.choose_game_mode
        type = gets.chomp
        puts type
    end
    
   
    game = Game.new(name, type)
    
    

    
end

while currently_playing == true
    play
    
end
