import 'package:flutter/material.dart';
import 'package:products_app/modules/HomeScreen/home.dart';
import 'package:products_app/modules/Product_List/productList.dart';
import 'package:products_app/modules/loginscreen/loginscreen.dart';
import 'package:products_app/modules/productScreen/productScreen.dart';
import 'package:products_app/modules/waiting_Screen/waItingScreen.dart';
import 'package:products_app/shared/commponets/commponets.dart';


class WelcomeScreen extends StatefulWidget {
  @override

  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  var currentindex =0;
  List Screen=[
    HomeScreen(),
    ProductScreen(),
    WaitingScreen(),
    Loginscreen(),

  ];
  List Titles=[
    AppBar(
      //leading: Icon(Icons.shopping_cart),
      backgroundColor: Colors.indigo,
      title: Text('E-Commerce'),

      actions: [
        IconButton(
          icon: Icon(Icons.person ),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {},
        ),
      ],
    ),
    AppBar(
      backgroundColor: Colors.indigo,
      title: Text('Product title'),
      //leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: () {}),
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.bookmark),
          onPressed: () {},
        ),
      ],

    ),
    AppBar(
      backgroundColor: Colors.indigo,
      title: Text('Waiting User'),
      actions: [
        IconButton(
          icon: Icon(Icons.view_list),
          onPressed: () {},
        ),
      ],

    ),
    AppBar(
      backgroundColor: Colors.indigo,
      title: Text('Login'),
      actions: [
        IconButton(
          icon: Icon(Icons.person_add_alt_1_sharp),
          onPressed: () {


         // NavigateTo(context:context, rout: Loginscreen());
          },
        ),
      ],

    ),
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: Titles[currentindex],
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(accountName: Text('Esraa Abdellatif' ), accountEmail: Text('esraa.abd.a99@gmail.com'),
              currentAccountPicture: CircleAvatar(radius: 25, backgroundImage: AssetImage('assets/6.png'),),
              decoration: BoxDecoration(color: Colors.indigo),
            otherAccountsPictures: [CircleAvatar( backgroundImage: AssetImage('assets/6.png'),),
            ],),
            ListTile(
              onTap: (){},title: Text('Home',style: TextStyle(fontSize: 20 ,color: Colors.grey[900]),),trailing: Icon(Icons.arrow_forward_ios_rounded),
              leading:  Icon(Icons.home_sharp),),
            ListTile(
              onTap: (){},title: Text('Product',style: TextStyle(fontSize: 20 ,color: Colors.grey[900]),),leading:  Icon(Icons.shopping_cart),
              trailing: Icon(Icons.arrow_forward_ios_rounded),),
            ListTile(
              onTap: (){},title: Text('Saved Product',style: TextStyle(fontSize: 20 ,color: Colors.grey[900]),),leading:  Icon(Icons.bookmark_outline),
              trailing: Icon(Icons.arrow_forward_ios_rounded),),
            ListTile(
              onTap: (){},title: Text('Setting',style: TextStyle(fontSize: 20 ,color: Colors.grey[900]),),leading:  Icon(Icons.settings),
              trailing: Icon(Icons.arrow_forward_ios_rounded),),
             Container(height: 1,color: Colors.grey[400],),
            ListTile(
              onTap: (){},title: Text('Signup',style: TextStyle(fontSize: 20 ,color: Colors.grey[900]),),leading:  Icon(Icons.login),
              trailing: Icon(Icons.arrow_forward_ios_rounded),),
            ListTile(
              onTap: (){},title: Text('About',style: TextStyle(fontSize: 20 ,color: Colors.grey[900]),),leading:  Icon(Icons.info_rounded),
              trailing: Icon(Icons.arrow_forward_ios_rounded),),

          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon:Icon(Icons.home_outlined) ,label:'Home',),
          BottomNavigationBarItem(icon:Icon(Icons.shopping_cart) ,label:'Product'),
          BottomNavigationBarItem(icon:Icon(Icons.list_alt) ,label:'Waiting User'),
         BottomNavigationBarItem(icon:Icon(Icons.login) ,label:'Login'),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: currentindex,
        onTap:(index){
          currentindex=index;
          setState(() {

          });
        },

      ),
      // bottomNavigationBar: MotionTabBar(
      //   icons: [ Icons.home_outlined,Icons.add_shopping_cart_sharp,Icons.list_alt ,Icons.login,],
      //   labels: ['Home','Product','Waiting User','Login'],
      //   initialSelectedTab: "Home",
      //   tabIconColor: Colors.indigo,
      //   tabSelectedColor: Colors.indigo,
      //   textStyle: TextStyle(color: Colors.black),
      //   onTabItemSelected:(index){
      //     currentindex=index;
      //     setState(() {
      //
      //     });
      //   },
      //
      // ),

      body: Screen[currentindex],
    );
  }
}
