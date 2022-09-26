import 'package:flutter/material.dart';
import 'package:todolistass/HomePage.dart';

class Splash extends StatefulWidget {


  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigatetohome();
  }

  navigatetohome()async{
  await Future.delayed(Duration(milliseconds: 1500),(){});
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child:  Container(
              height: MediaQuery.of(context).size.height,
              child: Image.asset('assets/images/todo.jpg',fit: BoxFit.fill,)),
        ),
      ),
    );
  }
}
