import 'package:flutter/material.dart';
import 'package:retinopathy/Services/UserRegister.dart';
import 'package:retinopathy/screens/Login.dart';

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  bool _isRegistering = false;
  TextEditingController textControllerEmail;
  TextEditingController textControllerPassword;
  TextEditingController textControllerName;
  TextEditingController textControllerPhone;
  bool _isEditingEmail = false;
  FocusNode textFocusNodeEmail;
  FocusNode textFocusNodePassword;
  FocusNode textFocusNodeName;
  FocusNode textFocusNodePhone;
  bool _isEditingPassword = false;
  bool _isEditingPhone = false;
  bool _isEditingName = false;

  @override
  void initState() {
    textControllerEmail = TextEditingController();
    textControllerPassword = TextEditingController();
    textControllerName = TextEditingController();
    textControllerPhone = TextEditingController();

    textFocusNodeEmail = FocusNode();
    textFocusNodePassword = FocusNode();
    textFocusNodeName = FocusNode();
    textFocusNodePhone = FocusNode();

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

  String _validatename(String value) {
    value = value.trim();
    if (textControllerName.text != null) {
      if (value.isEmpty) {
        return 'Name can\'t be empty';
      }
    }
    return null;
  }

  String _validatePhone(String value) {
    value = value.trim();
    if (textControllerPhone.text != null) {
      if (value.isEmpty) {
        return 'Phone no can\'t be empty';
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
        child: ListView(
          children: [ Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 38, bottom: 25),
                child: Text(
                  'SignUp',
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
                  margin: EdgeInsets.symmetric(vertical: 16, horizontal: 110),
                  child: TextField(
                    focusNode: textFocusNodeName,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    controller: textControllerName,
                    autofocus: false,
                    onChanged: (value) {
                      setState(() {
                        _isEditingName = true;
                      });
                    },
                    onSubmitted: (value) {
                      setState(() => textControllerName.text = value);
                      textFocusNodeName.unfocus();
                      FocusScope.of(context).requestFocus(textFocusNodeEmail);
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Name',
                      hintText: "Name",
                      fillColor: Colors.white,
                      errorText: _isEditingName
                        ? _validatename(textControllerName.text)
                        : null,


                      errorStyle: TextStyle(
                        fontSize: 12,
                        color: Colors.redAccent,
                      ),
                    ),
                  )),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 16, horizontal: 110),
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
                      setState(() => textControllerEmail.text = value);
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
                  margin: EdgeInsets.symmetric(vertical: 16, horizontal: 110),
                  child: TextField(
                    focusNode: textFocusNodePassword,
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.next,
                    controller: textControllerPassword,
                    autofocus: false,
                    onChanged: (value) {
                      setState(() {
                        _isEditingPassword = true;
                      });
                    },
                    onSubmitted: (value) {
                      setState(() => textControllerPassword.text = value);
                      textFocusNodePassword.unfocus();
                    },
                    obscureText: true,
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
                  margin: EdgeInsets.symmetric(vertical: 16, horizontal: 110),
                  child: TextField(
                    focusNode: textFocusNodePhone,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    controller: textControllerPhone,
                    autofocus: false,
                    onChanged: (value) {
                      setState(() {
                        _isEditingPhone = true;
                      });
                    },
                    onSubmitted: (value) {
                      setState(() => textControllerPhone.text = value);
                      textFocusNodePhone.unfocus();

                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Phone Number',
                      hintText: "Phone Number",
                      fillColor: Colors.white,
                      errorText: _isEditingPhone
                        ? _validatePhone(textControllerPhone.text)
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
                    print(textControllerName.text);
                    print(textControllerPassword.text);
                    print(textControllerEmail.text);
                    print(textControllerPhone.text);
                    if (_validateEmail(textControllerEmail.text) == null &&
                        _validatePassword(textControllerPassword.text) == null) {
                      setState(() {
                        _isRegistering = true;
                      });
                      print(textControllerName.text);
                      print(textControllerPassword.text);
                      print(textControllerEmail.text);
                      print(textControllerPhone.text);
                      await registerWithEmailPassword(textControllerEmail.text,
                          textControllerPassword.text, textControllerName.text, textControllerPhone.text)
                          .then((result) {
                        if (result != null) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return Login();
                              },
                            ),
                          );
                        }
                        print(result);
                      }).catchError((error) {
                        print('Registration Error: $error');
                        RegiterAlert(context);
                      });
                    }
                    setState(() {
                      _isRegistering = false;
                      _isEditingEmail = false;
                    });
                  },
                  child: Text(
                    'SignUp',
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
                        'Already Have account?',
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
                            MaterialPageRoute(builder: (context) => Login()),
                          );
                        },
                        child: Text(
                          'Login',
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
          ),],
        )
      ),
    );
  }
  RegiterAlert(BuildContext context) {
    showDialog(
      context: context,

      builder: (BuildContext context) {
        return Center(
          child: AlertDialog(
            title: Text('incorrect email or The email address is already in use by another account.'
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
