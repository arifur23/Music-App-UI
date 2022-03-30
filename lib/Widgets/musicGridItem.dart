import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_design_four/constant/consts.dart';

class MusicGridItem extends StatelessWidget {
  final name;
  final duration;
  final singer;
  final image;

  const MusicGridItem({Key? key, this.name, this.duration, this.singer, this.image}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 7,right: 7,top: 5,bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.black
        ),
        child: Stack(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(image ,height: 270, width: size.width * .96,fit: BoxFit.cover,)),
            Positioned(
              top: 17,
              right: 17,
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white.withOpacity(.4)
                ),
                child: Stack(
                  children: const [
                    Positioned(
                      // top: 2,
                      // left: 1,
                      child: IconButton(
                          onPressed: null,
                          icon: Icon(Icons.favorite_border,color: Colors.white, size: 20,)
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 160,
                left: 30,
                child: Text("By " + singer,style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 17,color: kSecondaryColor),)
            ),
            Positioned(
                top: 190,
                left: 30,
                child: Text(name,style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Colors.white),)
            ),
            Positioned(
                top: 225,
                left: 30,
                child: Text(duration.toString() + " minute",style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15,color: Colors.white.withOpacity(.3)),)
            ),
          ],
        ),
      ),
    );
  }
}
