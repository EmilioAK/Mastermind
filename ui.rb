require 'colorize'

module UI
  module Board
    def print_board(board)
      puts `clear`
      board.each_with_index do |row, index|
        answer = row[0]
        peg = row[1]

        puts "#{print_row(answer, peg)} " + (index == board.size - 1 ? "#{board.count} / 9 turns left" : '')
      end
    end

    def print_end_row
      puts row_divider
    end

    def intro
      puts `clear`
      puts "There are 6 possible colors: #{draw_block('green')}, #{draw_block('red')}, #{draw_block('yellow')}, #{draw_block('blue')}, #{draw_block('black')}, #{draw_block('white')}"
      puts 'Each round there are 3 possible answers (in random order):'
      puts "#{draw_peg('red')} means that one of your guesses was the right color in the right place"
      puts "#{draw_peg('white')} means that one of your guesses was the right color in the wrong place"
      puts "#{draw_peg('')} means that one of your guesses was wrong"
      puts "\nYou have 9 tries to guess the code. Press any key to start the game"
      gets
      puts `clear`
    end

    def game_over(match)
      if match.winner == 'player'
        puts 'You won! Good job!'
      else
        puts 'The computer beat you! Better luck next time!'
      end
    end

    private

    def draw_block(color)
      '██'.send(color)
    end

    def draw_peg(color)
      peg_char = '▃▃'
      empty_char = '__'
      color.empty? ? empty_char : peg_char.send(color)
    end

    def row_divider
      "+----+----+----+----+++----+----+----+----+ \n"
    end

    def print_row(colors, pegs)
      row_divider + \
        "| #{draw_block(colors[0])} | #{draw_block(colors[1])} | #{draw_block(colors[2])} | #{draw_block(colors[3])} |" \
        "|| #{draw_peg(pegs[0])} | #{draw_peg(pegs[1])} | #{draw_peg(pegs[2])} | #{draw_peg(pegs[3])} |"
    end
  end

  module Input
    def get_user_input
      puts 'Colors avalible: Green, Red, Yellow, Blue, Black, White'
      print 'Enter your guess: '
      gets.chomp.downcase.split(', ')
    end
  end
end
