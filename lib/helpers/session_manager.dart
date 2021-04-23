import 'package:sexual_app/helpers/constants/sessions.dart';
import 'package:sexual_app/models/retrofit/responses/login_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionManagerSexualidad {
  Future<bool> isLogginSexualidad() async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;

    return prefs.getBool(sessionLogin) ?? false;
  }

  void setLogginSexualidad(bool login) async {
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

  void setLoginSexualidad(ResponseLoginModel token) async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;

    prefs.setBool(sessionLogin, true);
    prefs.setString(sessionIdentifier, token.identifier);
    prefs.setString(sessionToken, token.token);
  }

  Future<bool> clearPrefSexualidad() async {
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
