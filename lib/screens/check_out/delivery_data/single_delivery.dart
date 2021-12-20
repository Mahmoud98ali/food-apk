import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cor/Colors.dart';
class SingleDeliveryItem extends StatelessWidget {
  final String title ;
  final String address;
  final String number ;
  final String addressType;

 SingleDeliveryItem({this.title, this.address, this.number, this.addressType});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Container(
                width: 60,height: 20,
                padding: EdgeInsets.all(1),
                decoration: BoxDecoration(
                  color: prColor,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Center(
                  child: Text(addressType,style: TextStyle(fontSize: 13,color: Colors.white),),
                ),
              ),
            ],
          ),
          leading: CircleAvatar(
              radius: 8,
            backgroundColor: prColor,
          ),
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(address),
                SizedBox(height: 5,),
                Text(number),
              ],
            ),
        ),
        Divider(
          height: 35,
          
        ),
      ],
    );
  }
}
