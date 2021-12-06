import 'package:flutter/material.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding =EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Color(0XFF091540),
        child: ListView(
          padding: padding,
          children: <Widget>[
            const SizedBox(height: 48,),

            UserAccountsDrawerHeader( // هذه الخاصية جاهزة للإيميل
              currentAccountPicture: CircleAvatar(backgroundColor: Colors.deepPurple,child: Text("M"),),
              accountName: Text("Anythings"),
              accountEmail: Text("mahmoudad2013@hotmail.com"),
              arrowColor: Colors.red,
            ),

            const SizedBox(height: 10,),
            buildMenuItem(
              text :"Home Page",
              icon: Icons.home,
            ),

            const SizedBox(height: 10,),
            buildMenuItem(
              text :"Home Page",
              icon: Icons.home,
            ),
            const SizedBox(height: 10,),
            buildMenuItem(
              text :"Home Page",
              icon: Icons.home,
            ),

            const SizedBox(height: 10,),
            buildMenuItem(
              text :"Home Page",
              icon: Icons.home,
            ),

            const SizedBox(height: 22,),
           Divider(color: Colors.white70,),
            const SizedBox(height: 5,),
            buildMenuItem(
              text :"Home Page",
              icon: Icons.home,
            ),
            const SizedBox(height: 22,),
            buildMenuItem(
              text :"About",
              icon: Icons.help_outline,
            ),
            const SizedBox(height: 22,),
            buildMenuItem(
              text :"Help",
              icon: Icons.live_help_outlined,
            ),
            const SizedBox(height: 22,),
            buildMenuItem(
              text :"Logout",
              icon: Icons.logout,
            ),

          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({
     String text,
     IconData icon,
  }) {
    final color = Colors.white;
    return ListTile(
    leading: Icon(icon,color: color,),
      title: Text(text,style: TextStyle(color: color),),
      onTap: (){},
    );
  }

}

