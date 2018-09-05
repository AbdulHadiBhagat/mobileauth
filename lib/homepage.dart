import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  String uId = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.uId = '';
    FirebaseAuth.instance.currentUser().then((user) {
      setState(() {
        uId = user.uid;
      });
    }).catchError((e) {
      print(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: uId == '' ? new Text('No User Logged In') : new Text('$uId'),
      ),
    );
  }
}
