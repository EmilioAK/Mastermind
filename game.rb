class Match
    attr_reader :winner, :current_board
    def initialize(code = [])
        @colors = ["green", "red", "yellow", "blue", "black", "white"]
        @current_board = []
        @winner = nil
        
        @code = code.empty? ? @colors.sample(4) : code
        @player_is_coder = code.any? 
        
    end
    
    def play_round(player_input = nil)
        if @player_is_coder
            computer_play
        else
            validate_input(player_input)
            round(player_input, "Player")
        end
    end

    private
    def round(player_input, player)
        if player_input == @code
            @winner = player
        else
            @current_board << [player_input, make_pegs(player_input)]
            if @current_board.count >= 9
                @winner = player
            end
        end
    end
    
    def computer_play
        round(@colors.sample(4), "Computer")
    end
    
    def make_pegs(player_input)
        player_input.map.with_index do |color, index|
            if @code[index] == color
                "red"
            elsif @code.include?(color)
                "white"
            else
                ""
            end
        end.shuffle
    end

    def validate_input(input)
        raise "Input not a list of size 4" if input.count != 4
        raise "Invalid colors entered" unless input.all? {|e| @colors.include?(e)} 
        raise "Duplicate entries not allowed" unless input.uniq.size == input.size
    end
end