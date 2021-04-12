import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class UserPage extends StatefulWidget {

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('User Page'),
          centerTitle: true,
        ),
        body: Container(
          height: data.size.height,
          width: data.size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('User has been logged in successfully'),
              SizedBox(height: 20,),
              TextButton(
                  onPressed: () async {
                    await auth.signOut().then(
                          (value) => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => MyHomePage()),
                          ),
                        );
                  },
                  child: Text('Logout'))
            ],
          ),
        ),
      ),
    );
  }
}
