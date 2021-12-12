import 'package:flutter/material.dart';
import 'package:flutter_cor/Colors.dart';

class SingleItem extends StatelessWidget {

  bool isBool = false;
  String productName;
  String productImage;
  int  productPrice;
  SingleItem({this.isBool,this.productName,this.productImage,this.productPrice});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(

          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(

            children: [
              Expanded(child: Container(
                height: 100,
                child: Center(
                  child: productImage!=null? Image.asset (productImage):Container()
                ),
              )),

              Expanded(child: Container(
                height: 90,
                child: Column(
                     mainAxisAlignment:isBool==false
                      ? MainAxisAlignment.spaceAround
                      :MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        productName!=null?Text(productName,
                        style: TextStyle(color: textcolor,
                        fontWeight: FontWeight.bold),):Container(),

                        Text('$productPrice\$/50 Gram',
                          style: TextStyle(color: Colors.grey,),),
                      ],
                    ),

                   isBool==false? Container(
                      margin: EdgeInsets.only(right: 15),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: 35,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(30)
                      ),

                      child: Row(
                        children: [
                          Expanded(
                            child: Text('50 Gram',
                              style: TextStyle(color: Colors.grey,fontSize: 14),),
                          ),
                          Center(
                            child: Icon(Icons.arrow_drop_down,size: 20,color: prColor,),
                          )
                        ],
                      ),
                    )
                    :Text('50 Gram'),

                  ],
                ),

              )),Expanded(child: Container(
                height: 100,
                padding: isBool==false?
                EdgeInsets.symmetric(horizontal: 15,vertical: 32)
                :EdgeInsets.only(left: 15,right: 15),
                child: isBool==false? Container(
                  height: 25,
                  width: 50,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(30)
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add,color: prColor,size: 18,),
                         Text('Add',
                          style: TextStyle(color: prColor,fontSize: 18),),

                      ],
                    ),
                  ),
                ):Column(
                  children: [
                    Icon(Icons.delete,size: 30,
                    color: Colors.black,),

                    SizedBox(height: 5,),
                    Container(
                      height: 25,
                      width: 70,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(30)
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add,color: prColor,size: 18,),
                            Text('Add',
                              style: TextStyle(color: prColor,fontSize: 18),),

                          ],
                        ),
                      ),
                    )
                  ],
                ),


              )
              ),

            ],
          ),
        ),

        isBool==false?Container():Divider(
          height: 1,color: Colors.black45,
        )
      ],
    );
  }
}
