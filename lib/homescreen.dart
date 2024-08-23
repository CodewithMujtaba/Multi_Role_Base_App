import 'package:flutter/material.dart';
import 'package:multi_role_based_app/loginscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String email ='',age = '',usertype ='';
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
        title: const Center(child: Text('MRBApp',style: TextStyle(color: Colors.white,fontSize: 30),))
      ),
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('HomeScreen',style: TextStyle(fontSize: 40),),
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
              const Text('Usertype : '),
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
