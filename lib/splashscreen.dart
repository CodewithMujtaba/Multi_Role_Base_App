import 'dart:async';
import 'package:flutter/material.dart';
import 'package:multi_role_based_app/homescreen.dart';
import 'package:multi_role_based_app/loginscreen.dart';
import 'package:multi_role_based_app/studentscreen.dart';
import 'package:multi_role_based_app/teacherscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    islogin();
  }

  void islogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool islogin = sp.getBool('islogin') ?? false;
    String usertype = sp.getString('usertype') ?? '';

    if (islogin) {
      if (usertype == 'student') {
        Timer(const Duration(seconds: 2), () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) =>  const StudentScreen()));
        });
      } else if (usertype == 'teacher') {
        Timer(const Duration(seconds: 3), () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) =>  const TeacherScreen()));
        });
      } else if (usertype == '' || usertype == 'homescreen'){
        // Navigate to HomeScreen
        Timer(const Duration(seconds: 3), () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) =>  const HomeScreen()));
        });
      }
    }
    else {
      Timer(const Duration(seconds: 3), () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) =>  const LoginScreen()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Consider using an AssetImage for a faster loading local image
    // AssetImage('assets/splash.png')
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Image(
        image: NetworkImage(
            'https://images.pexels.com/photos/1162361/pexels-photo-1162361.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
        height: double.infinity,
        // Implement error handling for network image loading
      ),
    );
  }
}