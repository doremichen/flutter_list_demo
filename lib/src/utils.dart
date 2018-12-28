///
/// This is used to as a toolset
///

import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

import 'dart:async';


class Utils {
  static void showToast(String msg) => Fluttertoast.showToast(msg: msg);

  static Future<void> showInfoDialog(BuildContext context, String message) async {

         return showDialog(
             context: context,
             barrierDismissible: false,
             builder: (context) {
               return AlertDialog(
                 title: Text("Info: "),
                 content: SingleChildScrollView(
                   child: ListBody(
                     children: <Widget>[
                       Text(message),
                     ],
                   ),
                 ),
                 actions: <Widget>[
                   RaisedButton(
                     child: Text("ok", style: TextStyle(color: Colors.white),),
                     onPressed: () {
                       Navigator.of(context).pop();
                     },
                   ),
                 ],
               );
             }
         );

  }
}