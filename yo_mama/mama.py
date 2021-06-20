from __future__ import print_function
import random

mama_superlatives = ('ugly', 'fat', 'annoying', 'dumb', 'poor')
mama_punchlines = ('when she skips a meal, the stock market drops',
                   'it took me two buses and a train to get to her good side',
                   'when she goes camping, the bears hide their food',
                   'she put lipstick on her forehead to make up her mind',
                   'she thought a quarterback was a refund',
                   'she put airbags on her computer in case it crashes'
                   )


def select_words(word_list, n=1):
    selection = random.sample(word_list, n)
    if n == 1:
        return selection[0]
    return selection


def generate_joke():
    joke_start = 'Yo mama so '
    joke = ''.join([joke_start, select_words(mama_superlatives), ', ', select_words(mama_punchlines)])
    return joke


if __name__ == '__main__':
    print(generate_joke())

