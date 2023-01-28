import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../Const Color/Const Colors.dart';
import '../../../Provider/SignInProvider.dart';
import 'SignUp.dart';
class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {


  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  var currentUser = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:  SizedBox(

        child: Padding(

          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('Don\'t have an account! ',style: TextStyle(color: subTitleColor,),),
              GestureDetector(
                onTap: (){Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  const SignUpScreen()),
                );},
                  child: Text('Register',style: TextStyle(color: mainColor,fontWeight: FontWeight.w700),)),
            ],
          ),
        ),
      ),
      body: Consumer(builder: (_,ref,watch) {
        final loginProvider = ref.watch(signInProvider);
        return SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 18.0,left: 20,right: 20),
              child: Column(
                children: [
                  Lottie.asset('images/blood.json',width: 100),

                  const Text('Login',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.black,),),
                  const SizedBox(height: 10,),

                  Text('Please enter the details below to continue',style: TextStyle(color: subTitleColor,fontSize: 14),),
                  const SizedBox(height: 20,),
                  AppTextField(
                      onChanged: (val){
                        loginProvider.email = val;
                      }, // Optional
                    textFieldType: TextFieldType.EMAIL,
                    decoration: InputDecoration(hintText: 'email', fillColor:Colors.black12,filled: true,border: OutlineInputBorder(borderRadius: BorderRadius.circular(30),borderSide: BorderSide.none)),
                  ),
                  const SizedBox(height: 10,),
                  AppTextField(
                    onChanged: (val){
                      loginProvider.password = val;
                    }, // Optional
                    textFieldType: TextFieldType.PASSWORD,
                    decoration: InputDecoration(hintText: 'password', fillColor:Colors.black12,filled: true, border: OutlineInputBorder(borderRadius: BorderRadius.circular(30),borderSide: BorderSide.none)),
                  ),

                  const SizedBox(height: 10,),
                  Row(mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Forgot Password?',style: TextStyle(color: mainColor,fontWeight: FontWeight.w700),),
                    ],
                  ),

                  const SizedBox(height: 20,),

                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.circular(30),

                    ),
                    alignment: Alignment.center,
                    child:  const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text('LOGIN',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),),
                    ),
                  ).onTap((){
                    loginProvider.signIn(context);
                  }),





                ],
              ),
            ),
          ),
        );
      },

      )
    );
  }
}
