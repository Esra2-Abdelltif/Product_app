
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:products_app/modules/productScreen/productScreen.dart';
import 'package:products_app/shared/commponets/commponets.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('item'),
        actions: [
          IconButton(
            icon: Icon(Icons.playlist_add),
            onPressed: () {},
          ),
        ],

      ),
     // endDrawer: Drawer(),
      body:
      ListView.separated(
        physics: BouncingScrollPhysics(),
        //physics: NeverScrollableScrollPhysics(),

        itemBuilder: (BuildContext context, int index) =>
          InkWell(
            onTap: (){
              if(index==2)
                NavigateTo(context: context ,rout: ProductScreen());
            },
            child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/7.png'),
                    //backgroundColor: Colors.indigo,
                  ),
                  CircleAvatar(radius: 10, child: Text('1'),backgroundColor: Colors.red,),

                ],
              ),
              SizedBox(width: 10.0,),
              Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                children: [
                  Text('Esraa AbdEllatif',style: TextStyle(color: Colors.grey[700] ,fontSize: 18,fontWeight: FontWeight.w600), ),
                  SizedBox(height: 10,),
                  Text('Massage Body',style: TextStyle(color: Colors.grey ,fontSize: 18,fontWeight: FontWeight.w400),),

                ],),


            ],
        ),
      ),
          ),
        itemCount: 10,
        separatorBuilder: (BuildContext context, int index) => Container(height: 1,color: Colors.grey[400],),),

    );
  }
}