require_relative 'ui'
require_relative 'game'
include UI::Board
include UI::Input

def main
  intro
  match = Match.new
  play_round(match) until match.winner
  game_over(match)
end

main if $PROGRAM_NAME == __FILE__
