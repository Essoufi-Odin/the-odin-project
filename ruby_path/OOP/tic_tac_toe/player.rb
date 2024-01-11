class Player
    attr_reader :name
    attr_accessor :score

    def initialize(name)
        @name = name
        @score = 0
    end
    
    def get_move
      puts "#{@name}, enter your move:"
      move = gets.chomp.to_i
      if (1..9).include?(move) 
        move
      else
        "invalid! Please enter the correct position"
        get_move
      end
    end
end


