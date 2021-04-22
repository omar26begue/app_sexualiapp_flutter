import 'package:scoped_model/scoped_model.dart';

class ModelSexualProvider extends Model {
  String tabLogin = 'login';

  String get getTabLogin => tabLogin;

  void setTabLogin(String pLogin) {
    tabLogin = pLogin;
    notifyListeners();
  }
}
