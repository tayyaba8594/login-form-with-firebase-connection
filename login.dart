import 'package:demo/forgot.dart';
import 'package:demo/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();

  bool isloading=false;
signIn()async{
  setState(() {
    isloading=true;
  });
  // try{
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email.text, password: password.text);


 //  }on FirebaseAuthException catch(e){
 // Get.snackbar("error msg", e.code);
 //  }catch(e){
 //    Get.snackbar("error msg", e.toString()) ;
 //  }
 //  setState(() {
 //    isloading=false;
 //  });

}

  @override
  Widget build(BuildContext context) {
    return isloading?Center(child: CircularProgressIndicator(),):Scaffold(
        appBar: AppBar(title: Text("Login"),),
      body:Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(controller: email,
            decoration:   InputDecoration(hintText: 'Enter Your Email'),
            ),
          // validator: (value){
          //   if
          // }
          TextField(controller: password,
            decoration:   InputDecoration(hintText: 'Enter Your Password'),
          ),
            ElevatedButton(onPressed: (()=>signIn()), child: Text("Login")),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: (()=>Get.to(Signup())), child: Text("Register Now !")),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: (()=>Get.to(forgot())), child: Text("Forgot Password ?"))
          ],
        ),
      )
    );
  }
}
