require_relative 'ui'
require_relative 'game'
include UI::Board
include UI::Input

def play_round(match)
  match.play_round(get_user_input)
  print_board(match.current_board)
rescue StandardError
  puts 'Invalid input. Try again'
  play_round(match)
end

def main
  intro
  match = Match.new
  play_round(match) until match.winner
  print_end_row
  game_over(match)
end

main if $PROGRAM_NAME == __FILE__
