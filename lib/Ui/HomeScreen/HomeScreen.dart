import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nb_utils/nb_utils.dart';

import 'package:untitled/Model/BloodType.dart';

import '../../Const Color/Const Colors.dart';
import '../Registation Information/Blood List.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Text(
                      'Blood Bank stock near you!',
                      style: TextStyle(
                          color: mainColor,
                          fontWeight: FontWeight.w900,
                          fontSize: 20),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 300,

                      child: GridView.builder(
                          physics:  const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: bloodtype.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                          itemBuilder: (_, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: mainColor,
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                child: Column(
                                  children: [
                                Lottie.asset(bloodtype[index].imgUrl??'',
                                    width: 30, height: 30),
                                Text(bloodtype[index].bloodName ?? '',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,),)
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                    Container(
                      width: 80,
                      decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      alignment: Alignment.center,
                      child:  Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Lottie.asset('images/blood-donation.json',width: 50),
                            const Text(
                              'DONATE\n  NOW',
                              style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.w900),
                            ),
                          ],
                        ),
                      ),
                    ).onTap((){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  const RegistrationBloodList()),
                      );

                    }),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
