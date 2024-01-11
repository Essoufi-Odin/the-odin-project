class Board 
    attr_reader :board
    attr_accessor :first_player, second_player

    def initialize(first_player, second_player)    
        @board = {first: Array.new(3) { |i| i + 1 },
                  second: Array.new(3) { |i| i + 4 },
                  third: Array.new(3) { |i| i + 7 }}
        @first_player = first_player.name
        @second_player = second_player.name      
    end

    def to_s        
      board.each_with_index do |(key, row), index|
        puts " #{row.join(' | ')} "
        puts "-----------" unless index == 2
      end
    end
    

    private

    def wincon
      #check rows
      @board.each do |key, row|
        return true if row.all?("X") || row.all?("O")
      end
      # check columns
      @board[:first].each_with_index do |element, index|
        return true if element == @board[:second][index] && element == @board[:third][index] && (element == "X" || element == "O")
      end 
      # Check diagonals
      return true if @board[:first][0] == @board[:second][1] && @board[:first][0] == @board[:third][2] && (@board[:first][0] == "X"|| @board[:first][0] == "O")
      return true if @board[:first][2] == @board[:second][1] && @board[:first][2] == @board[:third][0] && (@board[:first][2] == "X"|| @board[:first][2] == "O")
      #if no wincon return false
      false
    end
    
end

 
  
game = Board.new
puts game