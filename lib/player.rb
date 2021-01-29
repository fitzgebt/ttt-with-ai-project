require 'pry'


class Player
    attr_reader :token

    @@player = []

    def initialize(token)
        @token = token
        @@player << self
    end
    
end