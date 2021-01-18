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
    def create_block(color, is_peg)
        block_char = "██"
        peg_char = "▃▃"
        empty_char = "__"
        if is_peg
            color.empty? ? empty_char : peg_char.send(color)
        else
            block_char.send(color)
        end
    end
    def row_divider
        "+----+----+----+----+++----+----+----+----+ \n"
    end
    def print_row(colors, pegs)
        row_divider + \
        "| #{create_block(colors[0], false)} | #{create_block(colors[1], false)} | #{create_block(colors[2], false)} | #{create_block(colors[3], false)} |" \
        "|| #{create_block(pegs[0], true)} | #{create_block(pegs[1], true)} | #{create_block(pegs[2], true)} | #{create_block(pegs[3], true)} |"
    end
end

module InputUI
    def get_user_input
      puts "Enter your guess (separate colors with one comma and one space): "
        gets.chomp.downcase.split(", ")
    end
end