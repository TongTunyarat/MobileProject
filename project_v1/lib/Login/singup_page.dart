// // import 'package:firebase_database/firebase_database.dart';
// // import 'package:flutter/material.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:http/http.dart' as http;

// // class singup_Page extends StatefulWidget {
// //   singup_Page({Key? key}) : super(key: key);

// //   @override
// //   _singup_PageState createState() => _singup_PageState();
// // }

// // class _singup_PageState extends State<singup_Page> {

// //   final FirebaseAuth _auth = FirebaseAuth.instance;

// //   TextEditingController userController = TextEditingController();
// //   TextEditingController emailController = TextEditingController();
// //   TextEditingController passwordController = TextEditingController();
// //   TextEditingController repasswordController = TextEditingController();

// //   late DatabaseReference dbuser;

// //   void initState() {
// //     super.initState();
// //     dbuser = FirebaseDatabase.instance.ref().child("UserInfo");
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Stack(
// //         children: [
// //           Container(
// //               child: Image.asset('img/5.png'),
// //               color: Color(0xFFFAF5E4),
// //               height: MediaQuery.of(context).size.height * 0.5,
// //               width: MediaQuery.of(context).size.width),
// //           Align(
// //             alignment: Alignment.bottomCenter,
// //             child: Container(
// //               decoration: BoxDecoration(
// //                 borderRadius: BorderRadius.only(
// //                   topLeft: Radius.circular(25),
// //                   topRight: Radius.circular(25),
// //                 ),
// //                 color: Color(0xFF125B50),
// //               ),
// //               child: Container(
// //                   decoration: BoxDecoration(
// //                     borderRadius: BorderRadius.circular(30),
// //                     boxShadow: [
// //                       BoxShadow(
// //                         color: Color.fromARGB(255, 46, 54, 45), //New
// //                         blurRadius: 10.0,
// //                       )
// //                     ],
// //                     color: Color(0xFFF8B400),
// //                   ),
// //                   height: MediaQuery.of(context).size.height * 0.60,
// //                   width: MediaQuery.of(context)
// //                       .size
// //                       .width, //เป็นset size ของหน้าจอ
// //                   margin: EdgeInsets.all(32),
// //                   padding: EdgeInsets.all(24),
// //                   child: Column(
// //                     mainAxisSize: MainAxisSize.min,
// //                     mainAxisAlignment: MainAxisAlignment.center,
// //                     children: <Widget>[
// //                       buildTextFieldEmail(),
// //                       buildTextFieldUserName(),
// //                       buildTextFieldPassword(),
// //                       buildTextFieldPasswordConfirm(),
// //                       buildButtonSignUp(context),
// //                       buildOtherLine(),
// //                       buildButtonSinIn()
// //                     ],
// //                   )),
// //             ),
// //           ),
// //           // Container(
// //           //   color: Color(0xFFFAF5E4),
// //           // ),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget buildOtherLine() {
// //     return Container(
// //         margin: EdgeInsets.only(top: 16),
// //         child: Row(children: <Widget>[
// //           Expanded(
// //               child: Divider(color: Color(0xFF125B50))), //เส้น --------- แรก
// //           Padding(
// //               padding: EdgeInsets.all(6),
// //               child: Text("Have an account?",
// //                   style: TextStyle(color: Colors.black87, fontSize: 15))),
// //           Expanded(
// //               child: Divider(color: Color(0xFF125B50))), //เส้น --------- หลัง
// //         ]));
// //   }

// //   InkWell buildButtonSinIn() {
// //     return InkWell(
// //       child: Container(
// //           constraints: BoxConstraints.expand(height: 50),
// //           child: Text("Sign in",
// //               textAlign: TextAlign.center,
// //               style: TextStyle(fontSize: 18, color: Colors.white)),
// //           decoration: BoxDecoration(
// //               borderRadius: BorderRadius.circular(16),
// //               color: Color(0xFF125B50)),
// //           margin: EdgeInsets.only(top: 12),
// //           padding: EdgeInsets.all(12)),
// //       onTap: () {
// //         Navigator.pushNamed(context, '/singin');
// //       },
// //     );
// //   }

// //   InkWell buildButtonSignUp(BuildContext context) {
// //     return InkWell(
// //       child: Container(
// //           constraints: BoxConstraints.expand(height: 50),
// //           child: Text("Sign up",
// //               textAlign: TextAlign.center,
// //               style: TextStyle(fontSize: 18, color: Colors.white)),
// //           decoration: BoxDecoration(
// //               borderRadius: BorderRadius.circular(16),
// //               color: Color(0xFF125B50)),
// //           margin: EdgeInsets.only(top: 16),
// //           padding: EdgeInsets.all(12)),
// //       onTap: () {
// //         if (emailController.text == "" ||
// //             userController.text == "" ||
// //             passwordController.text == "" ||
// //             repasswordController.text == "") {
// //           showDialog<String>(
// //             context: context,
// //             builder: (BuildContext context) => AlertDialog(
// //               content: const Text('ใส่ให้มันครบๆ '),
// //               actions: <Widget>[
// //                 TextButton(
// //                   onPressed: () => Navigator.pop(context),
// //                   child: Icon(
// //                     Icons.arrow_back,
// //                     color: Color.fromARGB(255, 48, 182, 177),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           );
// //         } else if (passwordController.text != repasswordController.text) {
// //           showDialog<String>(
// //             context: context,
// //             builder: (BuildContext context) => AlertDialog(
// //               content: const Text('กรุณาใส่ pw ให้มันตรงกันด้วยดิ้'),
// //               actions: <Widget>[
// //                 TextButton(
// //                   onPressed: () => Navigator.pop(context),
// //                   child: Icon(
// //                     Icons.arrow_back,
// //                     color: Color.fromARGB(255, 48, 182, 177),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           );
// //         } else {
// //           showDialog<String>(
// //             context: context,
// //             builder: (BuildContext context) => AlertDialog(
// //               content: const Text('เสร็จแล้วก็ไป login ต่อเลยจ้า '),
// //               actions: <Widget>[
// //                 TextButton(
// //                     child: Icon(
// //                       Icons.arrow_back,
// //                       color: Color.fromARGB(255, 48, 182, 177),
// //                     ),
// //                     onPressed: () {
// //                       {
// //                         String user = userController.text.trim();
// //                         String email = emailController.text.trim();
// //                         String password = passwordController.text.trim();
// //                         String confirmPassword = repasswordController.text.trim();

// //                         if (password == confirmPassword &&
// //                             password.length >= 6) {

// //                           _auth
// //                               .createUserWithEmailAndPassword(
// //                                   email: email, password: password)
// //                               .then((user) {
// //                             print("Sign up user successful.");
// //                           }).catchError((error) {
// //                            print(error.message);
// //                           }
// //                           );

// //                           // _auth
// //                           //     .createUserWithEmailAndPassword(
// //                           //         email: email, password: password)
// //                           //     .then((user) {
// //                           //   print("Sign up user successful.");
// //                           // }).catchError((error) {
// //                           //  print(error.message);
// //                           // });


// //                         } else {
// //                           print("Password and Confirm-password is not match.");
// //                         }
// //                       }
// //                       // Map<String,String> newuser ={
// //                       // 'username' : userController.text,
// //                       // 'email': emailController.text,
// //                       // 'password': passwordController.text
// //                       // };
// //                       //dbuser.push().set(newuser);
// //                       Navigator.pushNamed(context, '/singin');
// //                     }),
// //               ],
// //             ),
// //           );
// //         }
// //         ;

// //         // Navigator.pushNamed(context, '/');
// //       },
// //     );
// //   }

// //   Container buildTextFieldUserName() {
// //     return Container(
// //         padding: EdgeInsets.all(3),
// //         margin: EdgeInsets.only(top: 12),
// //         decoration: BoxDecoration(
// //             color: Colors.yellow[50], borderRadius: BorderRadius.circular(16)),
// //         child: TextField(
// //             controller: userController,
// //             decoration: InputDecoration(
// //               hintText: "User Name",
// //               border: InputBorder.none,
// //               icon: const Icon(
// //                 Icons.person,
// //                 color: Color(0xFF125B50),
// //               ),
// //             ),
// //             keyboardType: TextInputType.emailAddress,
// //             style: TextStyle(fontSize: 18)));
// //   }

// //   Container buildTextFieldEmail() {
// //     return Container(
// //         padding: EdgeInsets.all(3),
// //         decoration: BoxDecoration(
// //             color: Colors.yellow[50], borderRadius: BorderRadius.circular(16)),
// //         child: TextField(
// //             controller: emailController,
// //             keyboardType: TextInputType.emailAddress,
// //             decoration: InputDecoration(
// //               hintText: "Email",
// //               border: InputBorder.none,
// //               icon: const Icon(
// //                 Icons.email,
// //                 color: Color(0xFF125B50),
// //               ),
// //               //contentPadding: EdgeInsets.all(0),
// //             ),
// //             style: TextStyle(fontSize: 18)));
// //   }

// //   Container buildTextFieldPassword() {
// //     return Container(
// //         padding: EdgeInsets.all(3),
// //         margin: EdgeInsets.only(top: 12),
// //         decoration: BoxDecoration(
// //             color: Colors.yellow[50], borderRadius: BorderRadius.circular(16)),
// //         child: TextField(
// //             obscureText: true,
// //             controller: passwordController,
// //             decoration: InputDecoration(
// //               hintText: "Password",
// //               border: InputBorder.none,
// //               icon: const Icon(
// //                 Icons.key,
// //                 color: Color(0xFF125B50),
// //               ),
// //             ),
// //             style: TextStyle(fontSize: 18)));
// //   }

// //   Container buildTextFieldPasswordConfirm() {
// //     return Container(
// //         padding: EdgeInsets.all(3),
// //         margin: EdgeInsets.only(top: 12),
// //         decoration: BoxDecoration(
// //             color: Colors.yellow[50], borderRadius: BorderRadius.circular(16)),
// //         child: TextField(
// //             obscureText: true,
// //             controller: repasswordController,
// //             decoration: InputDecoration(
// //                 hintText: "Re-password",
// //                 border: InputBorder.none,
// //                 icon: const Icon(
// //                   Icons.key,
// //                   color: Color(0xFF125B50),
// //                 )),
// //             style: TextStyle(fontSize: 18)));
// //   }
// // }

// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


// import 'package:flutter/material.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:http/http.dart' as http;
// import 'package:project_v1/Login/signin_page.dart';

// class singup_Page extends StatefulWidget {
//   singup_Page({Key? key}) : super(key: key);

//   @override
//   _singup_PageState createState() => _singup_PageState();
// }

// class _singup_PageState extends State<singup_Page> {

//   final FirebaseAuth _auth = FirebaseAuth.instance;


//   TextEditingController userController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController repasswordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: SingleChildScrollView(
//           child: Container(
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: const AssetImage("assets/images/2.png"),
//                 colorFilter: ColorFilter.mode(
//                   Colors.white.withOpacity(0.75),
//                   BlendMode.modulate,
//                 ),
//                 fit: BoxFit.cover,
//               ),
//             ),
//             child: Stack(
//               children: [
//                 Flexible(
//                   child: Align(
//                     child: Container(
//                         height: MediaQuery.of(context).size.height,
//                         width: MediaQuery.of(context)
//                             .size
//                             .width, //เป็นset size ของหน้าจอ
//                         margin: EdgeInsets.only(left: 32, right: 32),
//                         padding: EdgeInsets.only(left: 24, right: 24),
//                         child: SingleChildScrollView(
//                           child: Column(
//                             mainAxisSize: MainAxisSize.min,
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: <Widget>[
//                               buildwellcome(),
//                               buildTextFieldEmail(),
//                               buildTextFieldUserName(),
//                               buildTextFieldPassword(),
//                               buildTextFieldPasswordConfirm(),
//                               buildButtonSignUp(context),
//                               buildOtherLine(),
//                               buildButtonSinIn()
//                             ],
//                           ),
//                         )),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildwellcome() {
//     return Container(
//         margin: EdgeInsets.only(top: 1),
//         child: Column(children: <Widget>[
//           CircleAvatar(
//             backgroundColor: Colors.brown.shade800,
//             backgroundImage: AssetImage('assets/images/user.png'),
//             radius: 80,
//           ),
//           Padding(
//               padding: EdgeInsets.all(12),
//               child: Text(
//                 "Sign Up",
//                 style: TextStyle(
//                   foreground: Paint()
//                     ..shader = LinearGradient(
//                       colors: <Color>[
//                         Color.fromARGB(255, 255, 255, 255),
//                         //Color(0xFFFAF5E4),
//                         Color.fromARGB(
//                             255, 255, 255, 255), //add more color here.
//                       ],
//                     ).createShader(Rect.fromLTWH(50.0, 0.0, 100.0, 50.0)),
//                   fontSize: 35,
//                   fontWeight: FontWeight.bold,
//                   shadows: [
//                     Shadow(
//                       blurRadius: 20.0, // shadow blur
//                       color: Color.fromARGB(255, 0, 0, 0), // shadow color
//                       offset: Offset(5, 3), // how much shadow will be shown
//                     ),
//                   ],
//                 ),
//               )),
//         ]));
//   }

//   Widget buildOtherLine() {
//     return Container(
//         margin: EdgeInsets.only(top: 16),
//         child: Row(children: <Widget>[
//           Expanded(
//               child: Divider(
//                   color:
//                       Color.fromARGB(255, 255, 255, 255))), //เส้น --------- แรก
//           Padding(
//               padding: EdgeInsets.all(6),
//               child: Text("Have an account?",
//                   style: TextStyle(color: Colors.black87, fontSize: 15))),
//           Expanded(
//               child: Divider(
//                   color: Color.fromARGB(
//                       255, 255, 255, 255))), //เส้น --------- หลัง
//         ]));
//   }

//   InkWell buildButtonSinIn() {
//     return InkWell(
//       child: Container(
//           constraints: BoxConstraints.expand(height: 50),
//           child: Text("Sign in",
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 18, color: Colors.white)),
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(16),
//               color: Color.fromARGB(255, 37, 167, 254)),
//           margin: EdgeInsets.only(top: 12),
//           padding: EdgeInsets.all(12)),
//       onTap: () {
//         Navigator.pushReplacement( context,
//           MaterialPageRoute(
//                         builder: (context) => singup_Page( )));
//         //Navigator.pushNamed(context, '/signin');
//       },
//     );
//   }

