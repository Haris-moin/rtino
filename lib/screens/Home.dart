import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:retinopathy/screens/aboutUs.dart';

import 'MultiClassOfVessels.dart';
import 'Profile.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                  MaterialPageRoute(builder: (context) => MulticlassClassification()),
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
      backgroundColor: Colors.white10,
      body: Container(
        child: ListView(
          children: [
            Card(
              elevation: 50,
              shadowColor: Colors.green,
              child: Container(

                decoration: new BoxDecoration(
                  boxShadow: [
                    new BoxShadow(
                      color: Colors.white30,
                      blurRadius: 20.0,
                    ),
                  ],
                ),
                child: CarouselSlider(
                  items: [
                    //1st Image of Slider
                    //4th Image of Slider
                    Card(
                      elevation: 50,
                      shadowColor: Colors.green,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.all(4.0),
                        child: Image(
                          image: AssetImage(
                              "assets/Images/diabetic-retinopathy11.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),

                    //5th Image of Slider
                    Card(
                      elevation: 50,
                      shadowColor: Colors.green,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        margin: EdgeInsets.all(4.0),
                        child: Image(
                          image: AssetImage(
                              "assets/Images/diabetic-retinopathy-759.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Card(
                      elevation: 50,
                      shadowColor: Colors.green,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        margin: EdgeInsets.all(4.0),
                        child: Image(
                          image: AssetImage(
                              "assets/Images/field_test_results_2400x1268.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Card(
                      elevation: 50,
                      shadowColor: Colors.green,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        margin: EdgeInsets.all(4.0),
                        child: Image(
                          image: AssetImage(
                              "assets/Images/banner-web-package-Diabetic.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Card(
                      elevation: 50,
                      shadowColor: Colors.green,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        margin: EdgeInsets.all(4.0),
                        child: Image(
                          image: AssetImage(
                              "assets/Images/GettyImages-523913019-header-1024x575.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],

                  //Slider Container properties
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.height / 2,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 500),
                    viewportFraction: 0.8,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(

              margin: EdgeInsets.only(left: 10,right: 10),
              child: Card(
                elevation: 50,
                shadowColor: Colors.green,
                child: Container(

                  margin: EdgeInsets.all(5),
                  decoration: new BoxDecoration(
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.black12,
                        blurRadius: 20.0,
                        spreadRadius: 5.0,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.all((7.0)),
                        child: Text(
                          'What is diabetic retinopathy?',
                          style: TextStyle(fontSize: 40.0, color: Colors.brown),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.all(8.0),
                        child: Text(
                          'Diabetic retinopathy is an eye condition that can cause vision loss and blindness in people who have diabetes. It affects blood vessels in the retina (the light-sensitive layer of tissue in the back of your eye).If you have diabetes, it’s important for you to get a comprehensive dilated eye exam at least once a year. Diabetic retinopathy may not have any symptoms at first — but finding it early can help you take steps to protect your vision.Managing your diabetes — by staying physically active, eating healthy, and taking your medicine — can also help you prevent or delay vision loss.',
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all((7.0)),
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Symptoms',
                          style: TextStyle(fontSize: 40.0, color: Colors.brown),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all((7.0)),
                        alignment: Alignment.topLeft,
                        child: Text(
                            'You might not have symptoms in the early stages of diabetic retinopathy. As the condition progresses, diabetic retinopathy symptoms may include:',
                            style: TextStyle(fontSize: 20.0)),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
