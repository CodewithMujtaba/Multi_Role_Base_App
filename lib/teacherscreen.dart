import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'loginscreen.dart';

class TeacherScreen extends StatefulWidget {
  const TeacherScreen({super.key});

  @override
  State<TeacherScreen> createState() => _TeacherScreenState();
}

class _TeacherScreenState extends State<TeacherScreen> {
  String email ='',age = '',usertype = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loaddata();
  }
  loaddata()async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    email = sp.getString('email')?? '';
    age = sp.getString('age')?? '';
    usertype = sp.getString('usertype')?? '';
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.teal,
          title: const Center(child: Text('Teacher Screen',style: TextStyle(color: Colors.white,fontSize: 30),))
      ),
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Email : '),
              Text(email.toString()),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Age : '),
              Text(age.toString()),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('UserType : '),
              Text(usertype.toString()),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          InkWell(
            onTap: ()async{
              SharedPreferences sp = await SharedPreferences.getInstance();
              sp.clear();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()));
            },
            child:  Center(
              child: Container(
                height: 40,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.black,
                ),
                child: const Center(child: Text('LogOut',style: TextStyle(color: Colors.white),)),
              ),
            ),
          )],

      ),

    );
  }
}
