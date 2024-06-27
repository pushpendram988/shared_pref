
import 'package:flutter/material.dart';
import 'package:shared_pref_login/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => LoginPageState();

}
  class LoginPageState extends State<LoginPage> {
     static const String Prefs_key_value = 'Islogin';

  var loginController =  TextEditingController();
  var PassController =  TextEditingController();

    @override
    Widget build(BuildContext context) {
      return Scaffold(

        appBar: AppBar(
          backgroundColor: Colors.grey,
        ),
        body: Column(
          children: [
            Text('Login'),

            TextField(
              controller: loginController,

              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 1,  color: Colors.amber ,),
                  borderRadius: BorderRadius.circular(11),
                ),
                label: Text('name')
              ),
            ),
            TextField(
              controller: PassController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 1,  color: Colors.amber ,),
                    borderRadius: BorderRadius.circular(11),
                  ),
                  label: Text('name')
              ),
            ),
            SizedBox(height: 11,),
            ElevatedButton(onPressed: ()async {
            var prefs = await   SharedPreferences.getInstance();
            prefs.setBool(Prefs_key_value, true);

              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));

            }, child: Text('login')),
          ],
        ),
      );
    }
  }

