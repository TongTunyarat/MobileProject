import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/foundation.dart';
import 'package:project_v1/home.dart';
import 'package:project_v1/Login/singup_page.dart';

class SinginPage extends StatefulWidget {
  const SinginPage({Key? key}) : super(key: key);

  @override
  _SinginPageState createState() => _SinginPageState();
}

class _SinginPageState extends State<SinginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage("assets/images/2.png"),
              colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.75),
                BlendMode.modulate,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Flexible(
                child: Align(
                  child: Container(
                      height: MediaQuery.of(context).size.height * 0.7,
                      width: MediaQuery.of(context)
                          .size
                          .width, //เป็นset size ของหน้าจอ
                      margin: EdgeInsets.only(left: 32, right: 32),
                      padding: EdgeInsets.only(left: 24, right: 24),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            buildwellcome(),
                            buildTextFieldEmail(),
                            buildTextFieldPassword(),
                            buildButtonSinIn(),
                            buildOtherLine(),
                            buildButtonSignUp(context),
                          ],
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildwellcome() {
    return Container(
        margin: EdgeInsets.only(top: 1),
        child: Column(children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.brown.shade800,
            backgroundImage: AssetImage('assets/images/user.png'),
            radius: 80,
          ),
          Padding(
              padding: EdgeInsets.all(12),
              child: Text(
                "Sign In",
                style: TextStyle(
                  foreground: Paint()
                    ..shader = LinearGradient(
                      colors: <Color>[
                        Color.fromARGB(255, 255, 255, 255),
                        //Color(0xFFFAF5E4),
                        Color.fromARGB(
                            255, 255, 255, 255), //add more color here.
                      ],
                    ).createShader(Rect.fromLTWH(50.0, 0.0, 100.0, 50.0)),
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      blurRadius: 20.0, // shadow blur
                      color: Color.fromARGB(255, 0, 0, 0), // shadow color
                      offset: Offset(5, 3), // how much shadow will be shown
                    ),
                  ],
                ),
              )),
        ]));
  }

  Widget buildOtherLine() {
    return Container(
        margin: EdgeInsets.only(top: 16),
        child: Row(children: <Widget>[
          Expanded(
              child: Divider(
                  color:
                      Color.fromARGB(255, 255, 255, 255))), //เส้น --------- แรก
          Padding(
              padding: EdgeInsets.all(6),
              child: Text("Don't have an account?",
                  style: TextStyle(color: Colors.black87, fontSize: 15))),
          Expanded(
              child: Divider(
                  color: Color.fromARGB(
                      255, 255, 255, 255))), //เส้น --------- หลัง
        ]));
  }

  InkWell buildButtonSinIn() {
    return InkWell(
      child: Container(
          constraints: BoxConstraints.expand(height: 50),
          child: Text("Sign In",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.white)),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.amber[800],),
          margin: EdgeInsets.only(top: 20),
          padding: EdgeInsets.all(12)),
      onTap: () 
        async {
      if (emailController.text == "" || passwordController.text == "") {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            content: const Text('Please input username and password'),
            actions: <Widget>[
              TextButton(
                child: Icon(
                  Icons.arrow_back,
                  color: Color.fromARGB(255, 48, 182, 177),
                ),
                onPressed: () {
                  Navigator.pop(context, 'OK');
                },
              ),
            ],
          ),
        );
      } else {
        try {
          UserCredential userCredential =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text,
          );
          
          print("user login .");           
          analytics.logLogin();
          //analytics.logEvent("login", );
          // ignore: use_build_context_synchronously
          Navigator.pushReplacement( context,
          MaterialPageRoute(
                        builder: (context) => HomePage()));
        
          // The user is now signed in.
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            print('No user found for that email.');
          } else if (e.code == 'wrong-password') {
            print('Wrong password provided for that user.');
          }
        }
      }
    

      },


      
    );
  }

  InkWell buildButtonSignUp(BuildContext context) {
    return InkWell(
      child: Container(
          constraints: BoxConstraints.expand(height: 50),
          child: Text("Sign up",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.white)),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color:  Colors.amber[800],),
          margin: EdgeInsets.only(top: 16),
          padding: EdgeInsets.all(12)),
      onTap: () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => singup_Page()));

        //Navigator.pushNamed(context, '/signup');
      },
    );
  }

  Container buildTextFieldEmail() {
    return Container(
        padding: EdgeInsets.all(3),
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 40, 40, 40).withOpacity(0.5),
            borderRadius: BorderRadius.circular(16)),
        child: TextField(
            controller: emailController,
            decoration: InputDecoration(
              hintText: "Email",
              hintStyle: TextStyle(color: Color.fromARGB(255, 239, 237, 237)),
              border: InputBorder.none,
              icon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Icon(
                  Icons.person,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
                fontSize: 18, color: Color.fromARGB(255, 255, 255, 255))));
  }

  Container buildTextFieldPassword() {
    return Container(
        padding: EdgeInsets.all(3),
        margin: EdgeInsets.only(top: 12),
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 29, 29, 29).withOpacity(0.5),
            borderRadius: BorderRadius.circular(16)),
        child: TextField(
            obscureText: true,
            controller: passwordController,
            decoration: InputDecoration(
              hintText: "Password",
              hintStyle: TextStyle(color: Color.fromARGB(255, 239, 237, 237)),
              border: InputBorder.none,
              icon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Icon(
                  Icons.key,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
            style: TextStyle(
                fontSize: 18, color: Color.fromARGB(255, 255, 255, 255))));
  }
}
