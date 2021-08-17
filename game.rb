#this file will hold the class for the game mechanics

class Game
    def initialize(name, type)
        @game_type = type
        @player_name = name


    end

    def start_new_game()
        if @game_type == "Codebreaker"
            @secret_code = [rand(1..5), rand(1..5), rand(1..5), rand(1..5)]
        elsif @game_type == "Codemaker"
            @secret_code = gets.chomp
        end

        
    end
end