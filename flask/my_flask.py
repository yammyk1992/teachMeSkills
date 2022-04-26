# импортируем класс Flask, который формирует WSGI приложение
from flask import Flask, render_template, url_for

# создаём экземпляр этого класса
# и первым аргументом должны указать имя нашего приложения
app = Flask(__name__)

menu = ["Установка", "Первое приложение", "Обратная связь"]


@app.route("/")
def index():
    print(url_for("index"))
    return render_template('index.html', menu=menu)


@app.route("/profile/<path:username>")
def profile(username):
    print(url_for("index"))
    return f"Пользователь: {username}"


@app.route("/about")
def about():
    print(url_for("about"))
    return render_template('about.html', title="О сайте", menu=menu)


with app.test_request_context():
    print(url_for('index'))
    print(url_for('about'))
    print(url_for('profile', username='yammyk'))

# if __name__ == "__main__":
#     # запуск локального Web сервера, в качестве параметра указывается debug=True
#     # что-бы видеть все ошибки, которые будут возникать во время приложения
#     app.run(debug=True)
