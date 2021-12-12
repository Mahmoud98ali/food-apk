import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cor/DrawerFood2.dart';
import 'package:flutter_cor/NavigationDrawerWidget.dart';
import 'package:flutter_cor/ProductOverview.dart';
import 'package:flutter_cor/providers/product_provider.dart';
import 'package:flutter_cor/search/search.dart';
import 'package:provider/provider.dart';

import '../Colors.dart';
import 'Single_product.dart';


class HomePage extends StatefulWidget {


  @override
  _HomePageState createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {
  ProductProvider productProvider ;

   getUser(){
  var user = FirebaseAuth.instance.currentUser ;
  print(user.email);
  }

  @override
  void initState() {
    ProductProvider productProvider = Provider.of(context, listen: false);
    productProvider.fatchlegumesproductData();
    productProvider.fatchVegetablesproductData();
    productProvider.fatchFreshProductData();
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context)  {
     productProvider = Provider.of(context);

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
    backgroundColor: Color(0XFFF7F7FF),
        appBar: AppBar(
          actions: [
            CircleAvatar(radius: 15,
              backgroundColor: drawerColor,
            child: IconButton(
            onPressed: (){
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=> Search(
                    search: productProvider.getAllProductDataList
                  ),));
            },
            icon:Icon(Icons.search,
            size: 19,
            color: prColor,)),),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: CircleAvatar(radius: 15,
                  backgroundColor: drawerColor,
                child: Icon(Icons.shop,size: 17,color: prColor,),),
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
                     GestureDetector(
                       onTap: (){
                         Navigator.of(context).push(
                             MaterialPageRoute(
                                 builder: (context)=>Search(
                                   search: productProvider.getlegumesProductDataList
                                 ),
                             ));
                       },
                         child: Text
                           ('view all',
                           style: TextStyle(fontSize: 18,
                               color: Colors.grey),
                         )),
                   ],
                 ),
               ),
                    //................................................
                   //three Widget for column
              SizedBox(height: 10,),
             SingleChildScrollView(
               scrollDirection: Axis.horizontal,
               child: Row(
                 children: productProvider.getlegumesProductDataList
                     .map(
                         (legumesProductData) {
                           return SingleProduct(
                               onTap:(){
                                 Navigator.of(context).push(MaterialPageRoute(
                                   builder: (context)=>ProductOverview(
                                       productPrice:legumesProductData.productPrice,
                                       productImage:legumesProductData.productImage,
                                       productName:legumesProductData.productName),));
                               },
                               productPrice:legumesProductData.productPrice,
                               productImage:legumesProductData.productImage,
                               productName:legumesProductData.productName
                           );
                         },
                         ).toList(),
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
                    GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context)=>Search(
                                    search: productProvider.getVegetablesProductDataList
                                ),
                              ));
                        },
                        child: Text
                          ('view all',
                          style: TextStyle(fontSize: 18,
                              color: Colors.grey),
                        ))
                  ],
                ),
              ),
              //................................................
              SizedBox(height: 10,),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: productProvider.getVegetablesProductDataList
                      .map(
                        (VegetablesProductData) {
                      return SingleProduct(
                          onTap:(){
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context)=>ProductOverview(
                                  productPrice:VegetablesProductData.productPrice,
                                  productImage:VegetablesProductData.productImage,
                                  productName:VegetablesProductData.productName),));
                          },
                          productPrice:VegetablesProductData.productPrice,
                          productImage:VegetablesProductData.productImage,
                          productName:VegetablesProductData.productName
                      );
                    },
                  ).toList(),





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
                    GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context)=>Search(
                                    search: productProvider.getFreshProductDataList
                                ),
                              ));
                        },
                        child: Text
                          ('view all',
                          style: TextStyle(fontSize: 18,
                              color: Colors.grey),
                        ))
                  ],
                ),
              ),
              //................................................
              SizedBox(height: 10,),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: productProvider.getFreshProductDataList
                      .map(
                        (freshFruitsProductData) {
                      return SingleProduct(
                          onTap:(){
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context)=>ProductOverview(
                                  productPrice:freshFruitsProductData.productPrice,
                                  productImage:freshFruitsProductData.productImage,
                                  productName:freshFruitsProductData.productName),));
                          },
                          productPrice:freshFruitsProductData.productPrice,
                          productImage:freshFruitsProductData.productImage,
                          productName:freshFruitsProductData.productName
                      );
                    },
                  ).toList(),
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