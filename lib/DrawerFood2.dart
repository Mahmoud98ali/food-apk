import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cor/My_profile/my_profile.dart';
import 'package:flutter_cor/providers/user_provider.dart';
import 'package:flutter_cor/review/review.dart';
import 'package:flutter_cor/wishList/wish_list.dart';

import 'Colors.dart';
import 'login.dart';

class DrawerFood extends StatefulWidget {
  UserProvider userProvider;
  DrawerFood({this.userProvider});
  @override
  State<DrawerFood> createState() => _DrawerFoodState();
}

class _DrawerFoodState extends State<DrawerFood> {
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
    var userData = widget.userProvider.currentUserData;
    return Drawer(
      child: Container(
        color: Color(0xffF7FFF7),
        child: ListView(
          children: [
            DrawerHeader(child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Color(0XFF2274A5),
                    radius: 43,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: drawerColor,
                      backgroundImage: NetworkImage(
                                userData.userImage ==null?
                              "images/main.png":userData.userImage
                      ),

                    ),
                  ),
                  SizedBox(width: 12,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text(userData.userName==null?"NO data":userData.userName),
                    SizedBox(height: 10,),
                      Text(userData.userEmail==null?"NO data":userData.userEmail),
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
                  ],
                  )
                ],
              ),
            )),
            listTile(icon:Icons.home_outlined, title:"Home",),
            listTile(icon:Icons.shop_outlined, title:"Review Cart",onTap: (){
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context)=>ReviewCart()));
            }),
            listTile(icon:Icons.person_outlined, title:"My Profile",onTap: (){
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context)=>MyProfile(userProvider:widget.userProvider)));
            }),
            listTile(icon:Icons.notifications_outlined, title:"Notification",),
            listTile(icon:Icons.star_outlined, title:"Rating & Review",),
            listTile(icon:Icons.favorite_outlined, title:"Wishlist",onTap: (){
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context)=>WishList()));
            }),
            listTile(icon:Icons.copy_outlined, title:"Raise & Complaint",),
            listTile(icon:Icons.format_quote_outlined, title:"FAQs",onTap: ()async{
              await FirebaseAuth.instance.signOut();
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context)=>Login()));
            },

            ),

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
