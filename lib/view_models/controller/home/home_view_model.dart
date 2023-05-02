import 'package:get/get.dart';
import 'package:getx_mvvm/data/response/status.dart';
import 'package:getx_mvvm/models/home/user_list_model.dart';
import 'package:getx_mvvm/repository/home_repository/home_repository.dart';
import 'package:getx_mvvm/utils/utils.dart';

class HomeController extends GetxController {
  final _api = HomeRepository();

  final rxRequestStatus = Status.loading.obs;
  final userList = UserListModel().obs;
  RxString error = ''.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setUserList(UserListModel value) => userList.value = value;
  void setError(String value) => error.value = value;

  void userListApi({bool mounted = true}) async {
    try {
      final data = await _api.userListApi();
      setRxRequestStatus(Status.completed);
      setUserList(data);
    } catch (e) {
      setRxRequestStatus(Status.error);
      setError(e.toString());
      Utils.snackBar("Error", e.toString());
    }
  }

  void refreshApi() async {
    setRxRequestStatus(Status.loading);
    userListApi();
  }
}
