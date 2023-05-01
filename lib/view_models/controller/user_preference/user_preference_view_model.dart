import 'package:get/get.dart';
import 'package:getx_mvvm/models/login/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreference {
  Future<bool> saveUser(UserModel responseModel) async {
    SharedPreferences store = await SharedPreferences.getInstance();
    store.setString('token', responseModel.token.toString());
    return true;
  }

  Future<UserModel> getUser() async {
    SharedPreferences store = await SharedPreferences.getInstance();
    String? token = store.getString('token');
    return UserModel(
      token: token,
    );
  }

  Future<bool> removeUser() async {
    SharedPreferences store = await SharedPreferences.getInstance();
    store.clear();
    return true;
  }
}
