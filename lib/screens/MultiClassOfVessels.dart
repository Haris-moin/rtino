import 'package:flutter/material.dart';
import 'package:retinopathy/Components/Multilevel.dart';
import 'package:retinopathy/Components/Uploadimage.dart';

import 'Profile.dart';
import 'aboutUs.dart';

class MulticlassClassification extends StatefulWidget {
  @override
  _MulticlassClassificationState createState() =>
      _MulticlassClassificationState();
}

class _MulticlassClassificationState extends State<MulticlassClassification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(150, 79, 230, 202),
        title: Text('Retinopathy'),
        actions: [
          Center(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutUs()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Text('AboutUs', style: TextStyle(fontSize: 20.0)),
              ),
            ),
          ),
          Center(
            child: InkWell(
              onTap: () {

              },
              child: Padding(

                padding: const EdgeInsets.all(14.0),
                child: Text('Predict', style: TextStyle(fontSize: 20.0)),
              ),
            ),
          ),

          IconButton(
              padding:
              EdgeInsets.only(left: 10, top: 0, right: 40, bottom: 0.0),
              icon: Icon(
                Icons.person_outline,
                size: 38.0,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Profile()),
                );
              }),
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(top: 30, left: 50),
        child: Row(children: [
          Expanded(
            child: UploadImage(api: "",),
          ),
          Expanded(child: Text(" asds", style: TextStyle(color: Colors.white),)),

          Expanded(
            child: MultiLevel(),
          ),
        ]),
      ),
    );
  }
}
