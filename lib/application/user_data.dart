import 'package:flutter/cupertino.dart';


// model class for items
class UserItems {
  final String steps;
  final String hours;

  UserItems({required this.steps, required this.hours});
}

class DataProvider extends ChangeNotifier{
  //1. (provider) ( Private list to store items)
  List<UserItems> _userList = [];

  //2. (provider) (Unmodifiable getter so outside widgets can read the list safely)
  List<UserItems> get userList => List.unmodifiable(_userList);

  // 3.(provider) Action to add a new item
  void addUser(String steps, String hours) {
    _userList.add(UserItems(steps: steps, hours: hours));
    notifyListeners(); // Triggers UI update across listening widgets

  }

  // 4. Action to remove an item
  void removeUser(int index) {
    _userList.removeAt(index);
    notifyListeners(); // Triggers UI update

  }

  //5. to show last name only
  UserItems? get lastData {
    if (_userList.isEmpty) return null;
    return _userList.last;
  }


}