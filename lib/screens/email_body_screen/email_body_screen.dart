import 'package:email_app_task/widgets/thank_you_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants.dart';
import '../../controller/email_controller.dart';
import '../../widgets/common_widgets.dart';
import '../common_methords.dart';

class EmailBodyUI extends GetView<EmailController>{
  const EmailBodyUI({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = Get.find<EmailController>();
    Map<String,dynamic>arguments = Get.arguments;
    String email = arguments['email'];
    String emailBody = arguments['emailBody'];
    String emailSubject  = arguments['subject'];
    print("here is email$email");


    return Scaffold(
        appBar: AppBar(
          actions:  [
            Row(
              children: [
                const Icon(Icons.delete,size: 20.0,),
                getWidth(width: 20.0),
                const Icon(Icons.email_outlined,size: 20.0),
                getWidth(width: 20.0),
                const Icon(Icons.more_vert_outlined,size: 20.0),
                getWidth(width: 30.0)
              ],
            )
          ],
        ),
        // body: InteractiveViewer(
        //   minScale: 0.5,
        //   maxScale: 2.0,
        //   child: getBody(emailController,email,emailBody,emailSubject))

    );
  }
  //Email MainBody
  Widget getBody(EmailController emailController,email,emailBody,emailSubject) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
      child: getEmailContent(emailController,email,emailBody,emailSubject),
    );
  }


  //Email content  body
  Widget getEmailContent(EmailController emailController,email,emailBody,emailSubject) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        getEmailHeader(emailController,email,emailBody,emailSubject),
        getHeight(height: 20.0),
         // Expanded(
         //   child: WebViewWidget(
         //     controller: emailController.webViewController,
         //   ),
         // ),

      ]
    );
  }

//Email Header with profile and subject
  Widget getEmailHeader(EmailController emailController,email,emailBody,subject) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        getRegularBoldText(text: subject.toUpperCase(), fontSize: 20.0),
        Padding(
          padding:  const EdgeInsets.only(top: 30),
          child: Row(
            children: [
              getProfileWithInitialLetter(text: email),
              getWidth(width: 10.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getRegularBoldText(text:splitNameFromEmail(email), fontSize: 18.0),
                  InkWell(
                    child: Row(
                      children: [
                        getRegularBoldText(
                            text: email, fontSize: 10.0, fontColor: Colors.blueGrey),
                        const Icon(Icons.expand_more)
                      ],
                    ),
                    onTap: () => emailController.copyToClipboard(email, email),
                  ),
                ],
              ),
              const Spacer(),
              const Icon(Icons.turn_left,size: 20,),
              getWidth(width: 10.0),
              const Icon(Icons.more_vert_outlined,size: 20,),
            ],
          ),
        ),
      ],
    );
  }
}
