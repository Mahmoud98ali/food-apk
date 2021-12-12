import 'package:flutter/material.dart';
import 'package:flutter_cor/providers/review_cart_provider.dart';
import 'package:provider/provider.dart';

import '../Colors.dart';

class Count extends StatefulWidget {

  String productName;
  String productImage;
  String productId;

  int productPrice;

  Count({this.productName,this.productImage,this.productPrice,this.productId});
  @override
  _CountState createState() => _CountState();
}

class _CountState extends State<Count> {
  int count = 1;
  bool isTrue =false;
  @override
  Widget build(BuildContext context) {

    ReviewCartProvider reviewCartProvider =Provider.of(context);
    return Container(
         width: 50,height: 30,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: isTrue ==true? Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(onTap: (){
              if(count==1){
              setState(() {
               isTrue=false;
              });}
              if(count > 1) {
                setState(() {
                  count--;
                });
              }
              },
                child: Icon(Icons.remove,
                size: 18,
                color: iconcolor)),
            Text('$count',style: TextStyle(color: iconcolor,fontWeight: FontWeight.bold),),
            InkWell(onTap: (){
              setState(() {
                count++;
              });
            },child: Icon(Icons.add,size: 18,color: iconcolor)),
          ],
        ):Center(
          child: InkWell(
            onTap: (){
              setState(() {
                isTrue=true;
              });
              reviewCartProvider.addReviewCartData(
                cartId: widget.productId,
                cartImage: widget.productImage,
                cartName: widget.productName,
                cartPrice: widget.productPrice,
                cartQuantity: count,
                              );
            },
            child: Text("ADD",style: TextStyle(color: iconcolor)),
          ),
        ),
      );

  }
}
