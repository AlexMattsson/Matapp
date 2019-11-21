import 'package:shared_preferences/shared_preferences.dart';

class PersistentStorage {
    //Returns if dropdown value is set or not.
    static Future<bool> isKeySet(key) async {
        final prefs = await SharedPreferences.getInstance();
        return prefs.getString(key) == null ? false : true;
    }

    // Returns the value of user class from local storage
    static Future<String> get(key) async {
        final prefs = await SharedPreferences.getInstance();
        return prefs.getString(key);
    }

    //Updates the value class value at the local storage
    static void set(key, value) async {
        final prefs = await SharedPreferences.getInstance();
        prefs.setString(key, value);
    }
}