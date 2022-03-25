import 'package:flutter/material.dart';
import 'package:ui_design_four/Pages/songPage.dart';

import '../constant/consts.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF15212D),
            Color(0xFF151F2A)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  [
            Column(
              children: const [
                Text("Get Peace Of Mind",style: TextStyle(letterSpacing: 1.5, color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),),
                SizedBox(height: 7,),
                Text(" With Relaxing ",style: TextStyle(letterSpacing: 1.5, color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),),
                SizedBox(height: 7,),
                Text("Music",style: TextStyle(letterSpacing: 1.5, color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),),
              ],
            ),
            const SizedBox(height: 10,),
            Container(
                height: 360,
                width: MediaQuery.of(context).size.width,
                child: Image.asset("assets/image.png",fit: BoxFit.cover,)
            ),
            const SizedBox(height: 40,),
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width * .80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: kSecondaryColor
              ),
              child:  TextButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const SongPage()));
                },
                child: const Text("Let's Listen",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
