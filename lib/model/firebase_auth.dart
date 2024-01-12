import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:muscat_car_wash/res/colors.dart';
import 'package:muscat_car_wash/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;
final CollectionReference _mainCollection = firestoreInstance.collection('notes');
class UserData {
  final String? uid;

  UserData({this.uid});
}

class MethodsHandler{

 

  showAlertDialog(BuildContext context, String title, String content) {

    // set up the button

    CupertinoAlertDialog alert =  CupertinoAlertDialog(
      title: Text("$title"),
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("$content"),
      ),
      actions: [

        CupertinoDialogAction(
            child: Text("OK"),
            onPressed: (){
              Navigator.of(context).pop();
            }
        )
      ],
    );


    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

}





