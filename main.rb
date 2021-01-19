require_relative "ui.rb"
require_relative "game.rb"
include UI::Board
include UI::Input

def play_round(match)
    begin
        match.play_round(get_user_input)
        print_board(match.current_board)
    rescue
        puts "Invalid input. Try again"
        play_round(match)
    end
end

def main
    match = Match.new
    until match.match_won
        play_round(match)
    end
    print_end_row
end

if $0 == __FILE__
    main
end