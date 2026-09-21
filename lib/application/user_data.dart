import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

final double dailyLimit = 6000; // change korte hobe
final double dailyHourlimit =4;
final double CBlimit =300;



// model class for items
class UserItems {
  final String steps;
  final String hours;

  UserItems({required this.steps, required this.hours});
  //data_store_method 1  ( Convert UserItem to Map/JSON )
  Map<String, dynamic> toJson() =>{
    'steps' : steps,
    'hours' : hours,
  };

  //data_store_method 2 (Create UserItem from Map/JSON)
  factory UserItems.fromJson(Map<String, dynamic> json) {
    return UserItems(
      steps: json['steps'] ?? '',
      hours: json['hours'] ?? '',
    );
  }

}

class DataProvider extends ChangeNotifier{
  //1. (provider) ( Private list to store items)
  List<UserItems> _userList = [];

  //2. (provider) (Unmodifiable getter so outside widgets can read the list safely)
  List<UserItems> get userList => List.unmodifiable(_userList);

  //data_store_method 3 ( KEY: Load saved list when app launches )
  Future<void> loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final String? userListString = prefs.getString('saved_user_list');

    if (userListString != null) {
      final List<dynamic> jsonList = jsonDecode(userListString);
      _userList = jsonList.map((item) => UserItems.fromJson(item)).toList();
      notifyListeners(); // Refresh UI after loading data
    }
  }

  //data_store_method 4 ( KEY: Helper method to save current list state to disk)
  Future<void> _saveToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = _userList.map((user) => user.toJson()).toList();
    final String encodedData = jsonEncode(jsonList);

    await prefs.setString('saved_user_list', encodedData);
  }

  // 3.(provider) Action to add a new item
  void addUser(String steps, String hours) {
    _userList.add(UserItems(steps: steps, hours: hours));
    notifyListeners(); // Triggers UI update across listening widgets
    _saveToPrefs(); //data_store_method 5

  }

  // 4. Action to remove an item
  void removeUser(int index) {
    _userList.removeAt(index);
    notifyListeners(); // Triggers UI update
    _saveToPrefs(); //data_store_method 5

  }

  //5. to show last name only
  UserItems? get lastData {
    if (_userList.isEmpty) return null;
    return _userList.last;
  }


}