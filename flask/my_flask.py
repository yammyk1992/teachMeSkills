# импортируем класс Flask, который формирует WSGI приложение
from flask import Flask, render_template

# создаём экземпляр этого класса
# и первым аргументом должны указать имя нашего приложения
app = Flask(__name__)


@app.route("/")
@app.route("/index")
def index():
    return render_template('index.html')


@app.route("/about")
def about():
    return "<h1>О сайте </h1>"


if __name__ == "__main__":
    # запуск локального Web сервера, в качестве параметра указывается debug=True
    # что-бы видеть все ошибки, которые будут возникать во время приложения
    app.run(debug=True)
