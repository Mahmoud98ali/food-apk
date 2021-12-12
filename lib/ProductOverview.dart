import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Colors.dart';


enum SinginCharacter{fill,outline}
class ProductOverview extends StatefulWidget {

    final String productName ;
    final String productImage ;
    final int productPrice;

  const ProductOverview({ this.productName, this.productImage, this.productPrice}) ;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        children: [
          bonntonNavigatorBar(
            backgroundColor: textcolor,
            color: Colors.white,
            iconColor: Colors.grey,
            title: "Add To WishList",
            iconData: Icons.favorite_outline,
          ),

          bonntonNavigatorBar(
            backgroundColor: prColor,
            color: Colors.white,
            iconColor: Colors.white,
            title: "Go To Cart",
            iconData: Icons.shop_outlined,
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
                      height: 250,
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

                            Text("\$50"),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(30)
                              ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.add,size: 18,color: iconcolor,),
                                Text("Add",style: TextStyle(color: iconcolor),)
                              ],
                            ),
                            ),
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
