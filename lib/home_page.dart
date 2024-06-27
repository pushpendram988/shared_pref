import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_pref_login/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget{


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
int Count = 0;
  var appOpenNo = 0;

  static const String PREF_OPEN_KEY = "appOpenNo";

  Future<void> ColorChange() async {

   var prefs = await SharedPreferences.getInstance();
  appOpenNo=  prefs.getInt(PREF_OPEN_KEY) ?? 0;

  appOpenNo++;
  print( " Change no $appOpenNo");

  prefs.setInt(PREF_OPEN_KEY, appOpenNo);
  setState(() {

  });

  }

  @override
  void initState() {
    super.initState();
    ColorChange();
  }

  Color  getBgColor(){
    Count++;
    print(Count);
    if(appOpenNo%3==0){
     return Colors.blue;
    } else if(appOpenNo%5==0){
     return Colors.orange;
    }else if(appOpenNo%3==0 && appOpenNo%5==0){
    return  Colors.green;
    } else{
    return  Colors.white;
    }

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: getBgColor(),


      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(21),

              ),
              label: Text('log out'),
            ),

          ),
          SizedBox(height: 11,),
          ElevatedButton(onPressed: ()async {
            var prefs =await SharedPreferences.getInstance();
          bool? check =   prefs.getBool(LoginPageState.Prefs_key_value ,);


          Widget firstPage = LoginPage();
          if(check !=null && check == true){
            firstPage ;
          }
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>
          firstPage
          ));

          }, child: Text('Log Out')),

        ],
      )
    );
  }
}