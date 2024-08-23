import 'package:flutter/material.dart';
import 'package:multi_role_based_app/homescreen.dart';
import 'package:multi_role_based_app/studentscreen.dart';
import 'package:multi_role_based_app/teacherscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailcontroller =TextEditingController();
  final passwordcontroller = TextEditingController();
  final agecontroller =TextEditingController();
  String? _selectedUserType;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: const Center(child: Text('LogIn',style: TextStyle(color: Colors.white,fontSize: 40),)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40,left: 50,right: 50,bottom: 10),
            child: TextFormField(
              controller: emailcontroller,

              decoration: InputDecoration(
                hintText:'Enter your Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.white)
                )
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50,right: 50),
            child: TextFormField(
              controller: passwordcontroller,
              obscuringCharacter: '*',
              obscureText: true,
              decoration: InputDecoration(
                  hintText:'Enter your Password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.black)
                  )
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50,right: 50,top: 10),
            child: TextFormField(
              controller: agecontroller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText:'Enter your Age',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.black)
                  )
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your age';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50, top: 10),
            child: DropdownButtonFormField<String>(
              value: _selectedUserType,
              hint: const Text('Select User Type'),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.black),
                ),
              ),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedUserType = newValue;
                });
              },
              items: <String>['Student', 'Teacher', 'HomeScreen']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select item';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top : 40),
            child:
            InkWell(
              onTap: ()async{
                SharedPreferences sp = await SharedPreferences.getInstance();
                sp.setString('email', emailcontroller.text.toString());
                sp.setString('age', agecontroller.text.toString());
                sp.setString('usertype', _selectedUserType ?? '');
                sp.setBool('islogin', true);
                if (sp.getString('usertype') == 'Student'){Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const StudentScreen()));
                }else if(sp.getString('usertype') == 'Teacher'){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const TeacherScreen()));
                }else if (sp.getString('usertype') == 'HomeScreen') {
                  {
                    Navigator.push(context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                  }
                }
              },
              child: Container(
                height: 40,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.black,
                ),
                child: const Center(child: Text('LogIn',style: TextStyle(color: Colors.white),)),
              ),
            ),
          )

        ],
      ),
    );
  }
}
