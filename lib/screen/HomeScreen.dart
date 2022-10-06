import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasedatabase/screen/LoginScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  FirebaseAuth? auth;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initauth();
  }
  void initauth()async{
    var auth=await FirebaseAuth.instance!;
    setState(() {
      this.auth=auth;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Homescreen"),
        actions: [IconButton(onPressed: ()async {
          await FirebaseAuth.instance.signOut();
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>LoginScreen()));
        }, icon: Icon(Icons.logout))],
      ),
      body: Column(children: [
        SizedBox(
          height: 100,
        ),
        Text(auth!.currentUser!.email.toString()),
        //Text(FirebaseAuth.instance.currentUser!.displayName.toString())
      ]),
    );
  }
}
