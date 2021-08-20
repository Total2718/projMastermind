#this file will hold the class for the game mechanics

class Game
    def initialize(name, type)
        @game_type = type
        @player_name = name
        @display = Display.new(name)

    end

    def start_new_game()
        #starts the codebreaker side of the game
        if @game_type == "Codebreaker"
            @secret_code = ["#{rand(1..8)}", "#{rand(1..8)}", "#{rand(1..8)}", "#{rand(1..8)}"]
            play_codebreaker
            
            
            
            


            #starts the codemaker side of the game
        elsif @game_type == "Codemaker"
            
            play_codemaker
        end

        
    end

    def play_codebreaker
        #a flag for the while loop to keep playing
        @game_over = false
        #stores for player reference after the first round
        @previous_guesses = []
        
        @round_counter = 0
        #this gives the player the option to skip past the tutorial
        instruction_skip = nil
        while instruction_skip != "Yes" && instruction_skip != "No"
        puts "\n\tWould you like to skip the instructions? 
        Please enter 'Yes' or 'No'."
        instruction_skip = gets.chomp
        end
        if instruction_skip != "Yes"
        @display.explain_codebreaker
        end
        
        #while loop that ends after a set number of rounds is reached or the 
        #code is cracked
        while @game_over == false
            @round_counter += 1
            
            puts "\n\n\t\t--------Round #{@round_counter}---------\n\n"
            @display.give_previous_guesses(@previous_guesses)
            
            @player_guess = take_player_guess
            
            
            check_game_over(@round_counter)
            
            
            

            
            


            
        end
    end

    #method for taking the input of the guess, whether it be computer or human
    def take_player_guess
        
        player_guess = Array.new(4, nil)
        guess_chosen = false
        
        while guess_chosen == false 
            
            n = 0
          4.times do
            
            #a check to make sure the input is within 1 - 8
            while ["1", "2", "3", "4", "5", "6", "7", "8"].any?{|choice|  choice == player_guess[n]} == false
                if @game_type == "Codebreaker"
                @display.prompt_color_choices
                @display.show_color_choices
                end
                if @game_type == "Codebreaker"
                puts "\n\nPlease choose a valid option for slot number #{n + 1} of the secret code."
                print "Slot #{n + 1}:"
                end
              #this is refactored code for the codemaker aspect
              if @game_type == "Codebreaker"
               player_guess[n] = gets.chomp
              elsif @game_type == "Codemaker"
                
                    if @final_comp_guess[n] == @secret_code[n]
                        player_guess[n] = @final_comp_guess[n]
                    elsif
                        player_guess[n] = "#{rand(1..8)}"
                    end
                end
           end
           n += 1
           

          end
          
         

          guess_chosen = true
          
        end
        player_guess
    end


    def check_game_over(round)
        
        secret_code_copy = @secret_code.clone
        order_match = 0

        
        @player_guess.each_with_index do |color, index1|

            

            secret_code_copy.each_with_index do |secret_color, index2|
                if color ==  secret_color
                    secret_code_copy.delete_at(index2)
                    puts "\n"

                    break
                end
            end

            if @player_guess[index1] == @secret_code[index1]
                order_match +=1
                if @game_type == "Codemaker"
                    @final_comp_guess[index1] = @player_guess[index1]
                end
            end

             
            
        end
        colors_matched = 4 - secret_code_copy.length
        previous_guess_info = @player_guess.join(" ") + "\t\t#{colors_matched}" + 
            " correct colors and #{order_match} in the correct order."
        

        
        @previous_guesses.append(previous_guess_info)
        @display.enter_to_continue

        
        if colors_matched == 4 && order_match == 4
            @game_over = true
            @display.proclaim_winner(@name, @game_type)
           
            
        elsif round == 10
            code = @secret_code.join("")
            @game_over = true 
            @display.proclaim_loser(@name, code, @game_type)

        end
    end

    def play_codemaker
        @display.explain_codemaker
        @secret_code = request_player_code
        
        @display.enter_to_continue
        @game_over = false
        @previous_guesses = []
        @round_counter = 0
        @final_comp_guess = Array.new(4, "9")
        while @game_over == false
            @round_counter += 1

            puts "\n\n\t\t--------Round #{@round_counter}---------\n\n"
            @display.give_previous_guesses(@previous_guesses)
            
            @player_guess = take_player_guess
            
            
            check_game_over(@round_counter)


        end

    end

    def request_player_code
        secret_code = []
        code_given = false
        while code_given == false
            n = 0
            @display.prompt_color_choices
            @display.show_color_choices
          4.times do
            
            while ["1", "2", "3", "4", "5", "6", "7", "8"].any?{|choice|  choice == secret_code[n]} == false
                
              puts "\n\nPlease choose a valid option for slot number #{n + 1} of the secret code."
              print "Slot #{n + 1}:"
              secret_code[n] = gets.chomp
           end
           n += 1
          end
          code_given = true
        end
        secret_code
    end

    


end