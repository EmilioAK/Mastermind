require "colorize"

module BoardUI
    def print_board(board)
        board.each do |row|
            answer = row[0]
            peg = row[1]

            puts print_row(answer, peg)
        end
    end
    def print_end_row
        puts row_divider
    end

    private
    def draw_block(color)
        "██".send(color)
    end
    def draw_peg(color)
        peg_char = "▃▃"
        empty_char = "__"
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

module InputUI
    def get_user_input
      puts "Enter your guess (separate colors with one comma and one space): "
        gets.chomp.downcase.split(", ")
    end
end