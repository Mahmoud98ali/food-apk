
import 'package:flutter/material.dart';
import 'package:flutter_cor/Colors.dart';
import 'package:flutter_cor/screens/check_out/add_delivery_address/add_delivery_address.dart';
import 'package:flutter_cor/screens/check_out/delivery_data/single_delivery.dart';
import 'package:flutter_cor/screens/check_out/payment_summary/payment_summary.dart';

class DeliveryDatails extends StatelessWidget {

  List<Widget> address =[
    SingleDeliveryItem(
    address: "Damascus , spani/Mokf Abo Arif",
    title: "Assar Developer",
    number: "+9639324565634",
    addressType: "Home",
  )
  ];
  bool isAddress =false ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("DeliveryDatails"),),
    floatingActionButton: FloatingActionButton(
      backgroundColor: prColor,
      child: Icon(Icons.add),
      onPressed: (){},
    ),
      bottomNavigationBar: Container(
        // width: 160,
        height: 45,
        margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
        child: MaterialButton(
          child: address .isEmpty ?
            Text("Add new Address"):Text("Payment Summary"),
            onPressed: (){
              address .isEmpty?
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddDeliverAddress()
            ),):Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PaymentSummary()
              ),);



            },
          color: prColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)
          ),
        ),
      ),

      body: ListView(
        children: [
          ListTile(
            title: Text("Delivery To"),
            leading:Image.asset("images/Location.png",height: 30,) ,
          ),
          Divider(
            height: 1,
          ),
          Column(
            children: [
            address.isEmpty?
            Container():  SingleDeliveryItem(
              address: "Damascus , spani/Mokf Abo Arif",
              title: "Assar Developer",
              number: "+9639324565634",
              addressType: "Home",
            )
            ],
          ),
        ],
      ),
    );
  }
}
