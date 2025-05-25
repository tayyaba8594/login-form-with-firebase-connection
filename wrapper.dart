import 'package:demo/homepage.dart';
import 'package:demo/login.dart';
//import 'package:demo/verifyemail.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class wrapper extends StatefulWidget {
  const wrapper({super.key});

  @override
  State<wrapper> createState() => _wrapperState();
}

class _wrapperState extends State<wrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
        builder :(context,snapshot){
            if (snapshot.hasData){
              // print(snapshot.data);
              // if(snapshot.data!.emailVerified){
              return Homepage();
            // } else {
            //   return Verify();
            // }
          } else {
            return login();
          }
        },
      ),
    );
  }
}
