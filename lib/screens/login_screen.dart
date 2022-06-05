// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter104_advanced_ui/components/curve_cliper.dart';
import 'package:flutter104_advanced_ui/screens/main_screen.dart';

class LoginScreen extends  StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.grey[200],
        child: Material(
          color: Colors.grey[200],
          child: Column(
            children: [
              ClipPath(
                clipper: CurveCliper(),
                child: Image(
                  height: MediaQuery.of(context).size.height/2.5,
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/login_background.jpg'),
                ),
              ),
              Text('Freeze',
              style: TextStyle(
                fontSize: 37,
                color: Colors.blue,
                letterSpacing: 4,
                fontWeight: FontWeight.bold


              ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon: Icon(Icons.email),
                    hintText: 'Email'
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon: Icon(Icons.lock),
                    hintText: 'Password'
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 60),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.blue,

                  ),
                  child: MaterialButton (
                    height: 50,
                      onPressed: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) =>  MainScreen(),));

                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.login,
                          color: Colors.white,
                          ),
                          Text(' Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 19,

                          ),),
                        ],
                      ),
                  )),
              Expanded(

                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Container(
                    height: 80,
                    width: double.infinity,
                    color: Colors.blue,
                    child: Center(
                      child: Text ('Dont Have An Account',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 23,

                        ),),
                    ),
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