//   InkWell buildButtonSignUp(BuildContext context) {
//     return InkWell(
//       child: Container(
//           constraints: BoxConstraints.expand(height: 50),
//           child: Text("Sign up",
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 18, color: Colors.white)),
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(16),
//               color: Color.fromARGB(255, 37, 167, 254)),
//           margin: EdgeInsets.only(top: 16),
//           padding: EdgeInsets.all(12)),
//       onTap: () {
//         if (emailController.text == "" ||
//             userController.text == "" ||
//             passwordController.text == "" ||
//             repasswordController.text == "") {
//           showDialog<String>(
//             context: context,
//             builder: (BuildContext context) => AlertDialog(
//               content: const Text('please input all data '),
//               actions: <Widget>[
//                 TextButton(
//                   onPressed: () => Navigator.pop(context),
//                   child: Icon(
//                     Icons.arrow_back,
//                     color: Color.fromARGB(255, 48, 182, 177),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         } else if (passwordController.text != repasswordController.text) {
//           showDialog<String>(
//             context: context,
//             builder: (BuildContext context) => AlertDialog(
//               content: const Text('password not match'),
//               actions: <Widget>[
//                 TextButton(
//                   onPressed: () => Navigator.pop(context),
//                   child: Icon(
//                     Icons.arrow_back,
//                     color: Color.fromARGB(255, 48, 182, 177),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         } else {
//           showDialog<String>(
//             context: context,
//             builder: (BuildContext context) => AlertDialog(
//               content: const Text('Sign up user successful'),
//               actions: <Widget>[
//                 TextButton(
//                     child: Icon(
//                       Icons.arrow_back,
//                       color: Color.fromARGB(255, 48, 182, 177),
//                     ),
//                     onPressed: () {
//                       {
//                         String user = userController.text.trim();
//                         String email = emailController.text.trim();
//                         String password = passwordController.text.trim();
//                         String confirmPassword = repasswordController.text.trim();

