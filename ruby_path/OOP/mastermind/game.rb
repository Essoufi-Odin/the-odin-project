require_relative 'lib/player'
require_relative 'lib/computer'

class Game
    attr_accessor :row, :player, :computer
    attr_reader :codemaker_colors, :colors_to_choose_from

    @@colors_to_choose_from = ["green", "yellow", "blue", "orange", "red", "white"]
    @@win = ["red peg", "red peg", "red peg", "red peg"]

    def initialize
        @player = Player.new
        @computer = Computer.new
        
    end

    def start
        while true
            print "press 1 to start a new game 0 to exist "
            choice = gets.chomp
            case choice
            when '1'
                print "press 1 to be codebreaker or 2 to be codemaker "
                role = gets.chomp
                case role
                when '1'
                    self.play_as_codebreaker()
                when '2'
                    self.play_as_codemaker()
                else
                    print "you gave me #{choice} i dont know what to do with that"
                end
            when '0'
                break
            else
                print "you gave me #{choice} i dont know what to do with that"
            end
        end
    end


    def play_as_codebreaker
       
        select_color_4_times()
        12.times do
            # p self.computer.selected_colors uncomment if you want to cheat the computer
            puts "colors to choose from are #{@@colors_to_choose_from} "
            player_colors_array = get_player_colors()
            feedback = give_feedback(player_colors_array) 
            p feedback 
            if feedback == @@win
                puts "you guessed correctly! "
                break
            end 
              
        end
        puts "you reached maximum amount of guessed. you lose! "
    end

    def play_as_codemaker
        all_possible_codes = generate_codes()
        player_choice = get_player_colors()
        computer_colors_array = convert_code_to_color(1122)
        feedback = give_feedback_computer(computer_colors_array, player_choice) 
        all_possible_codes.select! { |code| feedback_match?(convert_code_to_color(code), feedback) }
        if feedback == @@win
            puts "you guessed correctly! "
            return
        end 
        all_possible_codes.select! { |code| feedback_match?(code, feedback) }
        11.times do
            best_guess = find_best_guess(all_possible_codes)
            puts "Computer's guess: #{convert_code_to_color(best_guess)}"
            
            feedback = give_feedback(best_guess)
            all_possible_codes.select! { |code| feedback_match?(convert_code_to_color(code), feedback) }
        
            if feedback == @@win
              puts "Computer guessed correctly!"
              return
            end
        end
        
          puts "Computer reached the maximum number of guesses. It loses!"
    end

    private
    def select_color_4_times
        4.times do
           self.computer.selected_colors << @@colors_to_choose_from.sample
        end
    end

    def give_feedback(player_colors_array)
        feedback = []
        player_colors_array.each_with_index do |color, index|
            if self.computer.selected_colors[index] == player_colors_array[index] 
              feedback << "red peg"
            elsif self.computer.selected_colors.include?(color)
              feedback << "white peg"
            end
        end
        feedback
    end

    def give_feedback_to_computer(computer_colors_array, player_choice)
        feedback = []
        computer_colors_array.each_with_index do |color, index|
            if player_choice[index] == computer_colors_array[index] 
              feedback << "red peg"
            elsif player_choice.include?(color)
              feedback << "white peg"
            end
        end
        feedback
    end

    def get_player_colors
        puts "| 1 | 2 | 3 | 4 |"
        puts "enter color accoridng to position sperated by spaces "
        player_color_choices = self.player.select_color
        player_color_array = player_color_choices.split(" ")
        if player_color_array.length != 4
            puts "Please enter exactly 4 colors."
            get_player_colors()
        end
        player_color_array.each do |color|
            if !@@colors_to_choose_from.include?(color)
                puts "Invalid color '#{color}'. Please choose from #{@@colors_to_choose_from}."
                return get_player_colors()
            end
        end
        player_color_array
    end

    def generate_codes
        #create set of the 1296 possible codes
        colors = (1..6).to_a
        all_combinations = []
        colors.each do |a|
            colors.each do |b|
                colors.each do |c|
                    colors.each do |d|
                        combination = "#{a}#{b}#{c}#{d}"
                        all_combinations << combination
                    end
                end
            end
        end 
        all_combinations
    end

    def convert_code_to_color(code)
        
      color = code.to_s.split("").map { |num| @@colors_to_choose_from[num.to_i - 1] }
        
    end


    def convert_colors_to_code(colors)
        code = ''
        colors.each {|color|code += @@colors_to_choose_from.find_index(color).to_s}
        code
    end

    def feedback_match?(code, expected_feedback)
        current_feedback = give_feedback(convert_code_to_color(code))
        current_colored_pegs = current_feedback.count("red peg")
        current_white_pegs = current_feedback.count("white peg")
        
        expected_colored_pegs = expected_feedback.count("red peg")
        expected_white_pegs = expected_feedback.count("white peg")

        current_colored_pegs == expected_colored_pegs && current_white_pegs == expected_white_pegs
    end


end

game = Game.new
game.start