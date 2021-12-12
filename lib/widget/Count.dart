import 'package:flutter/material.dart';

import '../Colors.dart';

class Count extends StatefulWidget {


  @override
  _CountState createState() => _CountState();
}

class _CountState extends State<Count> {
  int count = 1;
  bool isTrue =false;
  @override
  Widget build(BuildContext context) {
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
            },
            child: Text("ADD",style: TextStyle(color: iconcolor)),
          ),
        ),
      );

  }
}