//                         if (password == confirmPassword &&
//                             password.length >= 6) {

//                           _auth
//                               .createUserWithEmailAndPassword(
//                                   email: email, password: password)
//                               .then((user) {
//                             print("Sign up user successful.");
//                           }).catchError((error) {
//                            print(error.message);
//                           }
//                           );

//                           // _auth
//                           //     .createUserWithEmailAndPassword(
//                           //         email: email, password: password)
//                           //     .then((user) {
//                           //   print("Sign up user successful.");
//                           // }).catchError((error) {
//                           //  print(error.message);
//                           // });


//                         } else {
//                           print("Password and Confirm-password is not match.");
//                         }
//                       }
//                       // Map<String,String> newuser ={
//                       // 'username' : userController.text,
//                       // 'email': emailController.text,
//                       // 'password': passwordController.text
//                       // };
//                       //dbuser.push().set(newuser);
//                       Navigator.pushNamed(context, '/singin');
//                     }
//                     ),
//               ],
//             ),
//           );
//         }
//         ;

//         // Navigator.pushNamed(context, '/');
//       },
//     );
//   }

//   Container buildTextFieldUserName() {
//     return Container(
//         padding: EdgeInsets.all(3),
//         margin: EdgeInsets.only(top: 12),
//         decoration: BoxDecoration(
//             color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
//             borderRadius: BorderRadius.circular(16)),
//         child: TextField(
//             controller: userController,
//             decoration: InputDecoration(
//               hintText: "User Name",
//               border: InputBorder.none,
//               icon: const Icon(
//                 Icons.person,
//                 color: Color.fromARGB(255, 255, 255, 255),
//               ),
//             ),
//             keyboardType: TextInputType.emailAddress,
//             style: TextStyle(
//                 color: Color.fromARGB(255, 255, 255, 255), fontSize: 18)));
//   }

