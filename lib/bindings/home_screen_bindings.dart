import 'package:email_app_task/controller/email_controller.dart';
import 'package:get/get.dart';

class HomeScreenBindings extends Bindings {  @override
  void dependencies() {
   Get.lazyPut<EmailController>(() => EmailController());
  }
}