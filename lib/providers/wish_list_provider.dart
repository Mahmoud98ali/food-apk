import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_cor/models/product_model.dart';

class WishListProvider with ChangeNotifier{

  void addWishListData({
    String wishListId,
    String wishListName,
    String wishListImage,
    var wishListPrice,
    int wishListQuantity,

  })async{
    await FirebaseFirestore.instance
        .collection("WishListData")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection("YourWishList")
        .doc(wishListId)
        .set(
        {
          "wishListId":wishListId,
          "wishListName":wishListName,
          "wishListImage":wishListImage,
          "wishListPrice":wishListPrice,
          "wishListQuantity":wishListQuantity,
          "wishList":true,
        }
    );
  }

  /////////////Get WishList Data ////////////
  List<ProductModel> wishList = [];

  getWishListData()async{
    List<ProductModel> newList = [];
    QuerySnapshot value = await FirebaseFirestore.instance
        .collection("WishListData")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection("YourWishList")
        .get();
    value.docs.forEach((element) {
      ProductModel productModel = ProductModel(
          productId: element.get("wishListId"),
          productImage: element.get("wishListImage"),
          productPrice: element.get("wishListPrice"),
          productName: element.get("wishListName"),
          productQuantity: element.get("wishListQuantity")
      );
      newList.add(productModel);
    }
    );

    wishList =newList;
    notifyListeners();
  }
List<ProductModel> get getWishList{
return wishList;
}




///////////////// Delete WishList////////////////
deleteWishList(wishListId){
    FirebaseFirestore.instance.collection("WishListData")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection("YourWishList")
        .doc(wishListId).delete();
}

}



