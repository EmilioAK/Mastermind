class Match
  attr_reader :current_board, :winner, :colors

  def initialize(code = [])
    @colors = %w[green red yellow blue black white]
    @current_board = []
    @winner = nil

    @code = code.empty? ? @colors.sample(4) : code
    @player_is_coder = code.any?
  end

  def play_round(player_input = nil)
    if @player_is_coder
      computer_play
    else
      round(player_input, 'Player')
    end
  end

  private

  def round(player_input, player)
    @current_board << [player_input, make_pegs(player_input)]
    if player_input == @code
      @winner = player
    elsif @current_board.count >= 9
      # There is probably a way to make player and computer a testable dichotomy
      @player_is_coder ? @winner = 'Player' : @winner = 'Computer'
    end
  end

  def computer_play
    round(@colors.sample(4), 'Computer')
  end

  def make_pegs(player_input)
    player_input.map.with_index do |color, index|
      if @code[index] == color
        'red'
      elsif @code.include?(color)
        'white'
      else
        ''
      end
    end.shuffle
  end
end
