import 'dart:html';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:retinopathy/Services/UserRegister.dart';

class UploadImage extends StatefulWidget {
  final String api;

  const UploadImage({Key key, this.api}) : super(key: key);
  @override
  _UploadImageState createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  TextEditingController textControllerFeedbacks;
  void initState()
  {
    textControllerFeedbacks=  TextEditingController();
    Color black = Color(0xFF42A5F5);
    super.initState();
  }
  var img;
  Uint8List uploadedImage;
  var name;
  String Userid = FirebaseAuth.instance.currentUser.uid;
  _startFilePicker() async {
    InputElement uploadInput = FileUploadInputElement();
    uploadInput.click();

    uploadInput.onChange.listen((e) {
      final files = uploadInput.files;
      if (files.length == 1) {
        final file = files[0];
        FileReader reader =  FileReader();

        reader.onLoadEnd.listen((e) {
          setState(() {
            uploadedImage = reader.result;
            name = file.name;
          });
        });
        reader.onError.listen((fileEvent) {
        });
        reader.readAsArrayBuffer(file);
      }
    });
  }
  String result = "";
  bool loaderCheck = false;
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
          Container(
            margin: EdgeInsets.only(left: 25, top: 20, right: 0, bottom: 0),
            child: RaisedButton(
                padding: EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: Colors.white),
                ),
                onPressed: () async {
                  _startFilePicker();

                },
                child: Text(
                    'Select Image',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  color: Colors.green,
                )),
          SizedBox(height: 40.0),
          Container(
            height: 350.0,
            width: 350.0,
            child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Center(
                  child: uploadedImage != null ? Image.memory(uploadedImage) : Text('Please Upload Photo'),
                )),
          ),
          Container(
            margin: EdgeInsets.all(5),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed))
                      return Colors.lightGreen;
                    return Colors.green; // Use the component's default.
                  },
                ),
              ),
              child: Text("Send"),
              onPressed: () async {
                if(loaderCheck == false){
                  showLoadingDialog(context,_keyLoader);
                }
                Dio dio = new Dio();
                FormData formData = FormData.fromMap(
                  {
                    "file": MultipartFile.fromBytes(uploadedImage,filename: name)
                  }
                );
                //var response = await dio.post("https://ec2-18-189-28-240.us-east-2.compute.amazonaws.com:5000/predict", data: formData);
               // var response = await dio.post("http://127.0.0.1:5000/predict", data: formData);
                var response = await dio.post("http://ec2-3-136-161-13.us-east-2.compute.amazonaws.com:8080/predict", data: formData);


                setState(()  {
                  result = response.data['prediction'];
                  Navigator.of(_keyLoader.currentContext,rootNavigator: true).pop();
                  print(result);
                  History(result[1]);

                });
                showAlert(context);

              },
            ),
          ),
          result != "" ? Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/10),
            child: Text("Prediction: " + result[1],style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold,color: Colors.indigo),),
          ) : Container()
    ]));
  }



  static Future<void> showLoadingDialog(
      BuildContext context, GlobalKey key) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new WillPopScope(
              onWillPop: () async => false,
              child: SimpleDialog(
                  key: key,
                  backgroundColor: Colors.black54,
                  children: <Widget>[
                    Center(
                      child: Column(children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 10,),
                        Text("Please Wait....",style: TextStyle(color: Colors.blueAccent),)
                      ]),
                    )
                  ]));
        });
  }

  showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: AlertDialog(
            title: Text('Feedback'),
            content: Text("Please provide your feedback OR Skip",),
            actions: <Widget>[
              Container(
                width: 300,
                height: 40,
                child: TextField(
                  controller: textControllerFeedbacks,

                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Feedback',
                  ),
                ),
              ),
              FlatButton(
                child: Text("Submit"),
                onPressed: () {


                    if(textControllerFeedbacks.text.isNotEmpty) {
                      Feedbacks(textControllerFeedbacks.text, result);
                      setState(() {
                        textControllerFeedbacks.text= "";
                      });
                      Navigator.of(context).pop();
                      print(name);
                    }
                    else{
                      FeedbackAlert(context);
                    }

                  //Put your code here which you want to execute on Yes button click.

                },
              ),
              FlatButton(
                child: Text("Skip"),
                onPressed: () {

                  Navigator.of(context).pop();
                },
              ),

            ],
          ),
        );
      },
    );
  }
  FeedbackAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: AlertDialog(
            title: Text('Please Fill your feedback OR Skip'),

            actions: <Widget>[

              FlatButton(
                child: Text("ok"),
                onPressed: () {

                  Navigator.of(context).pop();
                },
              ),

            ],
          ),
        );
      },
    );
  }
  void History (String result) async
  {
    // Update data to server if new user
    FirebaseFirestore.instance.collection('history').doc().set(
        { 'userid': Userid,'image name': name, 'Prediction': result, 'historydate' : DateTime.now().toString()});
  }
  void Feedbacks (String result , String level) async
  {

print(level);
    // Update data to server if new user
    FirebaseFirestore.instance.collection('Feedbacks').doc().set(
        { 'userid': Userid, 'image name': name,'current level': level,'feedback': result, 'feedbackdate' : DateTime.now().toString()});

  }

}

