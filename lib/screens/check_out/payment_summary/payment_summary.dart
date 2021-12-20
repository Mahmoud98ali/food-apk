import 'package:flutter/material.dart';
import 'package:flutter_cor/Colors.dart';
import 'package:flutter_cor/screens/check_out/payment_summary/order_item.dart';
class PaymentSummary extends StatefulWidget {


  @override
  _PaymentSummaryState createState() => _PaymentSummaryState();
}
enum AddressTypes{ Home,OnlinePayment }
class _PaymentSummaryState extends State<PaymentSummary> {
  var myType = AddressTypes.OnlinePayment;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("Payment Summary",
        style: TextStyle(
          fontSize: 18
        ),),
      ),
      bottomNavigationBar: ListTile(
        title: Text("Total Amount"),
        subtitle: Text("\$300",
        style: TextStyle(
          color: Colors.green[900],
          fontWeight: FontWeight.bold,
          fontSize: 17
        ),
        ),
        trailing: Container(
          width: 160,
          child: MaterialButton(
            onPressed: (){

            },
            child: Text("Pleace Order",
            style: TextStyle(
              color: Colors.black
            ),),
            color: prColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context,index){
            return Column(

              children: [
                ListTile(
                  title: Text("First & Last Name"),
                  subtitle: Text("Damascus,Spani/Maokf Abo Arif"),
                ),
                Divider(),
                ExpansionTile(title: Text("Order Item 6"),
                children: [
                  OrderItem(),
                  OrderItem(),
                  OrderItem(),
                  OrderItem(),
                  OrderItem(),
                  OrderItem(),
                ],),
                Divider(),
                ListTile(
                  minVerticalPadding: 5,
                  leading: Text("Sub Total",
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),),
              trailing: Text("\$200", style: TextStyle(
                  fontWeight: FontWeight.bold
              ),),
                ),
                ListTile(
                  minVerticalPadding: 5,
                  leading: Text("shipping Charge",
                    style: TextStyle(
                        color: Colors.grey[600]
                    ),),
                  trailing: Text("\$0", style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),),
                ),
                ListTile(
                  minVerticalPadding: 5,
                  leading: Text("Compen Discount",
                    style: TextStyle(
                        color: Colors.grey[600]
                    ),),
                  trailing: Text("\$10", style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),),
                ),
                Divider(),
                ListTile(
                  leading: Text("Payment Options"),
                ),
                RadioListTile(value:  AddressTypes.Home, groupValue: myType,
                  onChanged: (AddressTypes value){
                    setState(() {
                      myType=value;
                    });
                  },
                  title: Text("Work"),
                  secondary: Icon(Icons.work,color: prColor,),
                ),
                RadioListTile(value:  AddressTypes.OnlinePayment, groupValue: myType,
                  onChanged: (AddressTypes value){
                    setState(() {
                      myType=value;
                    });
                  },
                  title: Text("OnlinePayment"),
                  secondary: Icon(Icons.devices_other,color: prColor,),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
