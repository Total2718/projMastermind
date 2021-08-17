#this file will hold the class for controlling the display
class Display 
    def initialize(name)
        @name = name
    end

    def choose_game_mode
        print "        #{@name} , as a Codebreaker, you will attempt to guess the code.
        As the Codemaker, you will make a code to be guessed.
        Please enter either 'Codemaker' to play as the 
        Codemaker or 'Codebreaker' to play as the Codebreaker.
        "
        print "Game mode:"
    end
end
