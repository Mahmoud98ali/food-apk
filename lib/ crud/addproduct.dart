import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key key}) : super(key: key);

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: (){
              Navigator.of(context).pushReplacementNamed("homepage");
            }
                ,
                icon: Icon(Icons.arrow_back)
            )
          ],
          title: Text("Add product"),
        ),
        body: Container(
            child: Column(
          children: [
            Form(
                child: Column(
              children: [
                TextFormField(
                  maxLength: 30,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: "أضف اسم المنتج",
                      prefixIcon: Icon(Icons.add)),
                ),
                TextFormField(
                  maxLines: 3,
                  minLines: 1,
                  maxLength: 200,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: "وصف المنتج",
                      prefixIcon: Icon(Icons.add)),
                ),
                ElevatedButton(
                    onPressed: () {
                      showBottomSheet();
                    },
                    child: Text(
                      "أضف صورة المنتج ",
                      style: TextStyle(color: Colors.white),
                    )),
                Container(
                  height: 60,
                  width: 220,
                  child: ElevatedButton(
                      onPressed: () {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.SUCCES,
                          animType: AnimType.BOTTOMSLIDE,
                          title: 'Dialog Title',
                          desc: 'هل أنت متأكد من إضافة المنتج',
                          btnCancelOnPress: () {},
                          btnOkOnPress: () {},
                        )..show();
                      },
                      child: Text(
                        "أضف المنتج ",
                        style: Theme.of(context).textTheme.headline6,
                      )),
                ),
              ],
            ))
          ],
        )),
      ),
    );
  }

  showBottomSheet() {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.all(10),
            height: 200,
            child: Column(
              children: [
                Text("رجاءاً أختر الصورة",
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.photo_outlined,
                          size: 30,
                        ),
                        SizedBox(
                          width: 100,
                        ),
                        Text("اختر من الأستوديو",
                            style: TextStyle(
                              fontSize: 20,
                            )),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.camera,
                          size: 30,
                        ),
                        SizedBox(
                          width: 100,
                        ),
                        Text("اختر من الكاميرا",
                            style: TextStyle(
                              fontSize: 20,
                            )),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
