#the game of mastermind is a codebreaking game
#either the computer will be guessing the code that a player has made or the 
#computer will randomly generate a code to be guessed by the player
require_relative "game.rb" 
require_relative "display.rb"

currently_playing = true
def play()
    puts "Please enter your name."
    name = gets.chomp
    
    type = nil
    Display.choose_game_mode(name)
    while type != "Codebreaker" && type != "Codemaker"
        puts "\n\nPlease type in either 'Codebreaker' or 'Codemaker'."
        print "\nGame mode:"
        type = gets.chomp
       
    end
    
    
   
    game = Game.new(name, type)
    game.start_new_game
    
    

    
end

while currently_playing == true
    play
    
end
