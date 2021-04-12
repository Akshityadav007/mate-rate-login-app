import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:materateloginapp/resetPassword.dart';
import 'package:materateloginapp/signup.dart';
import 'package:materateloginapp/userPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String _email, _password;
  final auth = FirebaseAuth.instance;

  showPhoneLoginDialogBox(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: SingleChildScrollView(
              child: AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                title: Text('Enter Login Details'),
                content: Column(
                  children: [
                    TextField(
                      autofocus: true,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
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
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        hintText: "Enter Password",
                        labelText: "Password",
                      ),
                      onChanged: (value) {
                        setState(() {
                          _password = value.trim();
                        });
                      },
                    ),
                  ],
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Close'),
                  ),
                  TextButton(
                    onPressed: () async {
                    await  auth
                          .signInWithEmailAndPassword(
                              email: _email, password: _password)
                          .then(
                            (value) => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserPage()),
                            ),
                          );
                    },
                    child: Text('Login'),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            MaterialButton(
              onPressed: () {
                showPhoneLoginDialogBox(context);
              },
              child: Text(
                'Login',
                style: TextStyle(fontSize: 20),
              ),
              color: Colors.lightGreen,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SignUp()),
                );
              },
              child: Text(
                'Sign Up',
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: TextButton(
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ResetScreen()),
                ),
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
