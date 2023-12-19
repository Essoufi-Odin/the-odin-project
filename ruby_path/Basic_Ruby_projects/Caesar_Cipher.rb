#This program will encorporate the Caesar Cipher encoding 
#Caesar Cipher is an encoding technique where each letter will be replaced 
#by a letter some fixed number of position down the alphabet
# create two constants storing all letters from a to z and A to Z

DOWNCASED = 'a'.upto('z').to_a 
UPCASED = 'A'.upto('Z').to_a


def Caesar_Cipher(string, shift_factor)


string = string.split(" ")
modified_string = string.map do |word|
   word = word.split("")
    word.map! do |char|
        if DOWNCASED.include? char
            # modulus is used to ensure we dont go over the boundary of the array, 
            char_index = DOWNCASED.find_index(char) % DOWNCASED.length
            char = DOWNCASED[char_index + shift_factor]
        elsif UPCASED.include? char
            char_index = UPCASED.find_index(char) % DOWNCASED.length
            char = UPCASED[char_index + shift_factor]  
        else
            char
        end
    end
    word = word.join("")
    
end
modified_string = modified_string.join(" ").chomp
modified_string
end