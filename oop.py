class Cars:
    def __init__(self, model: str = "легковая", vin_number: str = None, color: str = "белую",
                 year_of_production: int = 2022):
        self.model = model
        self._vin_number = vin_number
        self.color = color
        self.year_of_production = year_of_production

    def buy(self):
        print(f"Покупаем машину: {self.model}")

    def registration(self):
        print(f"Регистрируем машину {self.year_of_production} года")

    def private_info(self):
        print(f"VIN: {self._vin_number}")


class Passenger(Cars):
    # def __init__(self, model, vin_number, color, year_of_production, engine_type, body_type, hp):
    #     super().__init__(model, vin_number, color, year_of_production)
    def __init__(self, model, vin_number, engine_type: str = "бензиновый", body_type: str = "седан", hp: int = 500):
        super().__init__(vin_number, model)
        self.model = model
        self._vin_number = vin_number
        self.engine_type = engine_type
        self.body_type = body_type
        self.hp = hp

    def buy(self):
        print(f"Покупаем машину {self.model}, кузов: {self.body_type}")

    def info(self):
        color = "черный"
        self.private_info()
        text = f"{self.hp} лошадиных сил.{color.upper()} цвет! С мотором типа: {self.engine_type}"
        print(text)

    def drive(self):
        print(f"Едем на машине {self.color} цвета")


class ElectricCar(Passenger):
    def __init__(self, model, vin_number, battery: int = 362, max_distance: int = 600, color: str = "красного"):
        super().__init__(model, vin_number)
        self.model = model
        self._vin_number = vin_number
        self.battery = battery
        self.max_distance = max_distance
        self.color = color

    # def buy(self):
    #     print(f"Покупаем машину {self.model}, типа {self.body_type}")

    def info(self):
        engine_type = "электро"
        hp = 1000
        self.private_info()
        print(f"{hp} лошадиных сил.{self.color} цвета! С {engine_type} мотором. "
              f"Ёмкость баттареи {self.battery} и максимальная дистанция {self.max_distance} км")


car1 = Cars()
car1.buy()
car1.registration()
car1.private_info()
print()
print()
car2 = Passenger("BMW", "BMWDASDQWF1234")
car2.buy()
car2.registration()
car2.info()
car2.drive()
print()
print()
car3 = ElectricCar("TESLA", "TESLAaASDasDASD")
car3.buy()
car3.registration()
car3.info()
car3.drive()
