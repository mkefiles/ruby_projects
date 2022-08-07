=begin
Author: Mike Files
Date: 07/24/2022
Project: Sub Strings
Description:
Implement a method that takes a word as the first argument and then an array of valid substrings (your dictionary) as the second argument. It should return a hash listing each substring (case insensitive) that was found in the original string and how many times it was found.
=end

def substrings(phrase, keywords)
    words_found = []

    # loop through each word in the provided dictionary
    keywords.each{
        |keyword|

        # check if word is found in provided phrase
        if phrase.downcase.include? keyword
            i = 0

            # count the number of occurrences of the word in the phrase (case-insensitive)
            # .scan() is a RegEx method
            count_of_keyword = phrase.downcase.scan(/#{keyword}/).length

            # add the keyword to a new array for each time it occurs
            while i < count_of_keyword do
                words_found.push(keyword)
                i += 1
            end
        end
    }

    # create a hash from the words_found array
    # the key will be the word (i.e., unique values only)
    # the value will be the number of occurrences
    output = words_found.reduce(Hash.new(0)) do |value_count, k_word|
        value_count[k_word] += 1
        value_count
    end

    puts output
end

# create the list of desired search words
dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

substrings("Howdy partner, sit down! How's it going?", dictionary)