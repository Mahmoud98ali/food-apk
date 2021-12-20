import 'package:flutter/material.dart';
import 'package:flutter_cor/models/product_model.dart';
import 'package:flutter_cor/widget/Count.dart';
import 'package:flutter_cor/widget/product_unit.dart';

import '../../../Colors.dart';

class SingleProduct extends StatefulWidget {

  final String productImage ;
  final String productName ;
  final int productPrice ;
  final Function onTap ;
  final String productId ;
  final ProductModel productUnit;
  SingleProduct({this.productImage, this.productName, this.onTap, this.productPrice, this.productId, this.productUnit});

  @override
  State<SingleProduct> createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  var unitData;
  var firstValue;
  @override
  Widget build(BuildContext context) {
    widget.productUnit.productUnit.firstWhere((element) {
      setState(() {
        firstValue =element;
      });
      return true;
    });
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 10),
            width: 170,height: 235,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: widget.onTap,
                  child: Container(
                    height: 150,
                    padding: EdgeInsets.all(5),
                    width: double.infinity,
                    child: Image.asset(
                      widget.productImage,
                    ),
                  ),
                ),

                Expanded(flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.productName,style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold,letterSpacing: 1),),
                          Text('${widget.productPrice}\$/${unitData==null?firstValue:unitData}',style: TextStyle(fontSize: 14,color: Colors.grey)),
                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                               child: ProductUnit(
                                 onTap: (){
                                   showModalBottomSheet(
                                       context: context,
                                       builder: (context) {
                                         return Column(
                                           mainAxisSize: MainAxisSize.min,
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                           children: widget.productUnit.productUnit.map<Widget>((data){
                                             return Center(
                                               child: Column(
                                                 children: [
                                                 Padding(
                                                   padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                                                   child: InkWell(
                                                     onTap: ()async{
                                                       setState(() {
                                                         unitData=data;
                                                       });
                                                       Navigator.of(context).pop();
                                                   },
                                                     child: Text(
                                                       data,style: TextStyle(
                                                       color: prColor,
                                                       fontSize: 18
                                                     ),
                                                     ),
                                                   ),
                                                 )
                                                 ],
                                               ),
                                             );
                                           }).toList(),
                                          );
                                       });

                                 },
                                 title: unitData==null?firstValue:unitData,
                               ),

                              ),
                              SizedBox(width: 5,),

                              Expanded(flex: 1,
                                child: Count(

                                  productName: widget.productName,
                                  productImage: widget.productImage,
                                  productPrice: widget.productPrice,
                                  productId: widget.productId,
                                  productUnit: unitData==null?firstValue:unitData,
                                ),
                              ),
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
