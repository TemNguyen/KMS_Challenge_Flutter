import 'package:shared_preferences/shared_preferences.dart';

class Helper {

// Write DATA
static Future<bool> saveData(String key, String value) async {
	SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
	return await sharedPreferences.setString(key, value);
}

// Read Data
static Future getData(String key) async {
	SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
	return sharedPreferences.getString(key);
}
}

