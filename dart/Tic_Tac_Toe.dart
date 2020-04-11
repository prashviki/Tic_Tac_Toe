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


gameOver() {
  menu();
}

menu() {
  quit() {
    print("thanks for playing");
    exit(0);
  }
  print("'r' to restart");
  print("'q' for quit");
  var i = stdin.readLineSync();
  if (i == 'r') {
    reset_game();
    main();
  } else if (i == 'q') {
    quit();
  }
}

reset_game() {
  board = ['_', '_', '_', '_', '_', '_', '_', '_', '_'];
  player = 'x';
}

congrts(p) {
  print("$p won");
  print('🎉🎉🎉');
  menu();
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
    reset_game();
    menu();
  }
  disp_board();
  check_win();
  play();
}

// check win
c_rows() {
  if (((board[0] == board[1]) && (board[1] == board[2])) && (board[0] != '_')) {
    congrts(board[0]);
    exit(0);
  } else if (((board[3] == board[4]) && (board[4] == board[5])) &&
      (board[3] != '_')) {
    congrts(board[3]);
    exit(0);
  } else if (((board[6] == board[7]) && (board[7] == board[8])) &&
      (board[6] != '_')) {
    congrts(board[6]);
    exit(0);
  }
}

c_columns() {
  if (((board[0] == board[3]) && (board[3] == board[6])) && (board[0] != '_')) {
    congrts(board[0]);
    exit(0);
  } else if (((board[1] == board[4]) && (board[4] == board[7])) &&
      (board[1] != '_')) {
    congrts(board[1]);
    exit(0);
  } else if (((board[2] == board[5]) && (board[5] == board[8])) &&
      (board[2] != '_')) {
    congrts(board[2]);
    exit(0);
  }
}

c_diagonal() {
  if (((board[0] == board[4]) && (board[4] == board[8])) && (board[0] != '_')) {
    congrts(board[0]);
    exit(0);
  } else if (((board[2] == board[4]) && (board[4] == board[6])) &&
      (board[2] != '_')) {
    congrts(board[2]);
    exit(0);
  }
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
