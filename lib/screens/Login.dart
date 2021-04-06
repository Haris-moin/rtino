import 'package:flutter/material.dart';
import 'package:retinopathy/Services/UserRegister.dart';
import 'package:retinopathy/screens/Home.dart';
import 'registration.dart';

class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isRegistering = false;
  TextEditingController textControllerEmail;
  TextEditingController textControllerPassword;
  bool _isEditingEmail = false;
  FocusNode textFocusNodeEmail;
  FocusNode textFocusNodePassword;
  bool _isEditingPassword = false;

  @override
  void initState() {
    textControllerEmail = TextEditingController();
    textControllerPassword = TextEditingController();
    textControllerEmail.text = null;
    textControllerPassword.text = null;
    textFocusNodeEmail = FocusNode();
    textFocusNodePassword = FocusNode();

    super.initState();
  }



  String _validateEmail(String value) {
    value = value.trim();

    if (textControllerEmail.text != null) {
      if (value.isEmpty) {
        return 'Email can\'t be empty';
      } else if (!value.contains(RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))) {
        return 'Enter a correct email address';
      }
    }

    return null;
  }

  String _validatePassword(String value) {
    value = value.trim();
    if (textControllerPassword.text != null) {
      if (value.isEmpty) {
        return 'Password can\'t be empty';
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text('Retinopathy'),backgroundColor: Color.fromARGB(150, 79, 230, 202),),
      body: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 38, bottom: 25),
              child: Text(
                'Log In',
                style: TextStyle(
                    fontSize: 34.0,
                    color: Colors.black54,
                    fontWeight: FontWeight.w700),
              ),
            ),
            // Container(
            //     margin: EdgeInsets.symmetric(vertical: 32, horizontal: 110),
            //     child: TextField(
            //       decoration: InputDecoration(
            //         border: OutlineInputBorder(),
            //         labelText: 'Name',
            //       ),
            //     )),
            Container(
                margin: EdgeInsets.symmetric(vertical: 32, horizontal: 110),
                child: TextField(
                  focusNode: textFocusNodeEmail,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  controller: textControllerEmail,
                  autofocus: false,
                  onChanged: (value) {
                    setState(() {
                      _isEditingEmail = true;
                    });
                  },
                  onSubmitted: (value) {
                    textFocusNodeEmail.unfocus();
                    FocusScope.of(context).requestFocus(textFocusNodePassword);
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: "Email",
                    fillColor: Colors.white,
                    errorText: _isEditingEmail
                        ? _validateEmail(textControllerEmail.text)
                        : null,
                    errorStyle: TextStyle(
                      fontSize: 12,
                      color: Colors.redAccent,
                    ),
                  ),
                )),
            Container(
                margin: EdgeInsets.symmetric(vertical: 32, horizontal: 110),
                child: TextField(
                  focusNode: textFocusNodePassword,

                  textInputAction: TextInputAction.next,
                  controller: textControllerPassword,
                  autofocus: false,
                  obscureText: true,
                  onChanged: (value) {
                    setState(() {
                      _isEditingPassword = true;
                    });
                  },
                  onSubmitted: (value) {
                    textFocusNodePassword.unfocus();
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',

                     hintText: "Password",
                    fillColor: Colors.white,
                    errorText: _isEditingPassword
                        ? _validatePassword(textControllerPassword.text)
                        : null,
                    errorStyle: TextStyle(
                      fontSize: 12,
                      color: Colors.redAccent,
                    ),
                  ),
                )),
            Container(
              width: 400.0,
              height: 50,
              margin: EdgeInsets.symmetric(vertical: 40, horizontal: 40),
              child: RaisedButton(
                // padding: EdgeInsets.all(1.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(color: Colors.red)),
                textColor: Colors.white,
                color: Colors.redAccent,
                onPressed: () async {
                  if (_validateEmail(textControllerEmail.text) == null &&
                      _validatePassword(textControllerPassword.text) == null) {
                    setState(() {
                      _isRegistering = true;
                    });
                    await signInWithEmailPassword(textControllerEmail.text,
                            textControllerPassword.text)
                        .then((result) {
                          if (result != null) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return Home();
                            },
                          ),
                        );
                      }
                      print(result);
                    }).catchError((error) {
                      print('Login Error: $error');
                      LoginAlert(context);
                    });
                  }
                  setState(() {
                    _isRegistering = false;
                    _isEditingEmail = false;
                  });
                },
                child: Text(
                  'LogIn',
                  style: TextStyle(fontSize: 26.0),
                ),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      'Don\'t have account?',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Registration()),
                        );
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  LoginAlert(BuildContext context ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: AlertDialog(
            title: Text('incorrect email or password'
                ),

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

}