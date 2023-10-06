import 'package:email_app_task/controller/email_controller.dart';
import 'package:email_app_task/screens/email_body_screen/email_body_screen.dart';
import 'package:get/get.dart';

class EmailBodyScreenBindings extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut<EmailController>(() => EmailController());

}}