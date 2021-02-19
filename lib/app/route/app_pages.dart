import 'package:get/get.dart';
import 'package:login_app/app/modules/login/login_binding.dart';
import 'package:login_app/app/modules/login/login_page.dart';
import 'package:login_app/app/modules/register_data/register_binding.dart';
import 'package:login_app/app/modules/register_data/register_page.dart';
import 'package:login_app/app/modules/splash/splash_binding.dart';
import 'package:login_app/app/modules/splash/splash_page.dart';
import 'package:login_app/app/route/app_routes.dart';

class AppPages {

  static final List<GetPage> pages = [
    GetPage(name: AppRoutes.SPLASH, page: () => SplashPage(), binding: SplashBinding()),
    GetPage(name: AppRoutes.LOGIN, page: () => LoginPage(), binding: LoginBinding()),
    GetPage(name: AppRoutes.REGISTER, page: () => RegisterPage(), binding: RegisterBinding()),
  ];

}