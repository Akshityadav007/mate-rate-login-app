import 'package:flutter/material.dart';
import 'package:materateloginapp/main.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ResetScreen extends StatefulWidget {
  @override
  _ResetScreenState createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    final auth = FirebaseAuth.instance;
    final data = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Password'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MyHomePage()),
          ),
        ),
      ),
      body: Container(
        height: data.height,
        width: data.width,
        padding: EdgeInsets.only(top: 40, right: 20, left: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: email,
              autofocus: true,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                hintText: "Email",
                labelText: "Email",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: ElevatedButton(
                child: Text('Reset Password'),
                onPressed: () async {
                  print("${email.text}");
                  await auth.sendPasswordResetEmail(email: email.text).then(
                        (value) => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => MyHomePage()),
                        ),
                      );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
