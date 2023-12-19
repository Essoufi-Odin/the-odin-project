#implement a method #substrings that takes a word as the first
# argument and then an array of valid substrings (your dictionary) as the second argument. 
#It should return a hash listing each substring (case insensitive) 
#that was found in the original string and how many times it was found

def substrings(words, dictionary)
    # stored elements in dictionary in a new hash with a value of 0 as an intialization 
    #without special characters and transformed string into array of words
    result = dictionary.product([0]).to_h
    no_special_character = words.gsub(/[^0-9A-Za-z]/, ' ')
    downcased_array = words.downcase.split(" ")
    #testing dictionary string on each word
    downcased_array.each do |word|
       dictionary.each do |instance|
        if word.include?(instance)
            result[instance] += 1
        end
    end
    end
    result
end