import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_firebase_crud/provider/todos.dart';
import 'package:todo_app_firebase_crud/screens/sign_in_screen.dart';
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'listly';

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => TodosProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: AnimatedSplashScreen(
            splash: Image.asset(
              'assets/images/dart.jpg'
              ),
              nextScreen: SignInScreen(),
              splashTransition: SplashTransition.sizeTransition,
              splashIconSize: 200,
              backgroundColor: Colors.white,
              duration: 3000,
              ),
          theme: ThemeData(
            primarySwatch: Colors.pink,
            scaffoldBackgroundColor: Color(0xFF3e418e),
          ),
        ),
      );
}