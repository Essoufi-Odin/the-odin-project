#This program will encorporate the Caesar Cipher encoding 
#Caesar Cipher is an encoding technique where each letter will be replaced 
#by a letter some fixed number of position down the alphabet
# create two constants storing all letters from a to z and A to Z

# created constant arrays for checking positin of each word
DOWNCASED = 'a'.upto('z').to_a 
UPCASED = 'A'.upto('Z').to_a


def Caesar_Cipher(string, shift_factor)

#split the string into array of words to work with each word individually
string = string.split(" ")
#returns new array with each word modified
modified_string = string.map do |word|
    # split each word to array of characters to work with each individually
   word = word.split("")
    # change each char direcly on the word  
    word.map! do |char|
        if DOWNCASED.include? char
            # modulus is used to ensure we dont go over the boundary of the array, 
            char_index = DOWNCASED.find_index(char) % DOWNCASED.length
            char = DOWNCASED[char_index + shift_factor]
        elsif UPCASED.include? char
            char_index = UPCASED.find_index(char) % DOWNCASED.length
            char = UPCASED[char_index + shift_factor]  
        else
            #if char is not letter we just return it
            char
        end
    end
    #combine the array of strings into a single word before going to next word
    word = word.join("")
    
end
# join all the word into one string and remove last space
modified_string = modified_string.join(" ").chomp
modified_string
end