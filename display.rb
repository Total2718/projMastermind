#this file will hold the class for controlling the display
class Display 
    def initialize(name)
        @name = name
    end

    def self.choose_game_mode(name)
        print "        #{name} , as a Codebreaker, you will attempt to guess the code.
        As the Codemaker, you will make a code to be guessed.
        Please enter either 'Codemaker' to play as the 
        Codemaker or 'Codebreaker' to play as the Codebreaker.
        "
        print "Game mode:"
    end






        @colors = [
                "blue",
                "red", 
                "green",
                "yellow",
                "orange",
                "purple",
                "black",
                "white"
                ]
                
        def explain_codebreaker()
            puts "As the codebreaker, you will 
            attempt to guess the code. You 
            will have a maximum of 8 attempts.
            The code consists of 4 colors in a
            particular order. Not only do you 
            need to guess the colors, but you also
            must guess the correct order as well.
            when prompted, you will enter a single
            number from 1 to 8. The numbers 
            correspond to 8 different colors.
            Not all colors will be used to make 
            the secret code and colors may be 
            duplicated."

        end

        def prompt_color_choices
            puts "Below are the potential colors that
            could make up the secret code. Each
            color has a number next to it that it 
            corresponds to."
        end

        def show_color_choices

         @colors.each_with_index do |color, index| puts "#{color}:#{index + 1}"
        end

        end

        def player_guess_prompt
            



        end

end
