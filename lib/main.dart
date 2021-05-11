import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //state the application state either (development or production ready)
      debugShowCheckedModeBanner: false,      
      home: TestForm(),
    );
  }
}
class TestForm extends StatefulWidget {
  @override
  _TestFormState createState() => _TestFormState();
}

class _TestFormState extends State<TestForm> {
  final email =  TextEditingController();
  final password = TextEditingController();
  
  final _formKey = GlobalKey<FormState>();
  
  bool isEmail = false;
  bool isPassword = false;

  bool _getIconEmail() {
    if (isEmail) {
      return isEmail;
    } else {
      return false;
    }
  }
  bool _getIconPassword() {
    if (isPassword) {
      return isPassword;
    } else {
      return false;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 80),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: "Sign In",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: "WELCOME BACK",
                              style: TextStyle(fontSize: 14, color: Colors.white70),                      
                            ),                 
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                          child: TextFormField(
                            controller: email,
                            onChanged: (value) {
                              if (email.text.length > 1) {
                                setState(() {
                                  isEmail = true;
                                });
                              } else {
                                isEmail = false;
                              }
                            },
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(25.0, 15.0, 25.0, 15.0),
                              hintText: "Email address",
                              fillColor: Colors.white,
                              filled: true,
                              suffixIcon: _getIconEmail()
                              ? Container(
                                margin: EdgeInsets.all(20),
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Icon(
                                  Icons.check,
                                  size: 10,
                                  color: Colors.white,
                                ),
                              )
                              : SizedBox(),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(9.0))),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                          child: TextFormField(
                            controller: password,
                            onChanged: (value) {
                              if (password.text.length > 4) {
                                setState(() {
                                  isPassword = true;
                                });
                              } else {
                                isPassword = false;
                            }},
                            obscureText: true,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(25.0, 15.0, 25.0, 15.0),
                              hintText: "Password",
                              fillColor: Colors.white,
                              filled: true,
                              suffixIcon: _getIconPassword()
                              ? Container(
                                  margin: EdgeInsets.all(20),
                                  padding: EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Icon(
                                    Icons.check,
                                    size: 10,
                                    color: Colors.white,
                                  ),
                              )
                              : SizedBox(),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(9.0))),
                          ),
                        ),
                        SizedBox(height: 15),
                        DefualtButton(
                          color: !isEmail ? Color(0xFF021A37) : Colors.blueAccent,
                          text: "Sign In",
                          press: () {
                            if (isEmail) {
                              print('i am valid');
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(height: 40),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: "Forgot Password?",
                            style: TextStyle(
                              fontSize: 12, color: Colors.white70),
                          ),
                        ),
                        SizedBox(height: 10),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: "Reset Password",
                            style: TextStyle(
                              fontSize: 12, color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  )
                ),
              ]
            )
          ]
        ),
      )
    );
  }
}

class DefualtButton extends StatelessWidget {
  const DefualtButton({Key key, this.text, this.press, this.color})
      : super(key: key);
  final String text;
  final Function press;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 315,
      height: (50),
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
        color: color,
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(fontSize: (18), color: Colors.white),
        ),
      ),
    );
  }
}         
