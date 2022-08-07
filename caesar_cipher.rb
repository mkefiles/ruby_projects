=begin
Author: Mike Files
Date: 07/24/2022
Project: Caesar Cipher
Description:
    Create a CLI message encryption app.
    It should replace each letter with another letter a fixed number of positions down the alphabet.
    Also, the case of the letter should remain the same.
    For example: with a letter-shift of 3, "D" would be replace by "A".
=end

def caesar_cipher(phrase = "Mike", count = 4)
    # convert phrase to encrypted phrase
    # use count to determine the letter in the alphabet

    # create an alphabet array
    alphabet_LC = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    alphabet_UC = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    encrypted_phrase = []

    # split the input phrase to an array where each letter is an element
    phrase = phrase.split("")

    # loop over each letter in the phrase
    # match each letter to it's new location in the respective array
    # output all elements to a new array
    phrase.each{
        |letter|
        if alphabet_LC.include? letter
            encrypted_phrase.push(alphabet_LC[alphabet_LC.find_index(letter) - count])
        elsif alphabet_UC.include? letter
            encrypted_phrase.push(alphabet_UC[alphabet_UC.find_index(letter) - count])
        else
            encrypted_phrase.push(letter)
        end
    }

    # output the new array to a string
    print encrypted_phrase.join("")
end

caesar_cipher("What a string!", 5)