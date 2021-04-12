import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:materateloginapp/main.dart';
import 'package:materateloginapp/userPage.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool showPassword = false;
  String _name, _email, _password,_contactNumber;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () async {
              await Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()),
              );
            }),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: data.size.height,
          width: data.size.width,
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 40, right: 20, left: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextField(
                autofocus: true,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  hintText: "Enter name",
                  labelText: "Full Name",
                ),
                onChanged: (value) {
                  setState(() {
                    _name = value.trim();
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                autofocus: true,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  hintText: "Email",
                  labelText: "Email address",
                ),
                onChanged: (value) {
                  setState(() {
                    _email = value.trim();
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                autofocus: true,
                keyboardType: TextInputType.text,
                obscureText: !showPassword,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  hintText: "Password",
                  labelText: "Password",
                ),
                onChanged: (value) {
                  setState(() {
                    _password = value.trim();
                  });
                },
              ),
              Row(
                children: [
                  Checkbox(
                      value: this.showPassword,
                      onChanged: (bool value) {
                        setState(() {
                          this.showPassword = value;
                        });
                      }),
                  Text(
                    'Show Password',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
              TextField(
                autofocus: true,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  hintText: "Phone number",
                  labelText: "Contact Number",
                ),
                onChanged: (value) {
                  setState(() {
                    _contactNumber = value.trim();
                  });
                },
              ),
              SizedBox(
                height: 40,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  child: Text('Sign Up'),
                  onPressed: () async {
                    await auth
                        .createUserWithEmailAndPassword(
                            email: _email, password: _password)
                        .then(
                          (_) => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => UserPage()),
                          ),
                        );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
