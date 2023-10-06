import 'package:email_app_task/model/email_body.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../constants.dart';
import '../model/email_model.dart';

class EmailController extends GetxController{
  RxList<EmailBody> emailBody = RxList<EmailBody>();
  RxList<String> starredMail =<String>[].obs;
  late WebViewController controller;

  @override
  void onInit() {
   emailBody.addAll({
     EmailBody(emailBody: happiloMailbody, emailId: 'happillo@happilo.com', subject: 'Thank you for your purchase'),
     EmailBody(emailBody: hopscotchMailBody, emailId: 'hopscotch@hopscotch.com', subject: 'Order Shipped'),
     EmailBody(emailBody: noiseMailBody, emailId: 'noise@noise.com', subject: 'Thank you for placing order with us'),

   });


    super.onInit();
  }

  void addStarList(String item){
    starredMail.value.add(item);
  }

  void removeStarList(String item){
    starredMail.value.remove(item);
    print(starredMail);

  }

  void copyTOClipBoard(String text,String email){
    Clipboard.setData(ClipboardData(text: text));
    Get.snackbar("Copied", email);
  }

}