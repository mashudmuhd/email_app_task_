import 'package:email_app_task/controller/experimental_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ExperiementScreen extends StatelessWidget {
  const ExperiementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ExperimentalScreenController  controller = Get.put(ExperimentalScreenController());
    return Scaffold(
      body: ListView.builder(
        itemCount: controller.userList.length,
        itemBuilder: (context, index) {

          return ListTile(
            title: Text('${controller.userList[index]}'),
          );
        },
      ),
    );
  }
}
