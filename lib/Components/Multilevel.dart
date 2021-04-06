import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MultiLevel extends StatefulWidget {
  @override
  _MultiLevelState createState() => _MultiLevelState();
}

class _MultiLevelState extends State<MultiLevel> {
  TextEditingController textControllerFEedback;
  void initState()
  {
    textControllerFEedback=  TextEditingController();
    super.initState();
  }

  String Userid = FirebaseAuth.instance.currentUser.uid;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                margin: EdgeInsets.only(left: 10),
                // alignment: Alignment.topRight,
                child: Row(
                  children: [

                    Expanded(child: Card(
                      margin: EdgeInsets.all(20),
                      child: ListTile(
                        title: Text('Prediction [0]',
                            style: TextStyle(color: Colors.black87, fontSize: 20)),
                        subtitle: Text('No DR / Normal',
                            style: TextStyle(color: Colors.green, fontSize: 20)),
                        leading: Container(
                          child: Image.asset("assets/Images/dreamstime_xxl_82470163.jpg"),
                        ),
                      ),
                    ),),

                  ],
                )
            ),
            Container(
                margin: EdgeInsets.only(left: 10),
                // alignment: Alignment.topRight,
                child: Row(
                  children: [

                    Expanded(child: Card(
                      margin: EdgeInsets.all(20),
                      child: ListTile(
                        title: Text('Prediction [1]',
                            style: TextStyle(color: Colors.black87, fontSize: 20)),
                        subtitle: Text('Mild',
                            style: TextStyle(color: Colors.green, fontSize: 20)),
                        leading: Container(
                          child: Image.asset("assets/Images/dreamstime_xxl_82470163.jpg"),
                        ),
                      ),
                    ),),

                  ],
                )
            ),
            Container(
                margin: EdgeInsets.only(left: 10),
                // alignment: Alignment.topRight,
                child: Row(
                  children: [

                    Expanded(child: Card(
                      margin: EdgeInsets.all(20),
                      child: ListTile(
                        title: Text('Prediction [2]',
                            style: TextStyle(color: Colors.black87, fontSize: 20)),
                        subtitle: Text('Moderate',
                            style: TextStyle(color: Colors.green, fontSize: 20)),
                        leading: Container(
                          child: Image.asset("assets/Images/dreamstime_xxl_82470163.jpg"),
                        ),
                      ),
                    ),),

                  ],
                )
            ),
            Container(
                margin: EdgeInsets.only(left: 10),
                // alignment: Alignment.topRight,
                child: Row(
                  children: [

                    Expanded(child: Card(
                      margin: EdgeInsets.all(20),
                      shadowColor: Colors.green,
                      child: ListTile(

                        title: Text('Prediction [3]',
                            style: TextStyle(color: Colors.black87, fontSize: 20)),
                        subtitle: Text('Severe',
                            style: TextStyle(color: Colors.green, fontSize: 20)),
                        leading: Container(
                          child: Image.asset("assets/Images/dreamstime_xxl_82470163.jpg"),
                        ),
                      ),
                    ),),

                  ],
                )
            ),
            Container(
              
                margin: EdgeInsets.only(left: 10),
                // alignment: Alignment.topRight,
                child: Row(
                  children: [

                    Expanded(child: Card(
                      margin: EdgeInsets.all(20),
                      child: ListTile(
                        title: Text('Prediction [4]',
                            style: TextStyle(color: Colors.black87, fontSize: 20)),
                        subtitle: Text('PDR',
                            style: TextStyle(color: Colors.green, fontSize: 20)),
                        leading: Container(
                          child: Image.asset("assets/Images/dreamstime_xxl_82470163.jpg"),
                        ),

                      ),
                    ),),

                  ],
                )
            ),

          ],
        ),
      ]
    );
  }
}
