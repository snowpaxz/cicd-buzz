import unittest

from yo_mama import mama


def test_select_word():
    wordlist = ('Foo', 'Bar', 'Bat')
    selection = mama.select_words(wordlist)
    assert selection in wordlist


def test_sentence():
    joke = mama.generate_joke()
    assert len(joke.split()) > 5
