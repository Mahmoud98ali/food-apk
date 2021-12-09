import 'package:flutter/material.dart';
import 'package:flutter_cor/My_profile/my_profile.dart';

import 'Colors.dart';

class DrawerFood extends StatelessWidget {

  Widget listTile({IconData icon,String title,Function onTap}){
    return ListTile(
      onTap: onTap,
      leading: Icon(
      icon,size: 32,
      ),
      title: Text(title,style: TextStyle(color: Colors.black54),),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xffF7FFF7),
        child: ListView(
          children: [
            DrawerHeader(child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Color(0XFF2274A5),
                  radius: 43,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: drawerColor,
                    child: Image.asset("images/main.png"),
                  ),
                ),
                SizedBox(width: 12,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text('Welcome Guest'),
                  SizedBox(height: 10,),
                    Container(
                      height: 30,
                      child: OutlineButton(
                        onPressed: (){},
                        child: Text('Login'),
                        color: Color(0XFF2274A5),
                        shape: RoundedRectangleBorder(

                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide(
                            width: 4
                          )

                        ),
                      ),
                    ),
                ],)
              ],
            )),
            listTile(icon:Icons.home_outlined, title:"Home",),
            listTile(icon:Icons.shop_outlined, title:"Review Cart",),
            listTile(icon:Icons.person_outlined, title:"My Profile",onTap: (){
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context)=>MyProfile()));
            }),
            listTile(icon:Icons.notifications_outlined, title:"Notification",),
            listTile(icon:Icons.star_outlined, title:"Rating & Review",),
            listTile(icon:Icons.favorite_outlined, title:"Wishlist",),
            listTile(icon:Icons.copy_outlined, title:"Raise & Complaint",),
            listTile(icon:Icons.format_quote_outlined, title:"FAQs",),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 350,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Contact Support"),
                  SizedBox(height: 10,),
                  Row(

                    children: [
                      Text("Call us :"),
                      SizedBox(width: 10,),
                      Text("+921321475212"),
                    ],
                  ),
                  SizedBox(height: 5,),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Text('Mail us :'),SizedBox(width: 10,),
                        Text('AlaliMarket@hotmail.com'),
                      ],
                    ),
                  )
                ],
              ),
            )
            
            
          ],

        ),
      ),
    );
  }
}
