# create board
board = ['-', '-', '-',
         '-', '-', '-',
         '-', '-', '-']

current_player = 'x'


# welcome
def welcome():
    print('welcome to dumbAss Tic Tac Toe')


# display board
def display_board():
    print(board[0] + '|' + board[1] + '|' + board[2])
    print(board[3] + '|' + board[4] + '|' + board[5])
    print(board[6] + '|' + board[7] + '|' + board[8])


def start():
    _ = ""
    _ = input('enter the no (1 - 9) : ')

    _ = int(_)
    _ = _ - 1
    if _ in range(0, 9):
        if board[_] == '-':
            board[_] = current_player
            display_board()
        else:
            print("u can't go there")
    else:
        print('wrong input')
    start()


def play():
    welcome()
    display_board()
    start()


play()
