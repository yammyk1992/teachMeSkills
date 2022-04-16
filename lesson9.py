def main():
    with open("data.txt", 'a') as f:
        for i in range(10):
            f.write(f'{i}\n')
    print('write file finish\ntext')


main()
