class Cars:
    def __init__(self, model: str = "Легковая", vin_number: str = "12345", color: str = "Белый",
                 year_of_production: int = 2022):
        self.model = model
        self._vin_number = vin_number
        self.color = color
        self.year_of_production = year_of_production

    def buy(self):
        print(f"Покупаем машину {self.model}")

    def registration(self):
        print(f"Регистрируем машину {self.year_of_production} года")

    def drive(self):
        print(f"Едем на машине {self.color} цвета")


class Passenger(Cars):
    # def __init__(self, model, vin_number, color, year_of_production, engine_type, body_type, hp):
    #     super().__init__(model, vin_number, color, year_of_production)
    def __init__(self, model: str = "BMW", engine_type: str = "benzine", body_type: str = "sedan", hp: int = 500):
        super().__init__()
        self.model = model
        self.engine_type = engine_type
        self.body_type = body_type
        self.hp = hp

    def buy(self):
        model = "BMW"
        print(f"Покупаем машину {model}, типа {self.body_type}")

    def info(self):
        color = "Черный"
        print(f"{self.hp} лошадиных сил.{color} цвет!.С {self.engine_type} мотором")


class ElectricCar(Passenger):
    def __init__(self, battery: int = 362, max_distance: int = 600):
        super().__init__()
        self.battery = battery
        self.max_distance = max_distance

    def buy(self):
        model = "TESLA"
        print(f"Покупаем машину {model}, типа {self.body_type}")

    def info(self):
        engine_type = "Electro"
        print(f"{self.hp} лошадиных сил.{self.color} цвет!.С {engine_type} мотором. "
              f"Ёмкость баттареи {self.battery} и максимальная дистанция {self.max_distance} км")


car1 = Cars()
car1.buy()
car1.registration()
car1.drive()
print()
print()
car2 = Passenger()
car2.buy()
car2.registration()
car2.info()
car2.drive()
print()
print()
car3 = ElectricCar()
car3.buy()
car3.registration()
car3.info()
