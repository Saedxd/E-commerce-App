import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePreferences2 {

  static SharedPreferences _preferences;
  static const _keyUsername = 'username';
  static const _keyEmail = 'Email';
  static const _keyPass = 'Pass';

  static Future init() async => _preferences = await SharedPreferences.getInstance();

  static Future setUsername(String username) async =>
      await _preferences.setString(_keyUsername, username);

  static String getUsername() => _preferences.getString(_keyUsername);




  static Future SetEmail(String Email) async =>
      await _preferences.setString(_keyEmail, Email);

  static String GetEmail() => _preferences.getString(_keyEmail);




  static Future SetPass(String Pass) async =>
      await _preferences.setString(_keyPass, Pass);

  static String Getpass() => _preferences.getString(_keyPass);



// static Future setPets(List<String> pets) async =>
  //     await _preferences.setStringList(_keyPets, pets);
  //
  // static List<String> getPets() => _preferences.getStringList(_keyPets);

  // static Future setBirthday(DateTime dateOfBirth) async {
  //   final birthday = dateOfBirth.toIso8601String();
  //
  //   return await _preferences.setString(_keyBirthday, birthday);
  // }

  // static DateTime getBirthday() {
  //   final birthday = _preferences.getString(_keyBirthday);
  //
  //   return birthday == null ? null : DateTime.tryParse(birthday);
  // }
}