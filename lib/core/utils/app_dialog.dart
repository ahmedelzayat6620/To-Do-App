import 'package:flutter/material.dart';

abstract class AppDialog {
  static void showLoding(BuildContext context){
                    showDialog(
                  context: context,
                  barrierDismissible: false,

                  builder: (context) => PopScope(
                    canPop: false,
                    child: AlertDialog(
                      content: Row(
                        spacing: 10,
                        children: [
                          CircularProgressIndicator(color: Color(0xff5F33E1)),
                          Text(
                            "Loading...",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );

  }

  
static void showError(BuildContext context ,{required String error } ){
  
                    showDialog(
                  context: context,
                  barrierDismissible: false,

                  builder: (context) => PopScope(
                    canPop: true,
                    child: AlertDialog(
                      title: Text('Error'),
                      content: Text(error),
                      actions: [
                        MaterialButton(onPressed: (){
                        Navigator.of(context).pop();
                        }
                        ,child: Text('ok'),)
                      ],
                    ),
                  ),
                );
}
}

