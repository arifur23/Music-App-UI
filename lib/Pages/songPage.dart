import 'package:flutter/material.dart';
import 'package:ui_design_four/constant/consts.dart';

import '../Widgets/musicItems.dart';

class SongPage extends StatefulWidget {
  const SongPage({Key? key}) : super(key: key);

  @override
  State<SongPage> createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kthrdColor,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 10,bottom: 10,right: 10),
            child: Container(
              alignment: Alignment.center,
              height: 10,
              width: 35,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.1),
                  borderRadius: BorderRadius.circular(50)
              ),
              child: Stack(
                  children: [
                    Positioned(
                      top: -5,
                      right: -7,
                      child: IconButton(
                        onPressed: (){
                          // Navigator.pop(context);
                        },
                        icon : Icon(Icons.favorite_border, size: 25, color: Colors.white.withOpacity(.5),),
                      ),
                    ),
                  ]
              ),
            ),
          )
        ],
        leading: Padding(
          padding: const EdgeInsets.all(11.0),
          child: Container(
            alignment: Alignment.center,
            height: 22,
            width: 22,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.1),
              borderRadius: BorderRadius.circular(50)
            ),
            child: Stack(
              children: [
              Positioned(
                top: -7,
                right: -7,
                child: IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon : Icon(Icons.arrow_back, size: 25, color: Colors.white.withOpacity(.5),),
                ),
              ),
          ]
            ),
          ),
        ),
        backgroundColor: kthrdColor,
        elevation: 0,
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(delegate: SliverChildListDelegate(
            [
              Column(
                children: [
                  Column(
                    children: [
                      const Text("Sleep Tight",style: PageHeading,),
                      const SizedBox(height: 7,),
                      Text("Sleep Relaxing",style: PageHeadingSmall,)
                    ],
                  ),
                  const SizedBox(height: 35,),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15)
                    ),
                    height: 260,
                    width: size.width * .90,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                        child: Image.asset("assets/image.png",fit: BoxFit.cover,)),
                  ),
                  const SizedBox(height: 40,),
                 MusicItems()
                ],
              )
            ]
          ))
        ],
      ),
    );
  }
}


