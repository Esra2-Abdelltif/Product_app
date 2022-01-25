
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:products_app/modules/loginscreen/loginscreen.dart';
import 'package:products_app/modules/signupscreen/signupscreen.dart';
import 'package:products_app/shared/commponets/commponets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
     // appBar:null,
      body:
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40,),
            Text('Welcome',style:  maintext30().copyWith(fontStyle: FontStyle.italic),),
            SizedBox(height: 15,),
            Text('Enjoy the Experience ',style: TextStyle(
              color: Colors.grey[400] ,
              fontSize: 20,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
            ),),
            SizedBox(height: 70,),
            Image(image:AssetImage('assets/1.png') ,),
            SizedBox(height: 70,),
            defultButton(text: 'Login' ,
              textcolor:Colors.grey[100],
              buttonColor: Colors.indigo  ,
             borderadius: 10.0,
              padding: 60.0 ,
              //shadowcolor: Colors.grey[900].withOpacity(.6),
              //blurRadius:10.0,
              width: double.infinity,
              function: (){
                NavigateTo(context: context , rout: Loginscreen());

              }
            ) ,

            SizedBox(height: 15,),
            defultButton(text: 'signup' ,
                textcolor: Colors.grey[600],
               // shadowcolor: Colors.grey[300].withOpacity(.3),
                padding: 0.0,
                //blurRadius: 2.0,colorbutton: Colors.white,
                function: (){
              NavigateTo(context: context , rout: Signupscreen());
                }
            ),




          ],
        ),
      ),

    );
  }
}
