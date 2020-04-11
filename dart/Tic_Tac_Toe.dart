import 'dart:io';

var board = ['_', '_', '_', '_', '_', '_', '_', '_', '_'];

String player = "x";

welcome() {
  print("hello world !");
  print("welcome to the game ");
  print('');
}

disp_board() {
  print("${board[0]} | ${board[1]} | ${board[2]}");
  print("${board[3]} | ${board[4]} | ${board[5]}");
  print("${board[6]} | ${board[7]} | ${board[8]}");
}

handl_player() {
  if (player == "x") {
    player = "O";
  } else {
    player = "x";
  }
}

play() {
  if (board[0] == "_" ||
      board[1] == "_" ||
      board[2] == "_" ||
      board[3] == "_" ||
      board[4] == "_" ||
      board[5] == "_" ||
      board[6] == "_" ||
      board[7] == "_" ||
      board[8] == "_") {
    print("enter the number from (1 - 9)");
    stdout.write("$player  turn > ");
    int i = int.parse(stdin.readLineSync());
    if (board[i - 1] == '_') {
      board[i - 1] = player;
      handl_player();
    } else {
      print("already filled");
    }
  } else {
    print("game over");
    for (int i = 0; i <= 10; i++) {
      print(".");
    }
    board = ['_', '_', '_', '_', '_', '_', '_', '_', '_'];
    print("'r' to restart");
    print("'q' for quit");
    var i = stdin.readLineSync();
    if (i == 'r') {
      main();
    } else if (i == 'q') {
      print("thanks for playing");
      exit(0);
    }
  }
  disp_board();
  check_win();
  play();
}

// check win
c_rows() {
  print('checking rows for win');
}

c_columns() {
  print('checking columns for win');
}

c_diagonal() {
  print('checking diagonals for win');
}

check_win() {
  c_rows();
  c_columns();
  c_diagonal();
}

main() {
  welcome();
  disp_board();
  play();
}
