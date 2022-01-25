import 'dart:ffi';

import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:products_app/shared/commponets/commponets.dart';
import 'package:sqflite/sqflite.dart';

class WaitingScreen extends StatefulWidget {
  @override
  _WaitingScreenState createState() => _WaitingScreenState();
}

class _WaitingScreenState extends State<WaitingScreen> {
  //get description => null;
  var Namecontroller = TextEditingController();
  var phonecontroller = TextEditingController();
  var database;
  List list=[];
  //List list= new List();
@override
  void initState() {
    // TODO: implement initState
    super.initState();
   createDataBase().then((value) {
     if (value != null)
     database=value;
     getUser(database: value).then((value) {
       list=value;
       setState(() {
       });
       print(value);
     });
   });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConditionalBuilder(builder: (BuildContext context) =>
          ListView.separated(itemBuilder: (BuildContext context, int index) =>
              InkWell(
                  onTap:(){
            showDialog<void>(
              context: context,
              barrierDismissible: false, // user must tap button!
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Update User'),
                  content: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextFormField(
                          controller: Namecontroller,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText:'Enter Name',
                            labelText: 'User Name',
                            border:OutlineInputBorder(
                                borderRadius: BorderRadius.circular(3.0)
                            ),
                          ),

                        ),
                        SizedBox(height: 10,),
                        TextFormField(
                          controller: phonecontroller,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            hintText:'Enter phone',
                            labelText: 'Phone',
                            border:OutlineInputBorder(
                                borderRadius: BorderRadius.circular(3.0)
                            ),
                          ),

                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            defultButton(text: 'Update',textcolor: Colors.white,buttonColor: Colors.indigo,hieght: 40.0,width: 100.0,padding: 25.0,borderadius:4.0,
                                function: (){
                                  String name=  Namecontroller.text;
                                  String phone =phonecontroller.text;
                                  updateUser(database :database, name :name, phone:phone ,id: list[index]['id']).then((value) {
                                    Namecontroller.text ="";
                                    phonecontroller.text='';
                                    Navigator.pop(context);
                                    getUser(database: database).then((value) {
                                      list=value;
                                      setState(() {
                                      });
                                    });
                                    print("user update");
                                  });
                                }),
                            defultButton(text: 'Delete',textcolor: Colors.white,buttonColor: Colors.indigo,hieght: 40.0,width: 100.0,padding: 25.0,borderadius:4.0,
                                function: (){
                                  deleteUser(database: database,id: list[index]['id']).then((value) {
                                    getUser(database: database).then((value) {
                                      list=value;
                                      setState(() {
                                      });
                                    });
                                    print("user Deleted");
                                  });
                                }),


                          ],
                        ),
                        SizedBox(height: 10,),
                        Center(
                          child: defultButton(text: 'Cancle',textcolor: Colors.white,buttonColor: Colors.indigo,hieght: 40.0,width: 100.0,padding: 25.0,borderadius:4.0,
                              function: (){
                                Navigator.pop(context);
                              }),
                        ),
                      ],
                    ),

                  ),

                );
              },
            );
          },child: UserList(list[index])),
          separatorBuilder: (BuildContext context, int index) => Container(height: 1,color: Colors.grey[400],),
          itemCount: list.length),
        condition: list.length >0,
        fallback:(ctx)=> Center(child: CircularProgressIndicator()),),


      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showDialog<void>(
              context: context,
              barrierDismissible: false, // user must tap button!
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Add User'),
                  content: SingleChildScrollView(
                    child: Column(
                      children: [
                         TextFormField(
                           controller: Namecontroller,
                           keyboardType: TextInputType.text,
                           decoration: InputDecoration(
                             hintText:'Enter Name',
                             labelText: 'User Name',
                             border:OutlineInputBorder(
                               borderRadius: BorderRadius.circular(3.0)
                             ),
                           ),

                         ),
                        SizedBox(height: 10,),
                        TextFormField(
                          controller: phonecontroller,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            hintText:'Enter phone',
                            labelText: 'Phone',
                            border:OutlineInputBorder(
                                borderRadius: BorderRadius.circular(3.0)
                            ),
                          ),

                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            defultButton(text: 'Add',textcolor: Colors.white,buttonColor: Colors.indigo,hieght: 40.0,width: 100.0,padding: 25.0,borderadius:4.0,
                                function: (){
                              String name=  Namecontroller.text;
                              String phone =phonecontroller.text;
                              insertUser(database :database, name :name, phone:phone).then((value) {
                                Namecontroller.text ="";
                                phonecontroller.text='';
                                Navigator.pop(context);
                                getUser(database: database).then((value) {
                                  list=value;
                                  setState(() {

                                  });
                                });


                                print("user insert");
                              });

                                }),
                            defultButton(text: 'Cancel',textcolor: Colors.white,buttonColor: Colors.indigo,hieght: 40.0,width: 100.0,padding: 25.0,borderadius:4.0,
                                function: (){
                              Navigator.pop(context);
                                }),


                          ],
                        ),


                      ],
                    ),

                  ),

                );
              },
            );
          },
        child:Icon(Icons.edit ),backgroundColor: Colors.indigo,),
    );
  }

Widget UserList(Map item) => Padding(
  padding: const EdgeInsets.all(12.0),
  child: Row(
    children: [
      Row(
        children: [
          CircleAvatar(
            radius: 30,
            child: Text('${item['id']}', style: TextStyle(fontSize: 25),),
            //backgroundImage: AssetImage('assets/6.png'),
            //backgroundColor: Colors.indigo,
          ),
        ],
      ),
      SizedBox(width: 10.0,),
      Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        children: [
          Text('${item['name']}',style: TextStyle( color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600), ),
          SizedBox(height: 7,),
          Text('${item['name']}',style: TextStyle(color: Colors.grey[900] ,fontSize: 18,fontWeight: FontWeight.w400),),

        ],),


    ],
  ),
);
Future<Database>createDataBase () async {
  return await openDatabase('Waiting.DB', version: 1,
      onCreate: (db, version) async {
        // When creating the db, create the table
        print('cearte DataBase');
        await db.execute(
            'CREATE table waiting (id INTEGER PRIMARY KEY, name TEXT, phone TEXT)')
            .then((value) => print('Table Created'));
      },
      onOpen: (db) {
        print('DataBase opened');
      });


}
Future<Void> insertUser({@required database , String name , String phone}) async{
    await database.transaction((txn) async {
      await txn.rawInsert(
          'INSERT INTO waiting(name,  phone ) VALUES("$name", "$phone")');
    });
  }
Future<List<Map>> getUser({@required  database})async{
   return await database.rawQuery('SELECT * FROM waiting');
    //print("");
  }
Future<void> updateUser({@required database , String name , String phone ,int id })async{
return await database.rawUpdate(
    'UPDATE waiting SET name = ?, phone = ? WHERE id = ?',
    ["$name", "$phone" ,id]);


}
Future<void>deleteUser({database , id})async{
  return await database
      .rawDelete('DELETE FROM  waiting WHERE id = ?', [id]);

}





}
