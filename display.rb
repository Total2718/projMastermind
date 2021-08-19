#this file will hold the class for controlling the display
class Display 
    
    def initialize(name)
        @name = name
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
    end

    def self.choose_game_mode(name)
        print "\t\t#{name}, as a Codebreaker, you will attempt to guess the code. 
        As the Codemaker, you will make a code to be guessed. Please enter 
        either 'Codemaker' to play as the Codemaker or 'Codebreaker' to play 
        as the Codebreaker."
        
    end






       
        
                
        def explain_codebreaker()
            puts "\t\tAs the codebreaker, you will attempt to guess the code. 
            You will have a maximum of 10 attempts.The code consists of 4 colors 
            in a particular order. Not only do you need to guess the colors, but
            you also must guess the correct order as well. When prompted, you 
            will enter a single number from 1 to 8. You will be prompted four 
            times each round. One for each color of the 4 color code. The 
            numbers correspond to 8 different colors.  Not all colors will be 
            used to make the secret code and colors may be duplicated. Each time
            that your four color code guess is incorrect, you will be given a 
            statement regarding your guess. You will be told how many colors you
            guessed correctly and how much of your code was in the correct order."
            enter_to_continue
            puts "\nHere is an example:\n"
            prompt_color_choices
            
            show_color_choices
            puts "\n  \n
            Let's say the secret code is blue blue red green. That translates to 
            a number code of  1 1 2 3. If you guess 1 1 4 2, you will be told
            that you have guessed 3 colors correctly and have 2 of those 
            in the correct place."
            enter_to_continue
            
            puts "\n\t\tYou will have 10 attempts to guess the secret color code. 
            Within each attempt you will be prompted 4 times to enter a single
            digit number. The number you enter will correspond to one of the 
            colors listed in the example. Don't forget the order of your color 
            matters as well."
            
            puts "\n \t\t\t -------END OF INSTRUCTIONS-------"
            puts "\n \t\t\t ------TIME TO BREAK THE CODE-----"
            enter_to_continue

        end

        def prompt_color_choices
            puts "\n\n\t\tBelow are the potential colors that
            could make up the secret code. Each
            color has a number next to it that it 
            corresponds to. \n"
        end

        def show_color_choices
           
        
            print "\n\t"
         for n in 0..3 
            
            print "#{@colors[n]}: #{n + 1}      "
            
         end
         puts "\n"
         print "\t"
         for n in 4..7 
            
            print "#{@colors[n]}: #{n + 1}    "
            
         end

         
            

        end

        def enter_to_continue
            puts "\n \n Press enter to continue"
            continue = gets
        end
        
        def give_previous_guesses(previous_guesses)
            if previous_guesses.length > 0
                puts "\nPrevious Guesses:"
                previous_guesses.each do
                    |guess|
                    puts guess
                end
            end
        end


        def proclaim_winner(name)
            puts "Congratulations #{name}!!! You've correctly guessed the secret"\
            " code."
        end

        def proclaim_loser(name, code)
            puts "#{@name}, you have attempted to break the code 10 times and"\
            " have been unsuccessful. The secret code was #{code}"
        end
end
