import 'package:flutter/material.dart';
import 'package:flutter_cor/DrawerFood2.dart';
import '../Colors.dart';


class MyProfile extends StatelessWidget {

  Widget listTile({IconData icon ,String title}){
    return Column(
      children: [
        Divider(height: 1,),
        ListTile(
          leading: Icon(icon),
          title: Text(title),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color(0xff51BBFE),
      appBar:AppBar(
        backgroundColor: Color(0xff51BBFE),
        elevation: 0.0,
        title: Text('My Profile',
        style: TextStyle(fontSize: 18,color: textcolor)),
      ) ,
      drawer: DrawerFood(),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 100,
                color:Color(0xff51BBFE) ,
              ),

              Container(
                height: 548,
                width: double.infinity,

                padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                decoration: BoxDecoration(
                  color: drawerColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(200),
                    topRight: Radius.circular(30),
                  )
                ),
               child: ListView(
                 children: [
                   Row(
                     mainAxisAlignment: MainAxisAlignment.end,
                     children: [
                       Container(
                         width: 250,
                         height: 80,
                         padding: EdgeInsets.only(left: 20),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceAround,
                           children: [
                             Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text(
                                   "AL-ALi Market",
                                   style: TextStyle(
                                     fontSize: 14,
                                     fontWeight: FontWeight.w600,
                                     color: textcolor,
                                   ),
                                 ),
                                 SizedBox(height: 10,),
                                 Text("AlaliMarket@hotmail.com"),
                               ],
                             ),
                             CircleAvatar(
                               radius: 16,
                               backgroundColor: prColor,
                               child: CircleAvatar(
                                 radius: 14,
                                 backgroundColor: drawerColor,
                                 child: Icon(
                                   Icons.edit,
                                   color: prColor,
                                 ),
                               ),
                             )
                           ],
                         ),
                       ),
                     ],
                   ),
                   //...............................

                   listTile(icon: Icons.shop_outlined, title: "My Orders"),
                   listTile(
                       icon: Icons.location_on_outlined,
                       title: "My Delivery Address"),
                   listTile(
                       icon: Icons.person_outline, title: "Refer A Friends"),
                   listTile(
                       icon: Icons.file_copy_outlined,
                       title: "Terms & Conditions"),
                   listTile(
                       icon: Icons.policy_outlined, title: "Privacy Policy"),
                   listTile(icon: Icons.add_chart, title: "About"),
                   listTile(
                       icon: Icons.exit_to_app_outlined, title: "Log Out"),
                 ],
               ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40,left: 30),
            child: CircleAvatar(
              radius: 47,
              backgroundColor: textcolor  ,
              child: CircleAvatar(
                radius: 45,
                backgroundImage: AssetImage("images/main.png"),
                backgroundColor: drawerColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
