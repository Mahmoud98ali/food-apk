import 'package:flutter/material.dart';
import 'package:flutter_cor/Colors.dart';
import 'package:flutter_cor/models/product_model.dart';
import 'package:flutter_cor/widget/Single_Item.dart';
class Search extends StatefulWidget {
final List<ProductModel>search;
  Search({this.search});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String query ='';
  searchItem(String query){
      List<ProductModel> searchFood =widget.search.where((element) {
        return element.productName.toLowerCase().contains(query);
      }).toList();
    return searchFood;
  }
  @override
  Widget build(BuildContext context) {
    List<ProductModel> _searchItem =searchItem(query);
    return Scaffold(
      // backgroundColor: drawerColor,
      appBar: AppBar(backgroundColor: prColor,
        title: Text("Search"),
        actions: [
         Padding( padding : const EdgeInsets.all(8),
         child: Icon(Icons.menu_rounded),),
        ],
      ),
      //..................



     body: ListView(
       children: [ListTile(
         title: Text("Items"),
       ),
       Container(
         height: 52,
         margin: EdgeInsets.symmetric(horizontal: 20),
         child: TextField(
           onChanged: (value){
             setState(() {
               query=value;
             });
           },
           decoration: InputDecoration(
             border: OutlineInputBorder(
               borderRadius: BorderRadius.circular(30),
               borderSide: BorderSide.none,
             ),
             fillColor: scaffoldBackgroundColor,filled: true,
             hintText: "Search for items in the store",
             suffixIcon: Icon(Icons.search,color: drawerColor,)
           ),
         ),
       ),

      SizedBox(height: 10,),


         Column(
           children: _searchItem.map((data) {
             return  SingleItem(
                 isBool:false,
               productPrice: data.productPrice,
               productImage: data.productImage,
               productName: data.productName,
             );
           }).toList(),
         ),

       ],
     ),

    );
  }
}
