__author__ = 'Artem Shcherban'

from teachMeSkillsMyProjects.authenticator import Authenticator
from random import randint
from teachMeSkillsMyProjects.exceptions import RegistrationError, AuthorizationError


def guess_number_game() -> None:
    """
    Создаём функцию с игрой по угадыванию числа от 1 до 5, где пользователь вводит число и пытается угадать
     его с подсказками

    """

    random_number = randint(1, 5)

    # Счетчик количества попыток
    count_random = 0

    while True:
        your_number = input("Угадайте число от 1 до 5: ")
        your_number = your_number.strip()

        try:
            your_number = int(your_number)
        except ValueError as ex:
            print(f'ОШИБКА: {ex} - угадываемое число должно писаться цифрами')
            count_random += 1
            continue

        if your_number < random_number:
            print("Это число меньше заданного")
        elif your_number > random_number:
            print("Это число больше заданного")
        else:
            print(f"Это заданное число '{random_number}'! Вы угадали с {count_random + 1} попытки!")
            break

        count_random += 1


def decorator(func):
    def wrapper():
        while True:
            if func():
                break

    return wrapper


@decorator
def main() -> bool:
    """
    Создаём основную функцию main, в которой будут вызовы всех остальных функций, ввод данных и прочее.
    """

    authenticator = Authenticator()

    if authenticator.login:
        print("Для авторизации введите логин и пароль.")
    else:
        print("Для регистрации введите логин и пароль.")

    login = input("Введите логин: ")
    password = input("Введите пароль: ")

    if authenticator.login:

        try:
            authenticator.authorize(login, password)
        except AuthorizationError as error:
            print(f"Ошибка! {error}")
            return False
    else:
        try:
            authenticator.registrate(login, password)
        except RegistrationError as error:
            print(f"Ошибка! {error}")
            return False

        print("Вы успешно зарегистрировались!")
        return True

    time = authenticator.last_success_login_at.strftime('%d.%m.%Y %H:%M:%S')
    print(f"Привет {authenticator.login.upper()}! "
          f"Время последней успешной авторизации: {time}\n"
          f"Количество попыток ввода логина: {authenticator.errors_count+1} раз\а.")

    print("Предлагаю сыграть в игру!")
    guess_number_game()
    return True


if __name__ == '__main__':
    main()
