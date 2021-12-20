import 'package:flutter/material.dart';
class ProductUnit extends StatelessWidget {
 final Function onTap;
 final String title ;
 ProductUnit({this.onTap,this.title});


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
      child: Container(
        padding: EdgeInsets.only(left: 5),
        width: 25,height: 30,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Expanded(flex: 4,child: Text("$title")),
            Expanded(flex: 1,child: Icon(Icons.arrow_drop_down,size: 20,color: Color(0XFFF6AE2D),))
          ],
        ),
      ),
    );
  }
}
