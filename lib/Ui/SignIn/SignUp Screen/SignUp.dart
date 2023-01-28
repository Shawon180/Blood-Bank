import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:lottie/lottie.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../Const Color/Const Colors.dart';
import 'SignIn.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  TextEditingController fullName=TextEditingController();
  TextEditingController phone=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
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
              Text(' Already have an account? ',style: TextStyle(color: subTitleColor,),),
              GestureDetector(
                  onTap: (){Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  const SignInScreen()),
                  );},
                  child: Text('Login',style: TextStyle(color: mainColor,fontWeight: FontWeight.w700),)),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 18.0,left: 20,right: 20),
            child: Column(
              children: [
                Lottie.asset('images/blood.json',width: 100),

                const Text('Get registered',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.black,),),
                const SizedBox(height: 10,),



                AppTextField(
                  controller: fullName, // Optional
                  textFieldType: TextFieldType.NAME,
                  decoration: InputDecoration(hintText: 'Enter Your Full Name', fillColor:Colors.black12,filled: true,border: OutlineInputBorder(borderRadius: BorderRadius.circular(30),borderSide: BorderSide.none)),
                ),
                const SizedBox(height: 10,),
                AppTextField(
                  controller: phone, // Optional
                  textFieldType: TextFieldType.PHONE,
                  decoration: InputDecoration(hintText: 'Enter Your Phone No.', fillColor:Colors.black12,filled: true,border: OutlineInputBorder(borderRadius: BorderRadius.circular(30),borderSide: BorderSide.none)),
                ),

                const SizedBox(height: 10,),
                AppTextField(
                  controller: email, // Optional
                  textFieldType: TextFieldType.EMAIL,
                  decoration: InputDecoration(hintText: 'Enter Your Email Address', fillColor:Colors.black12,filled: true,border: OutlineInputBorder(borderRadius: BorderRadius.circular(30),borderSide: BorderSide.none)),
                ),
                const SizedBox(height: 10,),
                AppTextField(
                  controller: password, // Optional
                  textFieldType: TextFieldType.PASSWORD,
                  decoration: InputDecoration(hintText: 'Enter Your Password', fillColor:Colors.black12,filled: true, border: OutlineInputBorder(borderRadius: BorderRadius.circular(30),borderSide: BorderSide.none)),
                ),




                const SizedBox(height: 20,),

                GestureDetector(
                  onTap: ()async{
                    try {
                      EasyLoading.show(status: 'Signing Up...');
                      final credential =await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.text, password: password.text);
                      EasyLoading.showSuccess('Sign Up Successfully');
                    }on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        EasyLoading.showError('Weak Password');
                        print('The password provided is too weak.');
                      } else if (e.code == 'email-already-in-use') {
                        EasyLoading.showError('User Already Exist');
                        print('The account already exists for that email.');
                      }
                    }catch (e) {
                      EasyLoading.showError(e.toString());
                      print(e);
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.circular(30),

                    ),
                    alignment: Alignment.center,
                    child:  const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text('SIGN UP',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),),
                    ),
                  ),
                ),





              ],
            ),
          ),
        ),
      ),
    );
  }
}
