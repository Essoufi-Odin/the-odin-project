require_relative 'board'
require_relative 'player'

print "Player 1 choose your name: "
player_one = gets.chomp
player_one = Player.new(player_one)
print "Player 2 choose your name: "
player_two = gets.chomp
player_two = Player.new(player_two)

while true
    print "Press 1 to start a new game or 0 to exist: "
    choice = gets.chomp
    case choice
        when '0'
            break
        when '1'
            puts "#{player_one.name} score: #{player_one.score}, #{player_two.name} score: #{player_two.score}"
            game = Board.new(player_one, player_two) 
            # Randomly choose who goes first
            first_player = [player_one, player_two].sample
            puts "#{first_player.name} will go first."   
            second_player = if first_player == player_one
                                player_two
                            else
                               player_one
                            end
            4.times do 
                puts game
                player_one_move = game.make_move_x(first_player.get_move, first_player)
                if player_one_move == false
                    print "invalid move! "
                    player_one_move = game.make_move_x(first_player.get_move, first_player)
                end
                puts game
                if game.wincon == true
                    puts "#{first_player.name} won"
                     first_player.score += 1
                     break
                end
                second_player_move = game.make_move_o(second_player.get_move, second_player)
                if second_player_move == false
                    print "invalid move! "
                    second_player_move = game.make_move_o(second_player.get_move, second_player)
                end
                puts game
                if game.wincon == true
                    puts "#{second_player.name} won"
                     second_player.score += 1
                     break
                end 
            end
            
                   
        else
            puts "You gave me #{choice} -- I have no idea what to do with that."
            next
    end  
end