//   Container buildTextFieldEmail() {
//     return Container(
//         padding: EdgeInsets.all(3),
//         decoration: BoxDecoration(
//             color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
//             borderRadius: BorderRadius.circular(16)),
//         child: TextField(
//             controller: emailController,
//             decoration: InputDecoration(
//               hintText: "Email",
//               border: InputBorder.none,
//               icon: const Icon(Icons.email,
//                   color: Color.fromARGB(255, 255, 255, 255)),
//               //contentPadding: EdgeInsets.all(0),
//             ),
//             keyboardType: TextInputType.emailAddress,
//             style: TextStyle(
//                 color: Color.fromARGB(255, 255, 255, 255), fontSize: 18)));
//   }

//   Container buildTextFieldPassword() {
//     return Container(
//         padding: EdgeInsets.all(3),
//         margin: EdgeInsets.only(top: 12),
//         decoration: BoxDecoration(
//             color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
//             borderRadius: BorderRadius.circular(16)),
//         child: TextField(
//             obscureText: true,
//             controller: passwordController,
//             decoration: InputDecoration(
//               hintText: "Password",
//               border: InputBorder.none,
//               icon: const Icon(
//                 Icons.key,
//                 color: Color.fromARGB(255, 255, 255, 255),
//               ),
//             ),
//             style: TextStyle(
//                 color: Color.fromARGB(255, 255, 255, 255), fontSize: 18)));
//   }

