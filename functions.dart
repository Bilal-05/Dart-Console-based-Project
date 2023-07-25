import 'dart:io';

void addEntry(List Diary, String User) {
  String Entry, Date;
  Map<String, dynamic> map = {};
  print("==========================================");
  stdout.write("What's on your mind, $User?\n");
  stdout.write("Dear Diary,\n");
  Entry = stdin.readLineSync()!;

  stdout.write("Todays date: ");
  Date = stdin.readLineSync()!;
  print("==========================================");
  map["Entry"] = Entry;
  map["Date"] = Date;
  Diary.add(map);
}

void replaceEntry(List Diary) {
  print("==========================================");
  stdout.write("Total entries: ${Diary.length} \n");
  stdout.write("\n");
  for (int i = 0; i < Diary.length; i++) {
    stdout.write("${i + 1}. ${Diary[i]["Entry"]}\n");
  }
  stdout.write("\n");

  stdout.write("What index do you wish to edit: ");
  int index = int.parse(stdin.readLineSync()!);
  stdout.write("\n");

  stdout.write("What's on your mind now?: ");
  String newEntry = stdin.readLineSync()!;

  print("==========================================");

  Map<String, dynamic> map2 = {};
  map2["Entry"] = newEntry;

  stdout.write("\n");
  for (int i = 0; i < Diary.length; i++) {
    if (i == index - 1) {
      map2["Date"] = Diary[i]["Date"];
      Diary[i] = map2;
      break;
    }
  }
}

void deleteEntry(List Diary) {
  print("==========================================");
  stdout.write("Total entries: ${Diary.length} \n");
  stdout.write("\n");
  for (int i = 0; i < Diary.length; i++) {
    print("${i + 1}. ${Diary[i]["Entry"]}");
  }

  stdout.write("What index you wish to delete?: ");
  int index = int.parse(stdin.readLineSync()!);
  stdout.write("\n");

  print("==========================================");

  for (int i = 0; i < Diary.length; i++) {
    if (i == index - 1) {
      Diary.removeAt(i);
      break;
    }
  }
}

void viewEntry(List Diary, String User) {
  bool value = false;
  if (Diary.length == 1) {
    print("==========================================");
    print("Dear Diary,");
    print(Diary[0]["Entry"]);
    print("Date: ${Diary[0]["Date"]}");
    print("==========================================");
  } else {
    print("==========================================");
    print("How do you want to view your diary, $User?");
    print("1. Index");
    print("2. Date");
    print("3. Exit");
    stdout.write("Option: ");
    var option = stdin.readLineSync()!;

    if (option == "Index" ||
        option == "index" ||
        option == "INDEX" ||
        option == "1") {
      print("==========================================");
      print("Total entries: ${Diary.length} \n");

      stdout.write("\nWhat index do you want to view?: ");
      int index = int.parse(stdin.readLineSync()!);
      print("==========================================");

      if (index <= Diary.length) {
        for (int i = 0; i <= Diary.length; i++) {
          if (i == (index - 1)) {
            print("Dear Diary,");
            print(Diary[i]["Entry"]);
            print("Date: ${Diary[i]["Date"]}");
            print("==========================================");
            break;
          }
        }
      } else {
        print("Dear $User");
        print("Given index doesn't exist");
        print("==========================================");
      }
    } else if (option == "Date" ||
        option == "date" ||
        option == "DATE" ||
        option == "2") {
      print("==========================================");
      for (int i = 0; i < Diary.length; i++) {
        stdout.write("${i + 1}: ${Diary[i]["Date"]}");
        stdout.write("\n");
      }
      print("==========================================");
      stdout.write("Enter a date from above list to view its contents?: ");
      String date = stdin.readLineSync()!;
      print("==========================================");

      for (int i = 0; i < Diary.length; i++) {
        if (date == Diary[i]["Date"]) {
          value = true;
          break;
        }
      }
      if (value == true) {
        for (int i = 0; i < Diary.length; i++) {
          if (date == Diary[i]["Date"]) {
            print("Dear Diary,");
            print(Diary[i]["Entry"]);
            print("Date: ${Diary[i]["Date"]}");
            print("==========================================");
            break;
          }
        }
      } else {
        print("Dear User,");
        print("Date that you entered doesn't exist");
        print("==========================================");
      }
    } else {
      print("Going back to mainMenu");
      print("==========================================");
    }
  }
}

List Login(List User) {
  List credentials = [];
  print("Enter your credentials to access your Diary");
  stdout.write("Username: ");
  String user = stdin.readLineSync()!;
  stdout.write("Password: \n");
  stdin.echoMode = false;
  var pass = stdin.readLineSync()!;

  credentials.add(user);
  credentials.add(pass);
  return credentials;
}

createUser(List User) {
  bool userExist = false;
  Map mapUser = {};
  print("Create your credentials in order  to access your Diary in Future");
  stdout.write("Username: ");
  String user = stdin.readLineSync()!;
  stdout.write("Password: ");
  var pass = stdin.readLineSync()!;

  print("\n");
  for (int i = 0; i < User.length; i++) {
    if (user == User[i]["User"]) {
      userExist = true;
    }
  }
  if (userExist) {
    print("User already exist.");
    print("Use different username");
  } else {
    mapUser["User"] = user;
    mapUser["Password"] = pass;
    User.add(mapUser);
  }
}
