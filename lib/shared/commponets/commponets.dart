import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget defultButton({text  ,padding ,textcolor ,buttonColor,width,hieght,borderadius ,function}) => Padding(
padding: EdgeInsets.symmetric(horizontal: padding),
child: Container(
width: width,
height: hieght,
decoration: BoxDecoration(
color: buttonColor, borderRadius: BorderRadius.circular(borderadius),
),
child: FlatButton(
  onPressed:function,
child:Text( text ,style: TextStyle(fontSize: 15 ,color:textcolor),) ,)),
);

void NavigateTo({context ,rout}) => Navigator.push(context, MaterialPageRoute(builder:(BuildContext context)=>rout));
TextStyle maintext30() =>TextStyle(
  color: Colors.grey[900] ,
  fontSize: 30,
  fontWeight: FontWeight.w500,
  fontStyle: FontStyle.italic,
);
