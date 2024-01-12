class Computer
    attr_accessor :selected_colors

    def initialize
        @selected_colors = Array.new
    end

    

    def select_color_4_times(array_colors)
        4.times do
           self.selected_colors << array_colors.sample
        end
    end

    def give_feedback(player_colors_array)
        feedback = []
        player_colors_array.each_with_index do |color, index|
            if self.selected_colors.include?(color) && self.selected_colors.find_index(color) == index
              feedback << "red peg"
            elsif self.selected_colors.include?(color)
              feedback << "white peg"
            end
        end
        feedback
    end
end

player = ["a", "c", "d", "b"]
selected = ["d", "c", "b", "a"]
computer = Computer.new
computer.select_color_4_times(selected)
p computer.selected_colors
p computer.give_feedback(player)