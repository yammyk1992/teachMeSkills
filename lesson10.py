from time import time, sleep


# создаём декоратор(общую инструкцию для функций)
def work_time(func):
    def wrapper():
        print(f"Вызываю функцию {func.__name__}")
        start_time = time()

        result = func()
        print(f"Получаю результат из функции {func.__name__}: {result}")
        end_time = time()
        print(f"Время выполнения функции: {end_time - start_time}")

        return result
    return wrapper


@work_time
def main():
    sleep(1)


@work_time
def main2():
    return list(range(2**12))


@work_time
def main3():
    return range(2**20)


main()
main2()
main3()
