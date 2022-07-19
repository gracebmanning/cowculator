import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  late SharedPreferences prefs;
  final List<String> emptyList = [];
  LocalStorage();

  setSoundEffects(bool val) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setBool('soundEffects', val);
  }

  Future<bool> getSoundEffects() async {
    prefs = await SharedPreferences.getInstance();
    bool retVal = prefs.getBool('soundEffects') ?? false;
    return retVal;
  }

  setColor(int val) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setInt('color', val);
  }

  Future<int> getColor() async {
    prefs = await SharedPreferences.getInstance();
    int retVal = prefs.getInt('color') ?? 0;
    return retVal;
  }

  addHistoryItem(String item) async {
    prefs = await SharedPreferences.getInstance();
    List<String> history = prefs.getStringList('history') ?? emptyList;
    history.insert(0, item);
    prefs.setStringList('history', history);
  }

  clearHistory() async {
    prefs = await SharedPreferences.getInstance();
    prefs.setStringList('history', emptyList);
  }

  getHistoryList() async {
    prefs = await SharedPreferences.getInstance();
    List<String> history = prefs.getStringList('history') ?? emptyList;
    return history;
  }
}
