import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:products_app/modules/Product_List/productList.dart';
import 'package:products_app/shared/commponets/commponets.dart';

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  var ratingvalue = 0.0;
  var description = TextEditingController();
  var numrate = 22;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      endDrawer: Drawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.only(bottom: 8),
              child: Container(
                height: 200.0,
                decoration: BoxDecoration(color: Colors.white),
                child: Stack(
                  alignment: Alignment.topLeft,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 400.0,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 2),
                      ),
                      items: [
                        'assets/2.png',
                        'assets/3.png',
                        'assets/4.png',
                        'assets/5.png',
                      ].map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(),
                                child: Image(
                                  image: AssetImage(i),
                                ));
                          },
                        );
                      }).toList(),
                    ),
                    // Container(
                    //   width: double.infinity,
                    //     child: Image(image:AssetImage('assets/2.png') ,)),
                    InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                              decoration: BoxDecoration(
                                color: Colors.blueGrey[100],
                                shape: BoxShape.circle,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Icon(
                                  Icons.add,
                                  size: 25,
                                ),
                              )),
                        )),
                    //tor2 ll icon add
                    // Padding(
                    //   padding: const EdgeInsets.all(15.0),
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //       shape:BoxShape.circle,
                    //       color: Colors.grey[400],
                    //
                    //     ),
                    //       // height:30 ,
                    //       // width: 30,
                    //       child: Padding(
                    //         padding: const EdgeInsets.all(1.0),
                    //         child: FlatButton(onPressed: (){}, child: Icon(Icons.add )),
                    //       )),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.all(15.0),
                    //   child: FloatingActionButton(onPressed: (){} ,child: Text('+' ,style: TextStyle(fontSize: 25 ), ) , backgroundColor: Colors.blueGrey,),
                    // ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(bottom: 10),
              child: Container(
                  height: 150.0,
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.only(
                              top: 13, bottom: 8),
                          child: Text(
                            "DeFacto",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.blueGrey[700],
                                fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2),
                          child: Text(
                            "Pumpkin Berry Bby Lace Petti Romper Tutu \nClothing HeadBand Set",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(top: 2),
                          child: Row(
                            children: [
                              RatingBar.builder(
                                itemSize: 18,
                                initialRating: 3,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 2.0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                  ratingvalue = rating;
                                  setState(() {});
                                },
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Text(
                                '$ratingvalue',
                                style: TextStyle(color: Colors.grey[600]),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(
                            top: 8,
                          ),
                          child: Row(
                            children: [
                              Text(
                                'EGP 517.00',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                    fontSize: 20),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text('EGP 730.00',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    decoration: TextDecoration.lineThrough,
                                  )),
                              // SizedBox(width: 30,),
                              Spacer(),
                              Text('Avaliability: 8 items',
                                  style: TextStyle(
                                      color: Colors.green[400],
                                      fontWeight: FontWeight.w400)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(bottom: 8),
              child: Container(
                  height: 95,
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Color',
                          style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(top: 10),
                          child: Row(
                            children: [
                              defultButton(
                                  text: 'Black',
                                  padding: 3.0,
                                  textcolor: Colors.black,
                                  buttonColor: Colors.grey[200],
                                  borderadius: 3.0,
                                  function: () {},
                                  width: 100.0,
                                  hieght: 40.0),
                              defultButton(
                                  text: 'Red',
                                  padding: 10.0,
                                  textcolor: Colors.black,
                                  borderadius: 3.0,
                                  buttonColor: Colors.grey[200],
                                  function: () {},
                                  width: 100.0,
                                  hieght: 40.0),
                              defultButton(
                                  text: 'Grey',
                                  padding: 10.0,
                                  textcolor: Colors.black,
                                  borderadius: 3.0,
                                  buttonColor: Colors.grey[200],
                                  function: () {},
                                  width: 100.0,
                                  hieght: 40.0),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(bottom: 8),
              child: Container(
                  height: 85,
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(
                        top: 8, bottom: 8, start: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.only(top: 10),
                          child: Row(
                            children: [
                              Container(
                                child: Center(
                                    child: Text(
                                  ' qty \n   1',
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700),
                                )),
                                width: 35,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: Colors.grey, width: 2)),

                                // child: FlatButton(
                                //   onPressed:(){},
                                //   child:Text('qty\n 1',style: TextStyle(fontSize: 11 ,color:Colors.black),) ,)
                              ),
                              // defultButton(text:'qty\n 1',padding: 3.0,textcolor:Colors.black,
                              //     buttonColor: Colors.grey[200] ,borderadius: 0.0, function: (){},width: 50.0,hieght: 50.0 ),

                              Expanded(
                                child: defultButton(
                                    text: 'ADD TO CART',
                                    padding: 10.0,
                                    textcolor: Colors.white,
                                    borderadius: 1.0,
                                    buttonColor: Colors.indigo[700],
                                    function: () {
                                      NavigateTo(
                                          context: context,
                                          rout: ProductList());
                                    },
                                    width: 312.0,
                                    hieght: 40.0),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(bottom: 8),
              child: Container(
                  height: 70,
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Chick also',
                          style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'product soon...',
                          style: TextStyle(
                              color: Colors.grey[900],
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),

                        //  TextFormField(
                        //   controller: description,
                        //   decoration: InputDecoration(
                        //     hintText:'product soon...',
                        //     border:InputBorder.none,
                        //   ),
                        //   keyboardType: TextInputType.text,
                        //
                        // )
                      ],
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(bottom: 0),
              child: Container(
                  decoration: BoxDecoration(color: Colors.white),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RatingBar.builder(
                          itemSize: 25,
                          initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 0.5),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                            // ratingvalue = rating ;
                            setState(() {});
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Rate This Prduct',
                          style: TextStyle(
                              color: Colors.grey[900],
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'write Review',
                          style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),

                        TextFormField(
                          controller: description,
                          decoration: InputDecoration(
                            hintText: 'Write You Review Here...',
                          ),
                          keyboardType: TextInputType.text,
                        ),
                        // Spacer(),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            defultButton(
                                width: 100.0,
                                hieght: 40.0,
                                buttonColor: Colors.indigo[700],
                                textcolor: Colors.white,
                                text: 'Submit',
                                borderadius: 2.0,
                                function: () {},
                                padding: 0.0),
                          ],
                        ),
                        // Padding(
                        //   padding: const EdgeInsetsDirectional.only(start:277.0),
                        //   child: defultButton(width: 100.0,hieght: 40.0,buttonColor: Colors.indigo[700],textcolor: Colors.white,
                        //       text: 'Submit',borderadius: 2.0,function: (){} ,padding: 0.0),
                        // ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Reviews($numrate)',
                          style: TextStyle(
                              color: Colors.grey[900],
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RatingBar.builder(
                          itemSize: 25,
                          initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 0.5),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                            // ratingvalue = rating ;
                            setState(() {});
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),

                      ],
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(0.0),

              child: Container(
                decoration: BoxDecoration(color: Colors.white),
                child: ListView.separated(

                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (BuildContext context, int index) => Container(
                    height: 1,
                    color: Colors.grey[400],
                    margin: EdgeInsetsDirectional.only(top: 10 ,bottom: 10) ,
                  ),

                  itemBuilder: (BuildContext context, int index) => Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/6.png'),
                        //backgroundColor: Colors.indigo,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Esraa AbdEllatif',
                                  style: TextStyle(
                                      color: Colors.grey[900],
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600),
                                ),
                                // SizedBox(height: 10,),
                                Spacer(),
                                RatingBar.builder(
                                  itemSize: 22,
                                  initialRating: 3,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemPadding:
                                      EdgeInsets.symmetric(horizontal: 0.5),
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                    // ratingvalue = rating ;
                                    setState(() {});
                                  },
                                ),
                              ],
                            ),
                            Container(
                              height: 1,
                              color: Colors.grey[400],

                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Focused and remember we design the best WordPress News and Magazine Themes . its the ons closest to you that wan to see you fail.',
                              style: TextStyle(
                                  color: Colors.grey[900],
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  itemCount: 22,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
