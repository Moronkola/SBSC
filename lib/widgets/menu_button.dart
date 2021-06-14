import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_firebase_crud/screens/user_info_screen.dart';
import 'package:todo_app_firebase_crud/utils/authentication.dart';

class MenuButton extends StatefulWidget {
  @override
  _MenuButtonState createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton> {
  bool _isSignedIn = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(),
      child: _isSignedIn
          ? CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF3e418e)),
            )
        : IconButton(
              icon: Icon(Icons.menu, color: Colors.white,),
              onPressed: () async {
                setState(() {
                  _isSignedIn = true;
                });
                User user =
                    await Authentication.signInWithGoogle(context: context);

                setState(() {
                  _isSignedIn = false;
                });

                if (user != null) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => UserInfoScreen(
                        user: user
                      ),
                    ),
                  );
                }
              },
            ),
    );
  }
}