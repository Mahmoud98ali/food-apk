import 'package:flutter/material.dart';
import 'package:flutter_cor/widget/Count.dart';

import '../Colors.dart';

class SingleProduct extends StatelessWidget {

  final String productImage ;
  final String productName ;
  final int productPrice ;
  final Function onTap ;
  SingleProduct({this.productImage, this.productName, this.onTap, this.productPrice});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 10),
            width: 165,height: 230,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    height: 150,
                    padding: EdgeInsets.all(5),
                    width: double.infinity,
                    child: Image.asset(
                      productImage,
                    ),
                  ),
                ),

                Expanded(flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(productName,style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold,letterSpacing: 1),),
                          Text('$productPrice\$/50 Gram',style: TextStyle(fontSize: 14,color: Colors.grey)),
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

                              Count(),
                            ],
                          )


                        ],
                      ),
                    )
                ),
              ],
            ),
          )
        ],
      ),
    );
}
}
