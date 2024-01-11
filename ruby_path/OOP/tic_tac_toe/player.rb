class Player
    attr_reader :score, :name

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

print "Player 1 : choose your name"
player_one = gets.chomp
player_one = Player.new(player_one)
print "Player 2 : choose your name"
player_two = gets.chomp
player_two = Player.new(player_two)