//   Container buildTextFieldPasswordConfirm() {
//     return Container(
//         padding: EdgeInsets.all(3),
//         margin: EdgeInsets.only(top: 12),
//         decoration: BoxDecoration(
//             color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
//             borderRadius: BorderRadius.circular(16)),
//         child: TextField(
//             obscureText: true,
//             controller: repasswordController,
//             decoration: InputDecoration(
//                 hintText: "Re-password",
//                 border: InputBorder.none,
//                 icon: const Icon(
//                   Icons.key,
//                   color: Color.fromARGB(255, 255, 255, 255),
//                 )),
//             style: TextStyle(
//                 color: Color.fromARGB(255, 255, 255, 255), fontSize: 18)));
//   }
// }

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:project_v1/Login/signin_page.dart';


class singup_Page extends StatefulWidget {
  singup_Page({Key? key}) : super(key: key);

  @override
  _singup_PageState createState() => _singup_PageState();
}

class _singup_PageState extends State<singup_Page> {

  final FirebaseAuth _auth = FirebaseAuth.instance;


  TextEditingController userController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
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
                        height: MediaQuery.of(context).size.height,
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
                              buildTextFieldUserName(),
                              buildTextFieldPassword(),
                              buildTextFieldPasswordConfirm(),
                              buildButtonSignUp(context),
                              buildOtherLine(),
                              buildButtonSinIn()
                            ],
                          ),
                        )),
                  ),
                )
              ],
            ),
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
                "Sign Up",
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
              child: Text("Have an account?",
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
          child: Text("Sign in",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.white)),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Color.fromARGB(255, 37, 167, 254)),
          margin: EdgeInsets.only(top: 12),
          padding: EdgeInsets.all(12)),
      onTap: () {
        Navigator.pushReplacement( context,
          MaterialPageRoute(
                        builder: (context) => SinginPage( )));
        //Navigator.pushNamed(context, '/signin');
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
              color: Color.fromARGB(255, 37, 167, 254)),
          margin: EdgeInsets.only(top: 16),
          padding: EdgeInsets.all(12)),
      onTap: () {
        if (emailController.text == "" ||
            userController.text == "" ||
            passwordController.text == "" ||
            repasswordController.text == "") {
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              content: const Text('please input all data '),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Icon(
                    Icons.arrow_back,
                    color: Color.fromARGB(255, 48, 182, 177),
                  ),
                ),
              ],
            ),
          );
        } else if (passwordController.text != repasswordController.text) {
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              content: const Text('password not match'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Icon(
                    Icons.arrow_back,
                    color: Color.fromARGB(255, 48, 182, 177),
                  ),
                ),
              ],
            ),
          );
        } else {
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              content: const Text('Sign up user successful'),
              actions: <Widget>[
                TextButton(
                    child: Icon(
                      Icons.arrow_back,
                      color: Color.fromARGB(255, 48, 182, 177),
                    ),
                    onPressed: () {
                      {
                        String user = userController.text.trim();
                        String email = emailController.text.trim();
                        String password = passwordController.text.trim();
                        String confirmPassword = repasswordController.text.trim();

                        if (password == confirmPassword &&
                            password.length >= 6) {

                          _auth
                              .createUserWithEmailAndPassword(
                                  email: email, password: password)
                              .then((user) {
                            print("Sign up user successful.");
                          }).catchError((error) {
                           print(error.message);
                          }
                          );

                          // _auth
                          //     .createUserWithEmailAndPassword(
                          //         email: email, password: password)
                          //     .then((user) {
                          //   print("Sign up user successful.");
                          // }).catchError((error) {
                          //  print(error.message);
                          // });


                        } else {
                          print("Password and Confirm-password is not match.");
                        }
                      }
                      // Map<String,String> newuser ={
                      // 'username' : userController.text,
                      // 'email': emailController.text,
                      // 'password': passwordController.text
                      // };
                      //dbuser.push().set(newuser);
                      Navigator.pushReplacement(
                         context, MaterialPageRoute(builder: (context) => SinginPage()));
                      //Navigator.pushNamed(context, '/singin');
                    }
                    ),
              ],
            ),
          );
        }
        ;

        // Navigator.pushNamed(context, '/');
      },
    );
  }

  Container buildTextFieldUserName() {
    return Container(
        padding: EdgeInsets.all(3),
        margin: EdgeInsets.only(top: 12),
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
            borderRadius: BorderRadius.circular(16)),
        child: TextField(
            controller: userController,
            decoration: InputDecoration(
              hintText: "User Name",
              border: InputBorder.none,
              icon: const Icon(
                Icons.person,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255), fontSize: 18)));
  }

  Container buildTextFieldEmail() {
    return Container(
        padding: EdgeInsets.all(3),
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
            borderRadius: BorderRadius.circular(16)),
        child: TextField(
            controller: emailController,
            decoration: InputDecoration(
              hintText: "Email",
              border: InputBorder.none,
              icon: const Icon(Icons.email,
                  color: Color.fromARGB(255, 255, 255, 255)),
              //contentPadding: EdgeInsets.all(0),
            ),
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255), fontSize: 18)));
  }

  Container buildTextFieldPassword() {
    return Container(
        padding: EdgeInsets.all(3),
        margin: EdgeInsets.only(top: 12),
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
            borderRadius: BorderRadius.circular(16)),
        child: TextField(
            obscureText: true,
            controller: passwordController,
            decoration: InputDecoration(
              hintText: "Password",
              border: InputBorder.none,
              icon: const Icon(
                Icons.key,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255), fontSize: 18)));
  }

  Container buildTextFieldPasswordConfirm() {
    return Container(
        padding: EdgeInsets.all(3),
        margin: EdgeInsets.only(top: 12),
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
            borderRadius: BorderRadius.circular(16)),
        child: TextField(
            obscureText: true,
            controller: repasswordController,
            decoration: InputDecoration(
                hintText: "Re-password",
                border: InputBorder.none,
                icon: const Icon(
                  Icons.key,
                  color: Color.fromARGB(255, 255, 255, 255),
                )),
            style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255), fontSize: 18)));
  }
}
