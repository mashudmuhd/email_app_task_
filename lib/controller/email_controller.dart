import 'package:email_app_task/model/email_body.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../constants.dart';

class EmailController extends GetxController {
  RxList<EmailBody> emailBody = RxList<EmailBody>();
  RxList<int> starredMail = <int>[].obs;
  List<RxBool> isStarredList = [];
  RxString searchQuery = RxString('');
  // late final WebViewController webViewController;
  List<EmailBody> get filteredList => emailBody.where((email) => email.emailId.contains(searchQuery.value)).toList();

  @override
  void onInit() {
    emailBody.addAll({
      EmailBody(
          emailBody: happiloMailbody,
          emailId: 'happillo@happilo.com',
          subject: 'Thank you for your purchase'),
      EmailBody(
          emailBody: hopscotchMailBody,
          emailId: 'hopscotch@hopscotch.com',
          subject: 'Order Shipped'),
      EmailBody(
          emailBody: noiseMailBody,
          emailId: 'noise@noise.com',
          subject: 'Thank you for placing an order with us'),
    });

    for (int i = 0; i < emailBody.length; i++) {
      isStarredList.add(false.obs);
    }


    // webViewController = WebViewController();
    // webViewController.loadFlutterAsset(hopscotchMailBody);
    super.onInit();
  }

  void sortEmails(){
    emailBody.sort((a,b)=>a.emailId.compareTo(b.emailId));

  }

  void toggleStarIcon(int index) {
    if (starredMail.contains(index)) {
      starredMail.remove(index);
    } else {
      starredMail.add(index);
    }
    isStarredList[index].value = !isStarredList[index].value;
    update();
  }

  bool isStarred(int index) {
    return starredMail.contains(index);
  }

  void copyToClipboard(String text, String email) {
    Clipboard.setData(ClipboardData(text: text));
    Get.snackbar("Copied", email);
  }

  void searchItem(String query){
    if(query.length>2){
      searchQuery.value = query;
    }
    else{
      searchQuery.value ="";

    }
  }
}
