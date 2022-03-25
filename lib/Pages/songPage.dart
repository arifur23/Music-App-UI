import 'package:flutter/material.dart';
import 'package:ui_design_four/constant/consts.dart';

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
      backgroundColor: kthdColor,
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
                        icon : Icon(Icons.favorite, size: 25, color: Colors.white.withOpacity(.5),),
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
        backgroundColor: kthdColor,
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
                        child: Image.asset("assets/images.jpg",fit: BoxFit.cover,)),
                  ),
                  const SizedBox(height: 40,),
                 Column(
                   children: [
                     Container(
                       height: 30,
                       width: size.width,
                       child: SliderClass(),
                     ),
                     const SizedBox(height: 8,),
                     Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 24),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Text("22.2",style: SongTimeStyle,),
                           Text("44.0",style: SongTimeStyle,),
                         ],
                       ),
                     ),
                     // const SizedBox(height: 8,),
                     Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 137),
                       child: Row(
                         children:  [
                           const IconButton(
                             onPressed: null,
                             icon: Icon(Icons.skip_next,color: Colors.white,),
                             color: Colors.white,
                           ),
                           const SizedBox(width: 6,),
                           Container(
                             height: 35,
                             width: 35,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(50),
                               color: kSecondaryColor
                             ),
                             child: Stack(
                               children: const [
                               Positioned(
                                 top: -6,
                                 left: -6,
                                 child: IconButton(
                                 onPressed: null,
                                 icon: Icon(Icons.pause,color: Colors.black,size: 27,),
                                 ),
                               )],
                             ),
                           ),
                           const IconButton(
                             onPressed: null,
                             icon: Icon(Icons.skip_previous,color: Colors.white,),
                             color: Colors.white,
                           )
                         ],
                       ),
                     )
                   ],
                 )
                ],
              )
            ]
          ))
        ],
      ),
    );
  }
}


class SliderClass extends StatefulWidget {
  const SliderClass({Key? key}) : super(key: key);

  @override
  State<SliderClass> createState() => _SliderClassState();
}

class _SliderClassState extends State<SliderClass> {
  double Cvalue = 20;
  @override
  Widget build(BuildContext context) {

    return Slider(
      value: Cvalue,
      activeColor: kSecondaryColor,
      inactiveColor: Color(0xFF808081),
      max: 100,
      label: Cvalue.round().toString(),
      onChanged: (double value) {
        setState(() {
          Cvalue = value;
        });
      },
    );
  }
}
