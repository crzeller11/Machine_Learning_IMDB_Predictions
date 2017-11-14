from bigrams_dictionary import read_corpus

'''
DOCUMENTATION:
This script takes information about actors and genres of movies, and converts it to an integer!
To Convert Actors:
    - Copy all the actor data you have into 'actors.txt'
    - If you have multiple rows of actors, then make sure each row is on a newline (and don't worry if the actors are
      listed with commas, the script will separate them)
    - Run the script!
To Convert Genres:
    - Copy all teh genre data you have into 'genre.txt'
    - If you have multiple rows of data, make sure each row is on a newline
    - Run the script!
What to expect:
    - A new csv with the data converted into integers
'''

# Takes string of text, returns a nested list of lists of the words in each line
def prepare_corpus(text):
    my_nested_list = []
    for line in text:
        line_list = []
        for word in line.split(","):
            line_list.append(word.strip())
        my_nested_list.append(line_list)
    return my_nested_list

def clean_name(actor_name):
    clean_name = actor_name.replace(" ", "").replace('-', '')
    return clean_name.lower()

def build_dictionary(nested_list):
    actor_dict = {}
    for movie in nested_list:
        for actor in movie:
            actor = clean_name(actor)
            if actor not in actor_dict:
                actor_dict[actor] = 1
            else:
                actor_dict[actor] += 1
    return actor_dict

# write integer values to a csv
def write_me(integer_transform_list, title):
    with open(title, 'w') as fd:
        for num in integer_transform_list:
            fd.write(str(num) + '\n')

def write_actors():
    n = 'actors.txt'
    string_of_text = read_corpus(n)  # open file
    prep_corpus = prepare_corpus(string_of_text.splitlines())  # makes nested list of actors for each movie
    new_dict = build_dictionary(prep_corpus)
    integer_transform = []
    for line in string_of_text.splitlines():
        line_int = 0
        for actor in line.split(','):
            actor = clean_name(actor)
            weight = new_dict[actor]
            line_int += weight
        integer_transform.append(line_int)
    write_me(integer_transform, 'actors.csv')

def write_genre():
    n = 'genre.txt'
    string_of_text = read_corpus(n)
    prep_corpus = prepare_corpus(string_of_text.splitlines())
    new_dict = build_dictionary(prep_corpus)
    print('this is the new dictionary: {}'.format(new_dict))
    integer_transform = []
    for line in string_of_text.splitlines():
        line_int = 0
        for genre in line.split(','):
            genre = clean_name(genre)
            print(genre)
            weight = new_dict[genre]
            line_int += weight
        integer_transform.append(line_int)
    write_me(integer_transform, 'genres.csv')



def main():
    write_actors()
    write_genre()


if __name__ == '__main__':
    main()
