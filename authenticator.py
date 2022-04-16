import datetime
import os.path
from exceptions import RegistrationError, AuthorizationError


class Authenticator:
    """Класс аудентификации пользователя."""
    def __init__(self):
        self.login: str | None = None
        self._password: str | None = None
        self.last_success_login_at: datetime.datetime | None = None
        self.errors_count: int = 0

        if self._is_auth_file_exist():
            self._read_auth_file()

    @staticmethod
    def _is_auth_file_exist() -> bool:
        """Метод проверки на наличие файла"""
        return os.path.exists("auth.txt")

    def _read_auth_file(self) -> None:
        """Чтение данных из файла auth.txt. Данные из файла записываем в переменные объекта класса"""
        with open('auth.txt') as f:
            self.login = f.readline().strip()
            self._password = f.readline().strip()
            self.last_success_login_at = datetime.datetime.fromisoformat(f.readline().strip())
            self.errors_count = int(f.readline().strip())

    def authorize(self, login, password):
        """Авторизация пользователя."""
        if not self.login:
            self.errors_count += 1
            raise AuthorizationError("Вы не зарегистрированы.")

        if not login:
            self.errors_count += 1
            self._update_auth_file()
            raise AuthorizationError("Логин не может быть пустым!")

        if login == self.login and password == self._password:
            self._update_auth_file()
        else:
            self.errors_count += 1
            self._update_auth_file()
            raise AuthorizationError("Не корректный логин или пароль.")

    def _update_auth_file(self):
        """Перезапись файла auth.txt. Обновляется время и количество ошибок."""
        with open('auth.txt', 'w') as f:
            f.write(f"{self.login}\n")
            f.write(f"{self._password}\n")
            self.last_success_login_at = datetime.datetime.utcnow()
            f.write(f"{self.last_success_login_at.isoformat()}\n")
            f.write(f"{self.errors_count}")

    def registrate(self, login, password) -> None:
        """Регистрация пользователя."""
        if self.login:
            self.errors_count += 1
            self._update_auth_file()
            raise RegistrationError("Вы уже зарегистрированный пользователь.")

        if not login:
            self.errors_count += 1
            raise RegistrationError("Логин не может быть пустым полем.")

        self.login = login
        self._password = password
        self._update_auth_file()


