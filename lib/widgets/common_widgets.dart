import 'package:flutter/material.dart';

import '../screens/common_methords.dart';


//common text with following properties
Text getRegularBodyText({text, fontWeight,fontSize,fontColor,textAlign}){
  return Text(text,style: TextStyle(fontSize:fontSize?? 18.0,fontWeight: fontWeight,overflow:TextOverflow.ellipsis,color: fontColor??Colors.black,),textAlign: textAlign,);
}

Text getRegularBoldText({text, fontWeight, fontSize, fontStyle,fontColor}){
  return Text(
    text,
    maxLines: 2,
    style: TextStyle(fontSize: fontSize??18.0,fontWeight: FontWeight.bold,fontStyle: fontStyle,color: fontColor??Colors.black,overflow:TextOverflow.ellipsis,),);
}

SizedBox getHeight({height}){
  return SizedBox(height: height??10.0,);
}

SizedBox getWidth({width}){
  return SizedBox(width: width??10.0,);
}

Widget getProfileWithInitialLetter({text}){
  return CircleAvatar(
      radius: 30,
      backgroundColor: Colors.orange,
  child: getRegularBoldText(text: getEmailInitials(text), fontColor: Colors.white));
}