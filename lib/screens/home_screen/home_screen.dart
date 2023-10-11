
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
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              getHeight(height: 40.0),
            getSearchBar(),
              getBody(),
            ],
          ),
        )
    );
  }

  Widget getSearchBar() {
    return Stack(
      children: [
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

                        },
                      ),
                       Expanded(
                        child: TextField(
                          onChanged:controller.searchItem,
                          decoration: const InputDecoration(
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

        Obx(() => controller.searchQuery.isNotEmpty?Padding(
          padding:  const EdgeInsets.only(top: 70),
          child: Expanded(
            child: Padding(
              padding:  const EdgeInsets.symmetric(horizontal: 30),
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: controller.filteredList.length,
                separatorBuilder: (BuildContext context, int index) => const Divider(),
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    focusColor: Colors.grey,
                    title: Text( controller.filteredList[index].emailId),
                  );
                },
              ),
            ),
          ),
        ):const SizedBox())
      ],
    );
  }




//Here is Body with email static email list
  Widget getBody() {
    final EmailController emailController = Get.put(EmailController());
    return GetBuilder<EmailController>(
      builder: (controller) {
        return ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: emailController.emailBody.length,
          itemBuilder: (BuildContext context, int index) {
            final email = emailController.emailBody[index].emailId;
            final emailBody = emailController.emailBody[index].emailBody;
            final emailSubject = emailController.emailBody[index].subject;
            final isStarred = emailController.isStarred(index);

            Map<String, dynamic> arguments = {
              "email": email,
              "emailBody": emailBody,
              "subject": emailSubject,
            };

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: getProfileWithInitialLetter(text: email),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getRegularBodyText(
                      text: splitNameEmail(email),
                      fontWeight: FontWeight.bold,
                    ),
                    getRegularBodyText(
                      text: emailSubject,
                      fontSize: 13.0,
                    ),
                  ],
                ),
                trailing: Column(
                  children: [
                    getRegularBoldText(
                      text: "Sep 30 ",
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0
                    ),
                    InkWell(
                      onTap: () {
                        print('Star icon tapped for index $index');
                        emailController.toggleStarIcon(index);
                      },
                      child: Icon(
                        isStarred ? Icons.star : Icons.star_border,
                        color: isStarred ? Colors.yellow : Colors.grey,
                      ),
                    ),
                  ],
                ),
                onTap: ()=>Get.toNamed(Routes.EMAILBODY_SCREEN, arguments: arguments),
              ),
            );
          },
        );
      },
    );
  }

}

