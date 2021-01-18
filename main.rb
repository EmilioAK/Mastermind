require_relative "ui.rb"
require_relative "game.rb"
include BoardUI
include InputUI

def main
    match = Match.new
    until match.winner
        match.play_round(get_user_input)
        print_board(match.current_board)
    end
    print_end_row
end

if $0 == __FILE__
    main
end