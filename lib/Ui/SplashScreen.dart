import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:untitled/Const%20Color/Const%20Colors.dart';
import 'package:untitled/Ui/SignIn/SignUp%20Screen/SignIn.dart';

import 'HomeScreen/HomeScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var currentUser = FirebaseAuth.instance.currentUser;
  Future<void> checkUser() async {
    await Future.delayed(const Duration(seconds: 2)).then((value) {

        if(currentUser != null){
          const HomeScreen().launch(context,isNewTask: true);
        } else{
          const SignInScreen().launch(context,isNewTask: true);
        }

    });
  }
  @override
  void initState() {
    checkUser();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bloodColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 70,
              backgroundColor: Colors.white,
              child: Lottie.asset('images/blood.json'),
            )
          ],
        ),
      ),
    );
  }
}
