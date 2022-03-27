import 'package:flutter/material.dart';

import '../constant/consts.dart';

class SliderClass extends StatefulWidget {
  const SliderClass({Key? key}) : super(key: key);

  @override
  State<SliderClass> createState() => _SliderClassState();
}

class _SliderClassState extends State<SliderClass> {
  double Cvalue = 0;
  @override
  Widget build(BuildContext context) {

    return Slider(
      value: Cvalue,
      activeColor: kSecondaryColor,
      inactiveColor: const Color(0xFF808081),
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