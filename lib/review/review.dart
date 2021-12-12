import 'package:flutter/material.dart';
import 'package:flutter_cor/Colors.dart';
import 'package:flutter_cor/widget/Single_Item.dart';

class ReviewCart extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ListTile(
        title: Text('Total Aount'),
        subtitle: Text('\$ 170.00',
          style: TextStyle(color: Colors.green[900]),),
        trailing: Container(
          width: 160,
          child: MaterialButton(
            child: Text('Submit'),
            color: prColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)
            ), onPressed: () {  },
          ),
        ),
      ),

      appBar: AppBar(
        backgroundColor: prColor,
        title: Text('Review Cart',
        style: TextStyle(color: textcolor,fontSize: 18),),
      ),
      body: ListView(
        children: [
          SizedBox(height: 10,),
          SingleItem(

              isBool:false
          ),
          SingleItem(
              isBool:true
          ),
          SingleItem(
              isBool:true
          ),
          SingleItem(
              isBool:true
          ),
          SizedBox(height: 10,),
        ],
      ),
    );
  }
}
