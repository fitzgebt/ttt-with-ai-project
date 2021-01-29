require 'pry'

class Game
    attr_accessor :board, :player_1, :player_2

    WIN_COMBINATIONS = [
        [6,7,8],  #Top row
        [3,4,5],  #Middle row
        [0,1,2],  #Bottom row
        [0,3,6],  #Left column
        [1,4,7],  #Middle column
        [2,5,8],  #Right column
        [2,4,6],  #Top Left to Bottom Right
        [0,4,8]  #Top Right to Bottom Left
    ]

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board= Board.new)
        @board = board
        @player_1 = player_1
        @player_2 = player_2
    end

    def current_player
        @board.turn_count.even? ? player_1 : player_2
    end

    def won?
        WIN_COMBINATIONS.each do |win|
            if @board.cells[win[0]] == "X" && @board.cells[win[1]] == "X" && @board.cells[win[2]] == "X"
                return win
            elsif @board.cells[win[0]] == "O" && @board.cells[win[1]] == "O" && @board.cells[win[2]] == "O"
                return win
            end
        end
        return false
    end

    def draw?
        @board.full? && !won?
    end

    def over?
        won? || draw?
    end

    def winner
        if won?
            @board.cells[won?[0]]
        end
    end

    def turn
        puts "Plesae choose a position"               # ask for input
        index = current_player.move(@board)
        if @board.valid_move?(index)
            @board.update(index, current_player)
        else
            puts "Please choose a position"
            @board.display
            turn
        end
        @board.display
    end

    def play
        turn until over?
        if won?
            puts "Congratulations #{winner}!"
        elsif draw?
            puts "Cat's Game!"
        end
    end
end