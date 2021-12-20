import 'package:flutter/material.dart';
class OrderItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset("images/v2.png",width: 60,),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("food name",style: TextStyle(color: Colors.green[600]),),
          Text("50 Gram",style: TextStyle(color: Colors.green[600]),),
          Text("\$30",),
        ],
      ),
      subtitle: Text("5"),
    );
  }
}
