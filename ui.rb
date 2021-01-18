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
        puts "+----+----+----+----+ \n"
    end

    private
    def create_block(color, is_peg)
        block_char = "██"
        peg_char = "▃▃"
        if is_peg
            color.empty? ? "__" : peg_char.send(color)
        else
            block_char.send(color)
        end
    end
    def print_row(colors, pegs)
        "+----+----+----+----+++----+----+----+----+ \n" \
        "| #{create_block(colors[0], false)} | #{create_block(colors[1], false)} | #{create_block(colors[2], false)} | #{create_block(colors[3], false)} |" \
        "|| #{create_block(pegs[0], true)} | #{create_block(pegs[1], true)} | #{create_block(pegs[2], true)} | #{create_block(pegs[3], true)} |"
    end
end

module InputUI
    def get_user_input
        gets.chomp.downcase.split(",")
    end
end