#this file will hold the class for the game mechanics

class Game
    def initialize(name, type)
        @game_type = type
        @player_name = name
        @display = Display.new(name)

    end

    def start_new_game()
        if @game_type == "Codebreaker"
            @secret_code = ["#{rand(1..5)}", "#{rand(1..5)}", "#{rand(1..5)}", "#{rand(1..5)}"]
            play_game
            
            
            
            



        elsif @game_type == "Codemaker"
            @secret_code = gets.chomp
        end

        
    end

    def play_game
        game_over = false
        round_counter = 0
        instruction_skip = nil
        while instruction_skip != "Yes" && instruction_skip != "No"
        puts "\n\tWould you like to skip the instructions? 
        Please enter 'Yes' or 'No'."
        instruction_skip = gets.chomp
        end
        if instruction_skip != "Yes"
        @display.explain_codebreaker
        end
        
        while game_over == false
            round_counter += 1
            @player_guess = take_player_guess
            
            

            
            


            
        end
    end

    def take_player_guess
        player_guess = Array.new(4, 0)
        guess_chosen = false
        while guess_chosen == false
            n = 0
          4.times do
            
            while ["1", "2", "3", "4", "5", "6", "7", "8"].any?{|choice|  choice == player_guess[n]} == false
                @display.prompt_color_choices
                @display.show_color_choices
              puts "Please choose a valid option for slot number #{n + 1} of the secret code."
              print "Number:"
               player_guess[n] = gets.chomp
            
           end
           n += 1
          end
          guess_chosen = true
        end
        player_guess
    end



    


end