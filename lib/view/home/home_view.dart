import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/data/response/status.dart';
import 'package:getx_mvvm/res/components/internet_exceptions_widget.dart';
import 'package:getx_mvvm/res/router/routes_name.dart';
import 'package:getx_mvvm/view_models/controller/home/home_view_model.dart';
import 'package:getx_mvvm/view_models/controller/user_preference/user_preference_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final homeController = Get.put(HomeController());
  UserPreference userPreference = UserPreference();

  @override
  void initState() {
    super.initState();
    homeController.userListApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.logout_outlined),
            onPressed: () async {
              await userPreference.removeUser();

              Get.toNamed(RouteName.loginView);
            },
          )
        ],
      ),
      body: Obx(() {
        switch (homeController.rxRequestStatus.value) {
          case Status.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case Status.error:
            if (homeController.error.value == 'No internet') {
              return InternetExceptionsWidget(onPress: () {
                homeController.userListApi();
              });
            }
            return Center(
              child: Text(
                homeController.error.toString(),
              ),
            );
          case Status.completed:
            return ListView.builder(
              itemCount: homeController.userList.value.data!.length,
              itemBuilder: (ctx, index) {
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        homeController.userList.value.data![index].avatar
                            .toString(),
                      ),
                    ),
                    title: Text(
                      homeController.userList.value.data![index].firstName
                          .toString(),
                    ),
                    subtitle: Text(
                      homeController.userList.value.data![index].email
                          .toString(),
                    ),
                  ),
                );
              },
            );
        }
      }),
    );
  }
}
