import pandas as pd
import numpy as np

'''
DOCUMENTATION:
This script takes short paragraph descriptions and converts them to integers using a bag of words model, specifically,
a bigrams model using nested dictionaries.
To Use:
    - Copy all your description data into 'descriptions.txt' and if there are multiple rows of description data, make
      sure the text file has a newline for each new row.
    - Run the script!
What to Expect:
    - a new csv with the integer conversion for all the descriptions
'''

EMPTY = '::END::'

# Takes a text file, reads it, and returns a string of all the text in the file
def read_corpus(filename):
    with open(filename) as file:
        text = file.read()
    return text

# Cleans single word of unnecessary punctuation and spaces
def clean_word(word):
    g = word.strip('! " # $ % & ( ) * + = . / : ; < = > ? @ [ \ \ ] ^ , - _ ` { | } ~ ')
    w = g.replace(" ", "")
    m = w.replace("-", "")
    return m.lower()

# Takes string of text, returns a nested list of lists of the words in each line
def prepare_corpus(text):
    my_nested_list = []
    for line in text.strip().splitlines():
        line_list = []
        for word in line.split(" "):
            word = clean_word(word)
            line_list.append(word)
        my_nested_list.append(line_list)
    return my_nested_list



# Takes a nested list and returns a bigram dictionary w/ words as keys and inner dictionaries as values.
# inner dictionary maps second word to integer counting occurrences
def build_bigrams(lines):
    outer_dict = {}
    for line in lines:
        old_word = EMPTY
        line.append(EMPTY)
        for word in line:
            first_word = old_word
            second_word = word
            old_word = second_word
            if (first_word,) not in outer_dict:
                outer_dict[(first_word,)] = {}
            if second_word in outer_dict[(first_word,)]:
                outer_dict[(first_word,)][second_word] += 1
            if second_word not in outer_dict[(first_word,)]:
                outer_dict[(first_word,)][second_word] = 1
    return outer_dict

def build_trigrams(lines):
    tri_dict = {}
    for line in lines:
        old_word = '::END::'
        line.append('::END::')
        for word in line:
            first_word = old_word
            second_word = first_word
            third_word = word
            old_word = third_word
            if first_word not in tri_dict:
                tri_dict[first_word] = {}
            if second_word in tri_dict[first_word]:
                tri_dict[first_word][second_word] += 1
            if second_word not in tri_dict[first_word]:
                tri_dict[first_word][second_word] = 1
            if third_word in tri_dict[second_word]:
                tri_dict[second_word][third_word] += 1
            if third_word not in tri_dict[second_word]:
                tri_dict[second_word][third_word] += 1
    return tri_dict

# write integer values to a csv
def write_me(integer_transform_list):
    with open('description_integers.csv', 'w') as fd:
        for num in integer_transform_list:
            fd.write(str(num) + '\n')

def main():
    n = 'descriptions.txt'
    string_of_text = read_corpus(n)
    prep_corpus = prepare_corpus(string_of_text)
    bigrams = build_bigrams(prep_corpus)
    integer_transform = []
    for line in string_of_text.splitlines():
        line_int = 0
        old_word = EMPTY
        for word in line.split(' '):
            word = clean_word(word)
            first_word = old_word
            second_word = word
            old_word = second_word
            weight = bigrams[(first_word,)][second_word] # could also implement trigrams!
            line_int += weight
        integer_transform.append(line_int)
    write_me(integer_transform)

if __name__ == '__main__':
    main()

