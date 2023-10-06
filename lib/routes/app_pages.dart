import 'package:email_app_task/bindings/email_body_screen_bindings.dart';
import 'package:email_app_task/bindings/home_screen_bindings.dart';
import 'package:email_app_task/screens/email_body_screen/email_body_screen.dart';
import 'package:email_app_task/screens/home_screen/home_screen.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME_SCREEN,
      page: () =>  const HomeScreen(),
      binding: HomeScreenBindings(),
    ),
    GetPage(
      name: _Paths.EMAILBODY_SCREEN,
      page: () =>  const EmailBodyUI(),
      binding: EmailBodyScreenBindings(),
    ),

  ];
}