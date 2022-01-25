
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:products_app/shared/commponets/commponets.dart';

class Signupscreen extends StatefulWidget {
  @override
  _SignupscreenState createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  var emailcontroller = TextEditingController();

  var passcontroller = TextEditingController();
  var  phonecontroller = TextEditingController();
  var namecontroller = TextEditingController();
 var addresscontroller = TextEditingController();

  bool _secirty =true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.grey[900]  ,opacity: .6),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(17.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text('SingUp',style:  maintext30().copyWith(color: Colors.grey[700]),),
              SizedBox(height: 50,),

              TextFormField(
                validator: (value) {
                  if (value == TextInputType.text ) {
                    return 'Please Enter Correct Name';
                  }
                  return null;
                },
                controller: namecontroller ,
                keyboardType: TextInputType.text,
                maxLength: 30,
                decoration: InputDecoration(
                  hintText: 'Enter your Name',
                  labelText: 'Name',
                  labelStyle: TextStyle(
                    fontSize: 18,),
                  // border: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(5),
                  // )
                ),
              ),
              SizedBox(height: 5,),
              TextFormField(
                validator: (value) {
                  if (!value.contains('@')) {
                    return 'Not A vaild Email';
                  }
                  return null;
                },
                controller: emailcontroller ,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(

                    hintText: 'ex.abc@gmail.com',
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      fontSize: 18,
                      // color: Colors.grey[700],
                    )
                  // border: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(5),
                  // )
                ),
              ),
              SizedBox(height: 5,),
              TextFormField(
                validator: (value) {
                  if (value.length<9 ) {
                    return 'Please Enter Correct Password';
                  }
                  return null;
                },
                controller: passcontroller ,
                keyboardType: TextInputType.visiblePassword,
                obscureText:_secirty,
                maxLength: 8,
                decoration: InputDecoration(
                  hintText: 'Enter Password',
                  labelText: 'Password',
                  suffix:IconButton(icon: Icon(Icons.remove_red_eye), onPressed: (){
                    setState(() {
                      _secirty = !_secirty;
                    });

                  }),
                  labelStyle: TextStyle(
                    fontSize: 18,),
                  // border: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(5),
                  // )
                ),
              ),
              SizedBox(height: 5,),
              TextFormField(
                validator: (value) {
                  if (value == TextInputType.number ) {
                    return 'Please Enter Vaild phone';
                  }
                  return null;
                },
                controller: phonecontroller ,
                keyboardType: TextInputType.number,
                maxLength: 12,
                decoration: InputDecoration(
                  hintText: 'Enter your Phone',
                  labelText: 'Phone',
                  labelStyle: TextStyle(
                    fontSize: 18,),
                  // border: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(5),
                  // )
                ),
              ),
              SizedBox(height: 5,),
              TextFormField(
                validator: (value) {
                  if (value == TextInputType.streetAddress ) {
                    return 'Please Enter Vaild Adress';
                  }
                  return null;
                },
                controller: addresscontroller ,
                keyboardType: TextInputType.streetAddress,
                maxLength: 12,
                decoration: InputDecoration(
                  hintText: 'Enter your Address',
                  labelText: 'Address',
                  labelStyle: TextStyle(
                    fontSize: 18,),
                  // border: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(5),
                  // )
                ),
              ),
              SizedBox(height: 30,),
              defultButton(text: 'Sing Up' ,
                  textcolor:Colors.grey[100],
                 buttonColor: Colors.indigo ,
                 borderadius: 10.0,

                 // colorbutton: Colors.indigo ,
                  padding: 35.0 ,
                  //shadowcolor: Colors.grey[900].withOpacity(.6),
                  //blurRadius:10.0,
                  width: double.infinity,
                  function: (){
                    Fluttertoast.showToast(
                        msg: 'welcome ${namecontroller.text}',
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.blueGrey,
                        textColor: Colors.white,
                        fontSize: 16.0
                    );
                  }
              ) ,
          ],),
        ),
      ),
    );
  }
}
