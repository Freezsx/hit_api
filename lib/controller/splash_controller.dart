import 'package:get/get.dart';
import 'package:hit_api/login_page_view.dart';
import 'package:hit_api/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  late final SharedPreferences prefs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    checkSharedPreference();
  }

  void checkSharedPreference() async {
    prefs = await SharedPreferences.getInstance();
    Future.delayed(Duration(seconds: 3), () async {
      if (prefs.getString('token') == null) {
        Get.off(LoginPageView());
      }else {
        Get.off(HomePage());
      }
    });
  }
}