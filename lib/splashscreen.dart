import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_pref_login/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_page.dart';


class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() => SplashScreenState();
  }
  class SplashScreenState extends State<SplashScreen>{

  @override
  void initState() {
    super.initState();
    Timer(Duration( seconds: 1) ,  () async{


      var prefs = await SharedPreferences.getInstance();
    bool ?  check =   prefs.getBool(LoginPageState.Prefs_key_value);

    Widget nextPage = LoginPage();

    if(check!=null && check == true){
      nextPage = HomePage();
    }
    Navigator.pushReplacement(context, MaterialPageRoute(builder:
        (context)=>nextPage));
    /*if(check!= null) {
      if (check) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      }
    } else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginPage()));
    }*/
    });
  }
void LogIn () async{

await  Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=> LoginPage()));
}
    @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
        ),
        body: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Flutter Spalsh page Page'),
            FlutterLogo(),
          ],
        )),
      );
  }

  }
