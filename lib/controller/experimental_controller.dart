import 'dart:convert';
import 'dart:isolate';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ExperimentalScreenController extends GetxController{
  List<UserData> userList = [];
  bool isLoading = false;
  int currentPage = 1;


  Future<List<UserData>>getUsers()async{

    final jsonFile = await rootBundle.loadString("assets/data.json");

    final List<UserData> userList = [];

    for(final item in jsonDecode(jsonFile)as List<dynamic>){
      userList.add(UserData.fromJson(item));
    }

    return userList;

  }


  Future<List<UserData>>loadMore()async{
    final currentPage = Get.find<ExperimentalScreenController>().currentPage;
    final usersNewList = await getUsers();
    Get.find<ExperimentalScreenController>().userList.addAll(usersNewList);
    Get.find<ExperimentalScreenController>().currentPage++;
    return usersNewList;
  }


}


class UserData {
  int id;
  String name;
  int age;
  String gender;
  String occupation;

  UserData({
    required this.id,
    required this.name,
    required this.age,
    required this.gender,
    required this.occupation,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'],
      name: json['name'],
      age: json['age'],
      gender: json['gender'],
      occupation: json['occupation'],
    );
  }
}
