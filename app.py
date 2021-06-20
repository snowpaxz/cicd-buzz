import os
from flask import Flask
from buzz import generator
from yo_mama import mama

app = Flask(__name__)


@app.route("/")
def generate_site():
    # Page Start
    page = '<html><body>'

    # Buzz Section
    page += '<h1>'
    page += generator.generate_buzz()
    page += '</h1>'

    # Yo Mama Section
    page += '<p>'
    page += mama.generate_joke()
    page += '</p>'

    # End Page
    page += '</body></html>'
    return page


if __name__ == "__main__":
    app.run(host='0.0.0.0', port=int(os.getenv('PORT', 5000)))
