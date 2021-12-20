import 'package:flutter/material.dart';
import 'package:flutter_cor/Colors.dart';
import 'package:flutter_cor/models/product_model.dart';
import 'package:flutter_cor/providers/review_cart_provider.dart';
import 'package:flutter_cor/providers/wish_list_provider.dart';
import 'package:flutter_cor/review/review_cart_model.dart';
import 'package:flutter_cor/widget/Single_Item.dart';
import 'package:provider/provider.dart';

class WishList extends StatefulWidget {

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  WishListProvider wishListProvider;
  showAlertDialog(BuildContext context, ProductModel delete) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("No"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Yes"),
      onPressed: () {
        wishListProvider.deleteWishList(delete.productId);
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("WishList Product"),
      content: Text("Are you delete on wishList Product?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

// show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }




  @override
  Widget build(BuildContext context) {
    wishListProvider =Provider.of(context);
    wishListProvider.getWishListData();
    return Scaffold(

      appBar: AppBar(
        backgroundColor: prColor,
        title: Text('WishList',
          style: TextStyle(color: textcolor,fontSize: 18),),
      ),
      body: ListView.builder
        ( itemCount:wishListProvider.getWishList.length ,
        itemBuilder: (context,index){
          ProductModel data = wishListProvider.getWishList[index];
          return Column(
            children: [
              SizedBox(height: 10,),
              SingleItem(
                isBool:true,
                productImage: data.productImage,
                productPrice: data.productPrice,
                productName: data.productName,
                productId: data.productId,
                productQuantity: data.productQuantity,
                onDelete: (){
                    showAlertDialog(context,data);
                },

              ),
            ],
          );
        },

      ),
    );
  }
}
