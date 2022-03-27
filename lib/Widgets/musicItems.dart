import 'package:flutter/material.dart';
import 'package:ui_design_four/Widgets/sliderClass.dart';

import '../constant/consts.dart';

class MusicItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: 30,
          width: size.width,
          child: const SliderClass(),
        ),
        const SizedBox(height: 2,),
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
          padding: const EdgeInsets.symmetric(horizontal: 126),
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
    );
  }
}
