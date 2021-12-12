import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_cor/models/product_model.dart';

class ProductProvider with ChangeNotifier{

  List<ProductModel> legumesProductList=[];

  ProductModel productModel;

  List<ProductModel>search=[];

  productModels(QueryDocumentSnapshot element){
    productModel =ProductModel(
      productImage: element.get("productimage"),
      productName: element.get("productName"),
      productPrice: element.get("productPrice"),
      productId: element.get("productId"),
    );
    search.add(productModel);
  }

  fatchlegumesproductData()async{
    List<ProductModel> newList=[];
   QuerySnapshot value= await FirebaseFirestore.instance.collection("LegumesProduct").get();

  value.docs.forEach((element) {
      productModels(element);
    newList.add(productModel);
  },

  );
    legumesProductList =newList ;
    notifyListeners();
  }

  List get getlegumesProductDataList{
    return legumesProductList;
  }

/////////////////////////vegetablesProductList//////////////////////////////
  List<ProductModel> VegetablesProductList=[];

  fatchVegetablesproductData()async{
    List<ProductModel> newList=[];
    QuerySnapshot value= await FirebaseFirestore.instance.collection("VegetablesProduct").get();

    value.docs.forEach((element) {
      productModels(element);
      newList.add(productModel);
    },

    );
    VegetablesProductList =newList ;
    notifyListeners();
  }

  List get getVegetablesProductDataList{
    return VegetablesProductList;
  }

  /////////////////////FreshFruitsProduct////////////
  List<ProductModel> FreshProductList=[];

  fatchFreshProductData()async{
    List<ProductModel> newList=[];
    QuerySnapshot value= await FirebaseFirestore.instance.collection("FreshProduct").get();

    value.docs.forEach((element) {
      productModels(element);
      newList.add(productModel);
    },

    );
    FreshProductList =newList ;
    notifyListeners();
  }

  List get getFreshProductDataList{
    return FreshProductList;
  }
  
/////////////// Search Return //////////////////////////
  List get getAllProductDataList{
    return search;
  }
}