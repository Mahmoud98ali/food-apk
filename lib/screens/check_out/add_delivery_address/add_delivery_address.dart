import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cor/Colors.dart';
import 'package:flutter_cor/wishList/costom_text_field.dart';

import '../../../wishList/costom_text_field.dart';
class AddDeliverAddress extends StatefulWidget {

  @override
  _AddDeliverAddressState createState() => _AddDeliverAddressState();
}

enum AddressTypes{ Home,Work,Other }

class _AddDeliverAddressState extends State<AddDeliverAddress> {
  var myType = AddressTypes.Other;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Delivery Address",style: TextStyle(fontSize: 18),),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
        height: 48,
        child: MaterialButton(onPressed: (){

        },
          child: Text("Add Address",style: TextStyle(color: Colors.white),),
          color: prColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30,),
          ),
        ),
      ),
      body: Padding(padding: EdgeInsets.symmetric(horizontal: 20,),
      child: ListView(
        children: [
          CostomTextField(
            labText: "First name",
          ),
          CostomTextField(
            labText: "Last name",
          ),CostomTextField(
            labText: "Mobile No",
          ),
          CostomTextField(
            labText: "Alternate Mobile No",
          ),
          CostomTextField(
            labText: "Scoiety",
          ),CostomTextField(
            labText: "Street",
          ),CostomTextField(
            labText: "Landmark",
          ),
                CostomTextField(
                labText: "City",
              ),CostomTextField(
                labText: "Aera",
              ),
          CostomTextField(
            labText: "Pincode",
          ),
          InkWell(
            onTap: (){},
            child: Container(
              height: 47,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Set Location")
                ],
              ),
            ),
          ),
          Divider(
            color: Colors.black,
          ),
          ListTile(
            title: Text("Address Type*"),
          ),
          RadioListTile(value:  AddressTypes.Home, groupValue: myType,
            onChanged: (AddressTypes value){
              setState(() {
                myType=value;
              });
            },
            title: Text("Home"),
            secondary: Icon(Icons.home,color: prColor,),
          ),
          RadioListTile(value:  AddressTypes.Work, groupValue: myType,
            onChanged: (AddressTypes value){
              setState(() {
                myType=value;
              });
            },
            title: Text("Work"),
            secondary: Icon(Icons.work,color: prColor,),
          ),
          RadioListTile(value:  AddressTypes.Other, groupValue: myType,
            onChanged: (AddressTypes value){
            setState(() {
              myType=value;
            });
          },
            title: Text("Other"),
            secondary: Icon(Icons.devices_other,color: prColor,),
          ),
        ],
      ),
      ),
    );
  }
}
