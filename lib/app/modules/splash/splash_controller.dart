import 'package:get/get.dart';
import 'package:login_app/app/route/app_routes.dart';
import 'package:login_app/app/util/preferencer_util.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Prefs.init();
    _timer();
  }

  void _timer() {
    Future.delayed(Duration(seconds: 3), () async {
      //String jsonUser = await Prefs.getStringF(AppHelpers.USER_KEY_PREFS);
      //Get.offNamed(jsonUser == '' ? AppRoutes.WELCOME : AppRoutes.MAIN);
      Get.offNamed(AppRoutes.LOGIN);
    });
  }
}