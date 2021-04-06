import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'MultiClassOfVessels.dart';
import 'Profile.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(150, 79, 230, 202),
        title: Text('Retinopathy'),
        actions: [
          Center(
            child: InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('AboutUs', style: TextStyle(fontSize: 20.0)),
              ),
            ),
          ),
          Center(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MulticlassClassification()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
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
        child: ListView(
          children: [Column(
            children: [
              Container(
                child: Column(children: [
              /*  Container(
                    margin: EdgeInsets.only(top: 20,left: 20),
                    alignment: Alignment.topLeft,
                    child:Text('Our Advantages',style: TextStyle(color: Colors.brown,fontSize: 32,),) ,
                  ),
                  
               */
                  Card(
                    elevation: 50,
                    shadowColor: Colors.green,
                    child: Container(

                      margin: EdgeInsets.only(right: 10.0, left: 25.0,top: 25.0,bottom: 20.0),
                      child: Text('We aim to bring the power of AI in health care specially to save people from blindness  due to diabetic retinopathy by detecting it in earlier stages.' , style: TextStyle(fontSize: 20),),
                    ),
                  ),
                  Card(
                    elevation: 50,
                    shadowColor: Colors.green,
                    child: Container(

                      margin: EdgeInsets.all(5),
                      height: 170,

                      child: Row(
                        children: [
                          Container(
                            child: Image.asset('assets/Images/aretina.jpg'),
                          ),
                          Expanded(child: Container(
                            margin: EdgeInsets.all(10),
                            child: Text('Overall mean age of the subjects was 55.3 ( ± 8.9) years with male:female 1: 1.3. The diabetic retinopathy of any grade was detected 28.8% (151subjects out of 525). Out of them non-proliferative diabetic retinopathy (Mild tosevere) was 33.1%, proliferative diabetic retinopathy was 2.65%, clinically significant macular oedema + Non proliferative diabetic retinopathy was 50.33%,clinically significant macular oedema + proliferative diabetic retinopathy was4.64% and advanced diabetic retinopathy was 9.28%. 85 (56.29%) diabeticpatients had uncontrolled diabetes among all retinopathies. ',
                              style: TextStyle(
                                  fontSize: 18
                              ),),
                          ))
                        ],
                      ),
                    ),
                  )
                ],),
              ),
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(left: 10,right: 10),
                child: Row(
                  children: [
                    Expanded(
                        child: Card(
                          elevation: 50,
                          shadowColor: Colors.green,
                          margin: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Image.asset("assets/Images/HT-450x400.png",fit: BoxFit.contain),
                              ListTile(
                                title: Text('Dr. Humera Tariq'),
                                subtitle: Column(
                                  children: [
                                    Container(
                                        margin: EdgeInsets.only(top: 7,bottom: 7),
                                        alignment: Alignment.topLeft,
                                        child: Text('Supervisor',style: TextStyle(color: Colors.black87,fontSize: 16),)),
                                    Container( alignment: Alignment.topLeft,
                                        child: Text('humera@uok.edu.pk',style: TextStyle(color: Colors.black87,fontSize: 16),)),

                                  ],
                                ),
                              ),
                            ],
                          ),
                        )),
                    Expanded(
                        child: Container(
                          child: Card(
                          elevation: 50,
                          shadowColor: Colors.green,
                          margin: EdgeInsets.all(10),
                            child: Column(
                            children: [
                              Container(

                              child: Image.asset("assets/Images/chandan.jpg",fit: BoxFit.cover),),
                            ListTile(
                              title: Text('Chandan Velji'),
                              subtitle: Column(
                                children: [
                                  Container(
                                      margin: EdgeInsets.only(top: 7,bottom: 7),
                                      alignment: Alignment.topLeft,
                                      child: Text('AI Engineer',style: TextStyle(color: Colors.black87,fontSize: 16),)),
                                  Container(
                                      alignment: Alignment.topLeft,
                                      child: Text('chandanlalan123@gmail.com',style: TextStyle(color: Colors.black87,fontSize: 16),)),

                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
                    Expanded(child: Container(
                      child: Card(
                        elevation: 50,
                        shadowColor: Colors.green,
                        margin: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Container(

                              child: Image.asset("assets/Images/asad.jpg",fit: BoxFit.cover),),
                            ListTile(
                              title: Text('Ali Asad'),
                              subtitle: Column(
                                children: [
                                  Container(
                                      margin: EdgeInsets.only(top: 7,bottom: 7),
                                      alignment: Alignment.topLeft,
                                      child: Text('Backend Developer',style: TextStyle(color: Colors.black87,fontSize: 16),)),
                                  Container( alignment: Alignment.topLeft,
                                      child: Text('aliasad71734@gmail.com',style: TextStyle(color: Colors.black87,fontSize: 16),)),

                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
                    Expanded(child: Container(

                      child: Card(
                        elevation: 50,
                        shadowColor: Colors.green,
                        margin: EdgeInsets.all(10),
                        child: Container(

                          child: Column(
                            children: [
                              Container(

                                child: Image.asset("assets/Images/haris.jpg",fit: BoxFit.cover),),
                              ListTile(
                                title: Text('M. Haris Moin'),
                                subtitle: Column(
                                  children: [
                                    Container(
                                        margin: EdgeInsets.only(top: 7,bottom: 7),
                                        alignment: Alignment.topLeft,
                                        child: Text('Web Developer',style: TextStyle(color: Colors.black87,fontSize: 16),)),
                                    Container(
                                      alignment: Alignment.topLeft,
                                        child: Text('harismoin48@gmail.com',style: TextStyle(color: Colors.black87,fontSize: 16),)),

                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(

                      child: Text('Acknowledgment',style: TextStyle(fontSize: 25,color: Colors.brown),),
                      alignment: Alignment.topLeft,
                    ),
                    Card(
                      elevation: 50,
                      shadowColor: Colors.green,
                      child: Container(
                        child: Row(
                          children: [
                            Container(
                              child: Image.asset("assets/Images/logos-Patel-Hospital-02.png"),
                            ),
                            Expanded(child: Container(
                              child: Text('Retinal images were provided by Patel Hospital, a best platform for retinopathy screening.',style: TextStyle(fontSize: 25),),
                            ))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),],
        ),
      ),
    );
  }
}
