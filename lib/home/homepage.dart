import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cor/DrawerFood2.dart';
import 'package:flutter_cor/NavigationDrawerWidget.dart';
import 'package:flutter_cor/ProductOverview.dart';
import 'package:flutter_cor/search/search.dart';

import '../Colors.dart';
import 'Single_product.dart';


class HomePage extends StatefulWidget {


  @override
  _HomePageState createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {

  List notes =[
    {"note" : "the product 1",
      "image" :"images/m1.jpeg" },
    {"note" : "the product 2",
      "image" :"images/m2.jpg"
    },
    {"note":"the product 3",
      "image" :"images/m3.jpg"
    },
    {"note" : "the product 4",
      "image" :"images/m4.jpg"
    },
  ];


  getUser(){
  var user = FirebaseAuth.instance.currentUser ;
  print(user.email);
  }

  @override
  void initState() {
    getUser();
    super.initState();
  }



  Widget legumesProducets(){

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6,),
      width: 160,height: 220,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 2 ,
              child: Image.asset("images/p3.png")),
          Expanded(flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('beans',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold,letterSpacing: 1),),
                    Text('40\$/50 Gram',style: TextStyle(fontSize: 14,color: Colors.grey)),
                    Row(

                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 5),
                            width: 50,height: 30,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Expanded(flex: 4,child: Text("50 Gram")),
                                Expanded(flex: 1,child: Icon(Icons.arrow_drop_down,size: 20,color: Color(0XFFF6AE2D),))
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 5,),
                        Expanded(
                          child: Container(
                            width: 50,height: 30,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.remove,size: 18,color: Color(0XFFF6AE2D)),
                                Text('1',style: TextStyle(color: Color(0XFFF6AE2D),fontWeight: FontWeight.bold),),
                                Icon(Icons.add,size: 18,color: Color(0XFFF6AE2D)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )



                    // Container(height: 25,width: 100,child: OutlineButton(child: Row(
                    //  children: [

                    //   ],
                    // ),onPressed: (){})),
                    //

                  ],
                ),
              )
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context)  {

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
    backgroundColor: Color(0XFFF7F7FF),
        appBar: AppBar(
          actions: [
            CircleAvatar(radius: 12,
              backgroundColor: Color(0XFFD9E5D6),
            child: IconButton(
            onPressed: (){
              Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context)=> Search(),));
            },
            icon:Icon(Icons.search,
            size: 17,
            color: Colors.black,)),),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: CircleAvatar(radius: 12,
                  backgroundColor: Color(0XFFD9E5D6),
                child: Icon(Icons.shop,size: 17,color: Colors.black,),),
            ),
          ],
          iconTheme: IconThemeData(color: Color(0XFF000501),),
          title: Text('Home Page',style: TextStyle(color: Color(0XFF000501),fontSize: 20),),
          backgroundColor: Color(0xff51BBFE),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          child: Icon(Icons.add),
          onPressed: (){
            Navigator.of(context).pushReplacementNamed("addproduct");
          },),
        drawer: DrawerFood(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          child: ListView(
            children: [

              // one Widget for Column
              Container(
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit :BoxFit.cover,
                      image:AssetImage( "images/FoodProductTop.png")),
                    color: Colors.black,
                  borderRadius: BorderRadius.circular(20)
                ),
                  child: Row(
                    children: [

                      Expanded(
                        flex: 2,
                        child: Container(
                        child: Column(
                          children: [

                            Padding(
                              padding: const EdgeInsets.only(right: 140,bottom: 10),
                              child: Container(
                                height: 60,width: 150,
                                decoration: BoxDecoration(
                                  color: Color(0XFFF6AE2D),
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(40),
                                    bottomLeft: Radius.circular(40)
                                  )
                                ),

                                child: Center(child: Text("AL ALi "
                                    " Market",style: TextStyle(
                                  fontSize: 14,color: Color(0XFF2274A5),
                                  shadows: [
                                    BoxShadow(
                                      color: Colors.white70,
                                      blurRadius: 10,
                                      offset: Offset(3,3),
                                    )
                                  ],
                                ),
                                ),),
                              ),
                            ),
                            Text('30 Off',
                            style: TextStyle(fontSize: 40,
                            color: Colors.green[100],
                            fontWeight: FontWeight.bold),),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text('all products',
                                style: TextStyle(fontSize: 22,
                                    color: Colors.green[100],
                                    ),),
                            ),
                          ],
                        ),
                        ),
                      ),
                      Expanded(child: Container(),),
                    ],
                  ),
              ),
                     //..............................................
                // tow Widget for column
              SizedBox(height: 10,),
               Padding(
                 padding: const EdgeInsets.symmetric(vertical: 5),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text('legumes',style: TextStyle(fontSize: 22 ,letterSpacing: 1.3,fontWeight: FontWeight.bold),),
                     Text('view all',style: TextStyle(fontSize: 18,color: Colors.grey),),
                   ],
                 ),
               ),
                    //................................................
                   //three Widget for column
              SizedBox(height: 10,),
             SingleChildScrollView(
               scrollDirection: Axis.horizontal,
               child: Row(
                 children: [
                   SingleProduct(
                     onTap:(){
                       Navigator.of(context).push(MaterialPageRoute(
                         builder: (context)=>ProductOverview(productImage:"images/p3.png",
                             productName:"Bans"),));
                     },
                       productImage:"images/p3.png",
                       productName:"Bans"
                   ),

                   SingleProduct(
                       onTap:(){
                         Navigator.of(context).push(MaterialPageRoute(
                           builder: (context)=>ProductOverview
                             (   productImage:"images/p4.png",
                               productName:"Red Bans"),));
                       },
                       productImage:"images/p4.png",
                       productName:"Red Bans"

                   ),

                   SingleProduct(
                       onTap:(){
                         Navigator.of(context).push(MaterialPageRoute(
                           builder: (context)=>ProductOverview
                             (productImage:"images/p5.png",
                               productName:"Pistachios"),));
                       },
                       productImage:"images/p5.png",
                       productName:"Pistachios"
                   ),

                 ],
               ),
             ),
              //.........................................................
              SizedBox(height: 10,),

           //four widget for  column
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('vegetables',style: TextStyle(fontSize: 22 ,letterSpacing: 1.3,fontWeight: FontWeight.bold),),
                    Text('view all',style: TextStyle(fontSize: 18,color: Colors.grey),),
                  ],
                ),
              ),
              //................................................
              SizedBox(height: 10,),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SingleProduct(
                        onTap:(){
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context)=>ProductOverview
                              (productImage:"images/v8.png",
                                productName:"Cucumbers"),));
                        },
                        productImage:"images/v8.png",
                        productName:"Cucumbers"
                    ),

                    SingleProduct(
                        onTap:(){
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context)=>ProductOverview
                              (productImage:"images/v7.png",
                                productName:"Potatoes"),));
                        },
                        productImage:"images/v7.png",
                        productName:"Potatoes"

                    ),

                    SingleProduct(
                        onTap:(){
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context)=>ProductOverview
                              (productImage:"images/v6.png",
                                productName:"Tomatoes"),));
                        },
                        productImage:"images/v6.png",
                        productName:"Tomatoes"
                    ),

                  ],
                ),
              ),

              //..................................................
                SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Fresh Fruits',style: TextStyle(fontSize: 22 ,letterSpacing: 1.3,fontWeight: FontWeight.bold),),
                    Text('view all',style: TextStyle(fontSize: 18,color: Colors.grey),),
                  ],
                ),
              ),
              //................................................
              SizedBox(height: 10,),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SingleProduct(
                        onTap:(){
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context)=>ProductOverview
                              (productImage:"images/v3.png",
                                productName:"Watermelons"),));
                        },
                        productImage:"images/v3.png",
                        productName:"Watermelons"
                    ),

                    SingleProduct(
                        onTap:(){
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context)=>ProductOverview
                              (productImage:"images/v4.png",
                                productName:"Freezes"),));
                        },
                        productImage:"images/v4.png",
                        productName:"Freezes"

                    ),

                    SingleProduct(
                        onTap:(){
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context)=>ProductOverview
                              (productImage:"images/v5.png",
                                productName:"Bananas"),));
                        },
                        productImage:"images/v5.png",
                        productName:"Bananas"
                    ),

                    SingleProduct(
                        onTap:(){
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context)=>ProductOverview
                              (productImage:"images/g1.png",
                                productName:"Grapes"),));
                        },
                        productImage:"images/g1.png",
                        productName:"Grapes"
                    ),
                  ],
                ),
              ),


            ],
          ),
        )
      ),
    );
  }
}


class ListNotes extends StatelessWidget{
  final notes ;
  ListNotes({this.notes});
  @override
  Widget build(BuildContext context){
        return Card(
          child:Row(
            children: [

              Expanded(
                flex: 2,
                child: ListTile(
                  title: Text("${notes["note"]}"),
                  subtitle: Text("Price "),
                  trailing: IconButton(onPressed: (){},icon: Icon(Icons.edit),),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Image.asset("${notes["image"]}" ,
                    fit: BoxFit.fill,
                    height: 130 ,
                  )
              ),

            ],
          )
        );
  }
}