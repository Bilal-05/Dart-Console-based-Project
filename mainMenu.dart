import 'dart:io';
import 'functions.dart' as func;

mainMenu(String user, List Diary, List Diary1, List Diary2) {
  bool runMain = true;
  if (user == 'Ammar') {
    Diary = Diary2;
  } else {
    Diary = Diary1;
  }
  while (runMain) {
    print("==========================================");
    print("1. Add to diary");
    print("2. Edit in diary");
    print("3. View Diary");
    print("4. Delete in diary");
    print("5. Exit");
    stdout.write("Option: ");
    int input = int.parse(stdin.readLineSync()!);

    switch (input) {
      case 1:
        func.addEntry(Diary, user);
        break;
      case 2:
        func.replaceEntry(Diary);
        break;
      case 3:
        func.viewEntry(Diary, user);
        break;
      case 4:
        func.deleteEntry(Diary);
        break;
      default:
        runMain = false;
        break;
    }
  }
  if (user == 'Ammar') {
    Diary2 = Diary;
  } else {
    Diary1 = Diary;
  }
}
