import 'package:sexual_app/helpers/constants/sessions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionManagerSexualidad {
  Future<bool> isLogginMedical() async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;

    return prefs.getBool(sessionLogin) ?? false;
  }

  void setLogginMedical(bool login) async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;

    prefs.setBool(sessionLogin, login);
  }

  Future<String> getToken() async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;

    return prefs.getString(sessionToken) ?? null;
  }

  Future<String> getUsers() async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;

    return prefs.getString(sessionIdentifier) ?? null;
  }

  /*setLoginMedical(ResponseLoginModel token) async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;

    prefs.setBool(sessionLogin, true);
    prefs.setString(sessionIdentifier, token.identifier);
    prefs.setString(sessionToken, token.token);
  }*/

  Future<bool> clearPrefMedical() async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;

    /// elimina los datos de la aplicacion
    prefs.remove(sessionLogin);
    prefs.remove(sessionIdentifier);
    prefs.remove(sessionToken);

    /// elimina todos los datos de la aplicacion
    prefs.clear();

    return true;
  }
}
