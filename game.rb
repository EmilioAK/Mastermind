class Match
  attr_reader :current_board, :winner, :colors, :turns

  def initialize
    @colors = %w[green red yellow blue black white]
    @current_board = []
    @winner = nil
    @turns = 9
    @code = @colors.sample(4)
  end

  def play_round(player_input)
    @current_board << { answer: player_input, pegs: make_pegs(player_input) }
    if player_input == @code
      @winner = 'Player'
    elsif @current_board.count >= @turns
      @winner = 'Computer'
    end
  end

  private

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
