import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cor/providers/wish_list_provider.dart';
import 'package:flutter_cor/review/review.dart';
import 'package:flutter_cor/widget/Count.dart';
import 'package:provider/provider.dart';
import 'Colors.dart';


enum SinginCharacter{fill,outline}
class ProductOverview extends StatefulWidget {

    final String productName ;
    final String productImage ;
    final int productPrice;

    final String productId;
  const ProductOverview({ this.productName, this.productImage, this.productPrice,this.productId}) ;
  @override
  State<ProductOverview> createState() => _ProductOverviewState();
}

class _ProductOverviewState extends State<ProductOverview> {

  SinginCharacter _character = SinginCharacter.fill;
  Widget bonntonNavigatorBar({
    Color iconColor,
    Color backgroundColor,
    Color color,
    String title,
    IconData iconData,
    Function onTap,
  }){
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(20),
          color: backgroundColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                size: 20,
                color: iconColor,

              ),
              SizedBox(
                width: 5,
              ),
              Text(
                title,
                style: TextStyle(color: color),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool wishListBool = false;
  
  
  getWishListBool(){
    FirebaseFirestore.instance.collection("WishList").doc(FirebaseAuth.instance.currentUser.uid)
    .collection("YourWishList").doc(widget.productId)
        .get().then((value) => {
      if (value.exists)
        {
          setState(
                () {
              wishListBool = value.get("wishList");
            },
          ),
        }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    WishListProvider wishListProvider = Provider.of(context);
    getWishListBool();
    return Scaffold(
      bottomNavigationBar: Row(
        children: [
          bonntonNavigatorBar(
            backgroundColor: textcolor,
            color: Colors.white,
            iconColor: Colors.grey,
            title: "Add To WishList",
            iconData: wishListBool==false?Icons.favorite_outline:Icons.favorite,
            onTap: (){
              setState(() {
                wishListBool =! wishListBool;
              });
              if(wishListBool==true){
                wishListProvider.addWishListData(
                  wishListId: widget.productId,
                  wishListImage: widget.productImage,
                  wishListName: widget.productName,
                  wishListPrice: widget.productPrice,
                  wishListQuantity: 2
                );
              }else{
                wishListProvider.deleteWishList(widget.productId);
              }
            }
          ),

          bonntonNavigatorBar(
            backgroundColor: prColor,
            color: Colors.white,
            iconColor: Colors.white,
            title: "Go To Cart",
            iconData: Icons.shop_outlined,
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context)=>ReviewCart(),
              ));
            }
          ),
        ],
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: textcolor),
        backgroundColor: prColor,
        title: Text('Product Overview',style: TextStyle(color: Color(0XFF000501),fontSize: 20),),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [

          Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                child: Column(
                  children: [
                    ListTile(
                      title: Text(widget.productName),
                      subtitle: Text("\$50"),
                    ),
                    Container(
                      height: 235,
                      padding: EdgeInsets.all(40),
                      child: Image.asset(widget.productImage),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      width: double.infinity,
                    child: Text('Available Options',
                    textAlign: TextAlign.start,style: TextStyle(color: textcolor,fontWeight: FontWeight.w600),),

                    ),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 3,
                                  backgroundColor: Colors.green,
                                ),
                                Radio(
                                  value: SinginCharacter.fill,
                                  groupValue: _character,
                                  activeColor: Colors.green,
                                  onChanged: (value){
                                    setState(() {
                                      _character=value;
                                    });
                                  },
                                )
                              ],
                            ),

                            Text("\$${widget.productPrice}"),
                            Count(

                              productName: widget.productName,
                              productImage: widget.productImage,
                              productPrice: widget.productPrice,
                              productId: widget.productId,

                            ),

                            // Container(
                            //   padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                            //   decoration: BoxDecoration(
                            //     border: Border.all(color: Colors.grey),
                            //     borderRadius: BorderRadius.circular(30)
                            //   ),
                            // child: Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     Icon(Icons.add,size: 18,color: iconcolor,),
                            //     Text("Add",style: TextStyle(color: iconcolor),)
                            //   ],
                            // ),
                            // ),
                            //

                          ],
                        ),

                      )
                  ],
                ),
              ),
          ),

          //.............................................

          Expanded(child: Container(
            padding: EdgeInsets.all(20),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('About This Product',style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),),

                SizedBox(
                  height: 10,
                ),
                Text('In marketing, a product is an object or system made available for consumer use; it is anything that can be offered to a market to satisfy the desire or need of a customer',
                  style: TextStyle(
                  fontSize: 16,
                  color: textcolor,
                ),),

              ],
            ),
          ))
        ],
      ),
    );
  }
}
