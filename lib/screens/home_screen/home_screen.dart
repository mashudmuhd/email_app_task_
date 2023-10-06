
import 'package:email_app_task/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../controller/email_controller.dart';
import '../../widgets/common_widgets.dart';
import '../common_methords.dart';
class HomeScreen extends GetView<EmailController>{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final EmailController emailController = Get.put(EmailController());
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              getHeight(height: 40.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
              width: double.maxFinite, // Adjust the width as needed
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10), // Rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: Offset(0, 3), //   Shadow position
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () {
                        // Add your search functionality here
                      },
                    ),
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search',
                          border: InputBorder.none, // Hide the border
                        ),
                      ),
                    ),
                    const CircleAvatar()
                  ],
                ),
              ),
          ),
            ),
              getBody(emailController),
            ],
          ),
        )
    );
  }




//Here is Body with email static email list
  Widget getBody(EmailController emailController) {
    return Obx(() =>ListView.separated(
      shrinkWrap: true,
         physics: const BouncingScrollPhysics(),
         itemCount: emailController.emailBody.length,
         separatorBuilder: (BuildContext context, int index) => const SizedBox(),
         itemBuilder: (BuildContext context, int index) {

           var email = emailController.emailBody[index].emailId;
           var emailBody = emailController.emailBody[index].emailBody;
           var emailSubject = emailController.emailBody[index].subject;
           final isStarred = emailController.starredMail.value.contains(emailBody);

           Map<String , dynamic> arguments = {"email":email,"emailBody":emailBody,"subject":emailSubject};
           return Padding(
             padding: const EdgeInsets.all(8.0),
             child: ListTile(
               leading: getProfileWithInitialLetter(text: email),
               title:   Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   getRegularBodyText(text: splitNameEmail(email),fontWeight: FontWeight.bold),
                   getRegularBodyText(text: emailSubject,fontSize: 13.0)
                 ],
               ),
               trailing: Column(
                 children: [
                   getRegularBoldText(text: "Sep 30 ",fontWeight: FontWeight.bold),
                    InkWell(
                      onTap: (){
                        if(isStarred){
                          emailController.removeStarList(emailBody);
                        }
                        else{
                          emailController.addStarList(emailBody);
                        }
                      },
                        child: Icon(isStarred?Icons.star:Icons.star_border,color: isStarred?Colors.yellow:Colors.grey))
                 ],
               ),
               onTap: () => Get.toNamed(Routes.EMAILBODY_SCREEN,arguments:arguments),
             ),
           );

         },
       ));
  }
}

getCustomSearchBar(){
  Container(
    width: 300, // Adjust the width as needed
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(30), // Rounded corners
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 3,
          blurRadius: 5,
          offset: const Offset(0, 3), // Shadow position
        ),
      ],
    ),
    child: Row(
      children: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            // Add your search functionality here
          },
        ),
        const Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              border: InputBorder.none, // Hide the border
            ),
          ),
        ),
      ],
    ),
  );
}