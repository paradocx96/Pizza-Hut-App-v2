
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizzahut/modules/homepage/screens/gets_started/gets_started_screen.dart';
import 'package:pizzahut/modules/homepage/screens/splash/components/body.dart';


class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    super.initState();
    _navigationToHome();
  }

  _navigationToHome()async{
    await Future.delayed(Duration(milliseconds: 3000), (){});
    //Navigator.push(context, MaterialPageRoute(builder: (context)=>GetsStartedScreen()));
    Navigator.pushReplacement<void, void>(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => GetsStartedScreen(),
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
