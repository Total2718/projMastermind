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
        @display.explain_codebreaker
        
        while game_over == false
            round_counter += 1
            @display.prompt_color_choices
            @display.show_color_choices

            
            



        end
    end

    def take_player_guess
        player_guess = Array.new(4, 0)
        guess_chosen = false
        while guess_chosen == false
          4.times do
            n = 0
            while ["1", "2", "3", "4", "5", "6", "7", "8"].any?{|choice|  choice == player_guess[n]} == false
                @display.show_color_choices
              puts "Please choose a valid option
               for slot number #{n + 1} ."
               player_guess[n] = gets.chomp
            
           end
           n += 1
          end
          guess_chosen = true
        end
        player_guess
    end



    


end