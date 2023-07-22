import 'dart:io';
import 'functions.dart';
import 'mainMenu.dart';

void main() {
  // List mainDiary = [];
  List Diary = [];
  List bilalDiary = [];
  List ammarDiary = [];
  List User = [
    {"User": "Ammar", "Password": "Ammar@123"},
    {"User": "Bilal", "Password": "Bilal@123"}
  ];
  List value;
  bool runMenu = true;
  bool runLogin = false;
  print("*** WELCOME TO PASSWORD PROTECTED DIARY***");
  while (runMenu) {
    stdin.echoMode = true;
    print("==========================================");
    print("1. Login");
    print("2. Register");
    print("3. Exit");
    stdout.write("Option: ");
    int input = int.parse(stdin.readLineSync()!);
    print("==========================================");

    switch (input) {
      case 1:
        value = Login(User);
        stdin.echoMode = true;
        String user1 = value[0];
        print("==========================================");
        for (int i = 0; i < User.length; i++) {
          if (user1 == User[i]["User"] && value[1] == User[i]["Password"]) {
            runLogin = true;
          }
        }
        if (runLogin) {
          mainMenu(user1, Diary, bilalDiary, ammarDiary);
        } else {
          print("\nUser doesn't exist");
        }
        break;
      case 2:
        print("This feature is under-development");
        //createUser(User);
        break;
      default:
        print("Good-Bye!");
        runMenu = false;
        break;
    }
  }
}
