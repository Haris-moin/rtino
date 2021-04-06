import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:retinopathy/screens/Login.dart';
import 'package:retinopathy/screens/registration.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String img_location = 'assets/Images/info.jpg';
  String Userid= FirebaseAuth.instance.currentUser.uid;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),backgroundColor: Color.fromARGB(150, 79, 230, 202),
          actions: [
      Center(
      child: InkWell(
      onTap: () {
        
    },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text('logout', style: TextStyle(fontSize: 20.0)),
      ),
    ),
    ),
    ]
      ),
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.grey.withOpacity(0.7), BlendMode.dstATop),
              image: AssetImage(img_location),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: ListView(

              children: [
                SizedBox(
                  height: 40.0,
                ),
                Row(
                  children: [
                    Expanded(child:
                    Column(
                      children: [
                        Container(
                          child: StreamBuilder(
                            stream: FirebaseFirestore.instance.collection('history').snapshots(),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return Center(
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                                  ),
                                );
                              } else{

                                return Container(
                                  height: MediaQuery.of(context).size.height,
                                  width: MediaQuery.of(context).size.width/4,
                                  child: ListView.builder(
                                    padding: EdgeInsets.all(10.0),
                                    itemBuilder: (context, index){
                                      print(snapshot.data.docs[index]['Prediction']);
                                      if(snapshot.data.docs[index]['userid']==Userid) {
                                        return Container(
                                          margin: EdgeInsets.all(8),
                                          child:    Card(
                                            elevation: 50,
                                            shadowColor: Colors.black,
                                            color: Color.fromARGB(255,211,241,243),
                                            child: Container(

                                              child: Column(
                                                children: [
                                                  //'image name': name,

                                                  Container(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [ Text(
                                                        'Prediction :',
                                                        style: TextStyle(fontSize: 20.0,color: Colors.black,),),
                                                        Text(
                                                          snapshot.data.docs[index]['Prediction'],
                                                          style: TextStyle(fontSize: 20.0,color: Colors.black,),),
                                                        SizedBox(height: 10.0,),


                                                      ],

                                                    ),
                                                    margin: EdgeInsets.all(5),
                                                  ),
                                                  Container(
                                                    alignment: Alignment.topLeft,
                                                    margin: EdgeInsets.only(top:10, bottom: 10,left: 5),
                                                    child: Text(
                                                      'ImgName :',
                                                      style: TextStyle(fontSize: 20.0,color: Colors.black,),),
                                                  ),
                                                  SizedBox(height: 10.0,),
                                                  Container(
                                                    margin: EdgeInsets.only(top:10, bottom: 10,left: 5),
                                                    alignment: Alignment.topLeft,
                                                    child:   Text(
                                                      snapshot.data.docs[index]['image name'],
                                                      style: TextStyle(fontSize: 14.0,color: Colors.black,),),

                                                  ),
                                                  SizedBox(height: 10.0,),
                                                  Container(
                                                    alignment: Alignment.topLeft,
                                                    margin: EdgeInsets.only(top:10, bottom: 10,left: 5),
                                                    child: Text(
                                                      'Date :',
                                                      style: TextStyle(fontSize: 19.0,color: Colors.black,),),
                                                  ),
                                                  SizedBox(height: 10.0,),
                                                 Container(
                                                   margin: EdgeInsets.only(top:10, bottom: 10,left: 5),
                                                   alignment: Alignment.topLeft,
                                                   child:  Text(
                                                     snapshot.data.docs[index]['historydate'],
                                                     style: TextStyle(fontSize: 16.0,color: Colors.black,),),
                                                 ),
                                                  SizedBox(height: 10.0,),
                                                ],
                                              ),
                                            ),

                                          ),

                                        );
                                      }
                                      else{
                                        return Container();
                                      }
                                    },
                                    itemCount: snapshot.data.docs.length,
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    )
                    ),
                    Expanded(child: Text('')),
                    Container(

                      margin: EdgeInsets.only(right: 10,bottom: 250),
    decoration: BoxDecoration(
    color:  Colors.white,
    shape: BoxShape.rectangle,
    borderRadius: BorderRadius.only(
    topLeft: Radius.circular(25.0),
    bottomRight: Radius.circular(25.0))),

                      child: Card(
                        elevation: 50,
                        shadowColor: Colors.green,
    color: Colors.white,
                        margin: EdgeInsets.all(10),


                        child: SizedBox(
                          width: 240,

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [

                              CircleAvatar(

                                backgroundColor: Colors.greenAccent[100],
                                backgroundImage: NetworkImage(
                                    'assets/Images/blank-profile-pic.png'), //NetworkImage
                                radius: 100,
                              ), //CircleAvatar

                              SizedBox(
                                height: 20,
                              ), //SizedBox
                              Container(
                                child: StreamBuilder(
                                  stream: FirebaseFirestore.instance.collection('users').where('id',isEqualTo: Userid).snapshots(),
                                  builder: (context, snapshot) {
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: CircularProgressIndicator(
                                          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                                        ),
                                      );
                                    } else {
                                      return Container(
                                        height: MediaQuery.of(context).size.height/3,
                                        width: MediaQuery.of(context).size.width/3,
                                        child: ListView.builder(
                                          itemBuilder: (context, index){
                                            return Container(
                                                child:  Column(

                                                  children: [

                                                    Text(snapshot.data.docs[index]['name'],style: TextStyle(
                                                      fontSize: 25,
                                                      color: Colors.black54,
                                                      fontWeight: FontWeight.w500,
                                                    ),),
                                                    SizedBox(height: 10,),
                                                    Text(snapshot.data.docs[index]['email'],style: TextStyle(
                                                      fontSize: 25,
                                                      color: Colors.black54,
                                                      fontWeight: FontWeight.w500,
                                                    ),),
                                                    SizedBox(height: 10,),
                                                    Text(snapshot.data.docs[index]['phone'],style: TextStyle(
                                                      fontSize: 25,
                                                      color: Colors.black54,
                                                      fontWeight: FontWeight.w500,
                                                    ),),

                                                  ],
                                                )
                                            );
                                          },
                                          itemCount: snapshot.data.docs.length,
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                  ],
                ),

              ],
            ),
          )),
    );
  }

}
