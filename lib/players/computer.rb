require 'pry'

module Players

    class Computer < Player
        def move(input)
            computer_move = 0
            i=0
            while i < input.cells.length || computer_move == 0
                if input.valid_move?(i+1) == true
                    computer_move = "#{i+1}"
                end
                i += 1
            end
            computer_move
        end
    end

end
