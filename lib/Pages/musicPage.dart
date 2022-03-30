import 'package:flutter/material.dart';
import 'package:ui_design_four/Pages/songPage.dart';
import 'package:ui_design_four/Widgets/musicGridItem.dart';
import 'package:ui_design_four/Widgets/musicItems.dart';
import 'package:ui_design_four/constant/consts.dart';
import 'package:ui_design_four/Classes/SongData.dart';

class MusicPage extends StatefulWidget {
  const MusicPage({Key? key}) : super(key: key);

  @override
  State<MusicPage> createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - 80 - 24) / 2;
    final double itemWidth = size.width / 2;
    return Scaffold(
      backgroundColor: kthrdColor,
      appBar: AppBar(
        titleSpacing: 3.5,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child:  Text('Relaxation By',style: PageHeading,),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: kthrdColor,
        actions: [
          IconButton(
              onPressed: null,
              icon: Icon(Icons.search, size: 30,color: Colors.white.withOpacity(.3),)
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: CustomScrollView(
          slivers: [
            SliverList(delegate: SliverChildListDelegate(
                [
                  Text('Listening Music',style: PageHeading,),
                  const SizedBox(height: 30,),
                  Text("Continue",style: TextStyle(letterSpacing: 1.2, fontSize: 20,fontWeight: FontWeight.w500,color: Colors.white.withOpacity(.3)),),
                  const SizedBox(height: 25,),
                  InkWell(
                    onTap: ()
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const SongPage(title: 'Sleep Tight', name: 'Sleep Relaxing', image: 'assets/7.jpg', description: 'Something informative',)));
                    },
                    child: Container(
                      height: 280,
                      width: size.width * .85,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.red
                      ),
                      child:
                      Stack(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset("assets/7.jpg",width: size.width * .96,fit: BoxFit.cover,)),
                          const Positioned(
                            top: 25,
                              left: 30,
                              child: Text("Sleep Tight",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),)),
                          Positioned(
                            top: 60,
                            left: 30,
                            child: Text('Sleep Relaxing',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.white.withOpacity(.6))
                            ),
                          ),
                          Positioned(
                            top: 85,
                            left: 160,
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.white.withOpacity(.6)
                              ),
                              child: Stack(
                                children: const [
                                  Positioned(
                                    top: 7,
                                      left: 7,
                                      child: Icon(Icons.music_note,color:Colors.black,size: 35,)
                                  )
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: 170,
                            left: -5,
                            child: Container(
                              height: 150,
                              width: size.width * .95,
                              child:  MusicItems(),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("New Relaxing",style: TextStyle( letterSpacing: 1.2, fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white.withOpacity(.4)),),
                      const Text("See All",style: TextStyle(  fontSize: 17,fontWeight: FontWeight.w400,color: kSecondaryColor),),
                    ],
                  ),
                  const SizedBox(height: 30,),
                  GridView.count(
                    childAspectRatio: (itemWidth / itemHeight),
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                     children: songData.map((songItem) => MusicGridItem(name: songItem.name,duration: songItem.duration,singer: songItem.singer,image: songItem.image,)).toList(),
                  ),
                  const SizedBox(height: 30,),
                ]
            ))
          ],
        ),
      ),
    );
  }
}
