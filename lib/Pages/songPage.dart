import 'package:flutter/material.dart';
import 'package:ui_design_four/Classes/SongData.dart';
import 'package:ui_design_four/constant/consts.dart';

import '../Widgets/musicItems.dart';

class SongPage extends StatefulWidget {
  final String name;
  final String title;
  final String description;
  final String image;

  const SongPage({Key? key, required this.name, required this.title, required this.description, required this.image}) : super(key: key);
  @override
  State<SongPage> createState() => _SongPageState();
}

enum IsActive {
  description,
  suggestion
}

class _SongPageState extends State<SongPage> {

  IsActive desOrSug = IsActive.description;
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
                      Text(widget.title,style: PageHeading,),
                      const SizedBox(height: 7,),
                      Text(widget.name,style: PageHeadingSmall,)
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
                        child: Image.asset(widget.image,fit: BoxFit.cover,)),
                  ),
                  const SizedBox(height: 40,),
                 MusicItems(),
                  const SizedBox(height: 30,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: ()
                          {
                            setState(() {
                               desOrSug = IsActive.description;
                            });
                          },
                          child: Container(
                            height: 45,
                            width: size.width * .45,

                            decoration: BoxDecoration(
                                color: desOrSug == IsActive.description ? const Color(0xFF212325) : Colors.transparent,
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Center(child: Text('Description',style: TextStyle(fontSize: 17, letterSpacing: 1.4, fontWeight: FontWeight.bold, color: Colors.white.withOpacity(.7)),)),
                          ),
                        ),
                        InkWell(
                          onTap: ()
                          {
                            setState(() {
                              desOrSug = IsActive.suggestion;
                            });
                          },
                          child: Container(
                            height: 45,
                            width: size.width * .45,

                            decoration: BoxDecoration(
                                color: desOrSug == IsActive.suggestion ? const Color(0xFF212325) : Colors.transparent,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Center(child: Text('Music Suggestion',style: TextStyle(fontSize: 17, letterSpacing: 1.4, fontWeight: FontWeight.bold, color: Colors.white.withOpacity(.7)),)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40,),
                  Visibility(
                    visible: desOrSug == IsActive.suggestion,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: songData.length,
                        itemBuilder: (context, index) {
                        return  ListTile(
                          textColor: Colors.white.withOpacity(.6),
                          selectedTileColor: const Color(0xFF212325),
                          title: Text(songData[index].name!),
                          subtitle: Text(songData[index].singer!),
                          trailing: Text(songData[index].duration!.toString() + " minute"),
                        );
                        }
                    ),
                  ),
                  Visibility(
                    visible: desOrSug == IsActive.description,
                      child: Text(widget.description, style: TextStyle(letterSpacing: 1.2, fontSize: 15, fontWeight: FontWeight.w400, color: Colors.white.withOpacity(.7)),)
                  ),
                ],
              )
            ]
          ))
        ],
      ),
    );
  }
}


