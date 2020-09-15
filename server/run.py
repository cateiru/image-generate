from flask import Flask, render_template, request

app = Flask(__name__)


@app.route('/')
def main():
    text = request.args.get('text') or 'No data.'

    return render_template('index.html', text=text)


if __name__ == "__main__":
    app.run(debug=False, host='0.0.0.0')
