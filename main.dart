import 'dart:io';
import 'functions.dart';
import 'mainMenu.dart';

void main() {
  // List mainDiary = [];
  List Diary = [];
  List bilalDiary = [];
  List ammarDiary = [];
  Map history;
  List History = [];
  List value;
  String user1;
  num count = 0;
  bool runMenu = true;
  bool runLogin = false;
  List User = [
    {"User": "Ammar", "Password": "Ammar@123"},
    {"User": "Bilal", "Password": "Bilal@123"}
  ];

  print("*** WELCOME TO PASSWORD PROTECTED DIARY ***");
  while (runMenu) {
    stdin.echoMode = true;
    if (count == 3) {
      print(
          "You have entered wrong username or password too many times.\nNow wait for 30 seconds");
      sleep(const Duration(seconds: 30));
      count = 0;
    }
    print("==========================================");
    print("1. Login");
    print("2. Register");
    print("3. Show login history");
    print("4. Exit");
    stdout.write("Option: ");
    int input = int.parse(stdin.readLineSync()!);
    print("==========================================");

    switch (input) {
      case 1:
        if (count < 3) {
          value = Login(User);
          stdin.echoMode = true;
          user1 = value[0];
          print("==========================================");
          for (int i = 0; i < User.length; i++) {
            if (user1 == User[i]["User"] && value[1] == User[i]["Password"]) {
              runLogin = true;
            }
          }
          if (runLogin) {
            history = {};
            history["User"] = user1;
            history["LoginTime"] = DateTime.now();
            History.add(history);
            mainMenu(user1, Diary, bilalDiary, ammarDiary);
          } else {
            count++;
            print("Wrong username or password entered");
          }
        }
        break;
      case 2:
        createUser(User);
        print("New users cannot access diary right now");
        break;
      case 3:
        if (History.length == 0) {
          print("Zero user logged in");
        } else {
          for (int i = 0; i < History.length; i++) {
            print(
                "${i + 1}. ${History[i]["User"]} logged in at ${History[i]["LoginTime"]}.");
          }
        }
        break;
      case 4:
        print("Good-Bye!");
        runMenu = false;
        break;
      default:
        print("Wrong Input!.\nPlease enter 1,2 or 3");
        break;
    }
  }
}
