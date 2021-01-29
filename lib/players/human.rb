require 'pry'

module Players

    class Human < Player

        def move(input)
            puts "Please enter position"
            user_input = gets.strip
        end
        
    end

end