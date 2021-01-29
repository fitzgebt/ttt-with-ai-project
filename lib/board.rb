require 'pry'

class Board
    attr_accessor :cells

    @cells = []

    def cells
        @cells
    end

    def reset!
        @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    def initialize
        reset!
    end

    def display
        puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} \n-----------\n #{@cells[3]} | #{@cells[4]} | #{@cells[5]} \n-----------\n #{@cells[6]} | #{@cells[7]} | #{@cells[8]} \n"
    end

    def position(input)
        @cells[input.to_i - 1]
    end

    def full?
        @cells.each do |value|
            i = 0
            while i <= 8
                if @cells[i] == "X" || @cells[i] == "O"
                    i += 1                   
                elsif @cells[i] == " "
                    return false
                end
            end
        end
    end

    def turn_count
        @cells.count("X") + @cells.count("O")
    end

    def taken?(index)
        i = index.to_i - 1 
        if @cells[i]  == " " || @cells[i] == ""
            false
            elsif @cells[i] == "X" || @cells[i] == "x" || @cells[i] == "O" || @cells[i] == "o"
            true
            elsif @cells[i] == nil
            false
        end
    end

    def valid_move?(index)
        taken?(index.to_i) == false && index.to_i.between?(1,9) ? true : false     
    end

    def update(index, player)
        valid_move?(index) ? @cells[index.to_i - 1] = player.token : nil
    end
    
end