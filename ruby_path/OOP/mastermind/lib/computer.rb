class Computer
    attr_accessor :selected_colors, :all_possible_codes

    @@colors_to_choose_from = ["green", "yellow", "blue", "orange", "red", "white"]

    def initialize
        @selected_colors = Array.new
    end

    
    def give_feedback(code)
        code = code.to_s.split("").map { |num| colors_available[num.to_i - 1] }
        code
    end

end

