from flask import Flask

app = Flask(__name__)
@app.route('/') 
def hello():
    if True:
        return 'Hello World, This is Kurio!!', 200
    return "Can't find Kurio", 404

if __name__ == "__main__":
    app.run(host='0.0.0.0')
