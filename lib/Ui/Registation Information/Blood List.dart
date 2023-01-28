import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled/Const%20Color/Const%20Colors.dart';

import '../../Model/BloodType.dart';
import '../Add Person.dart';

class RegistrationBloodList extends StatefulWidget {
  const RegistrationBloodList({Key? key}) : super(key: key);

  @override
  State<RegistrationBloodList> createState() => _RegistrationBloodListState();
}

class _RegistrationBloodListState extends State<RegistrationBloodList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Selected Blood Type',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: mainColor, fontSize: 20),
        ),
      ),

      body: ListView.builder(

          itemCount: bloodtype.length,
          itemBuilder: (_,index){
        return Padding(
          padding: const EdgeInsets.only(left: 8.0,right: 8.0),
          child: Card(

            child:ListTile(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  const AddNewStudent()),
                );
              },
              leading:Lottie.asset(bloodtype[index].imgUrl??'') ,

              title: Text(bloodtype[index].bloodName??'',style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            ) ,
          ),
        );
      }),
    );
  }
}
