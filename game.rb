#this file will hold the class for the game mechanics

class Game
    def initialize(name, type)
        @game_type = type
        @player_name = name
        @display = Display.new(name)

    end

    def start_new_game()
        if @game_type == "Codebreaker"
            @secret_code = ["#{rand(1..8)}", "#{rand(1..8)}", "#{rand(1..8)}", "#{rand(1..8)}"]
            play_codebreaker
            
            
            
            



        elsif @game_type == "Codemaker"
            @secret_code = gets.chomp
        end

        
    end

    def play_codebreaker
        @game_over = false
        @previous_guesses = []
        @round_counter = 0
        
        instruction_skip = nil
        while instruction_skip != "Yes" && instruction_skip != "No"
        puts "\n\tWould you like to skip the instructions? 
        Please enter 'Yes' or 'No'."
        instruction_skip = gets.chomp
        end
        if instruction_skip != "Yes"
        @display.explain_codebreaker
        end
        
        while @game_over == false
            @round_counter += 1
            
            puts "\n\n\t\t--------Round #{@round_counter}---------\n\n"
            @display.give_previous_guesses(@previous_guesses)
            
            @player_guess = take_player_guess
            
            
            check_game_over(@round_counter)
            
            
            

            
            


            
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
              puts "\n\nPlease choose a valid option for slot number #{n + 1} of the secret code."
              print "Slot #{n + 1}:"
               player_guess[n] = gets.chomp
            
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

        
        @player_guess.each_with_index do |color, index|

            

            secret_code_copy.each_with_index do |secret_color, index|
                if color ==  secret_color
                    secret_code_copy.delete_at(index)
                    puts "\n"
                    break
                end
            end

            if @player_guess[index] == @secret_code[index]
                order_match +=1
            end

             
            
        end
        colors_matched = 4 - secret_code_copy.length
        previous_guess_info = @player_guess.join(" ") + "\t\t#{colors_matched}" + 
            " correct colors and #{order_match} in the correct order."
        

        
        @previous_guesses.append(previous_guess_info)
        @display.enter_to_continue

        
        if colors_matched == 4 && order_match == 4
            @game_over = true
            @display.proclaim_winner(@name)
        elsif round == 10
            code = @secret_code.join("")
            @game_over = true 
            @display.proclaim_loser(@name, code)

        end
    end

    


end