import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_assets.dart';
import 'package:islami_app/core/utils/app_text_styles.dart';

class SebhaView extends StatefulWidget {
  const SebhaView({super.key});

  @override
  State<SebhaView> createState() => _SebhaViewState();
}

class _SebhaViewState extends State<SebhaView> {
  final List<String> azkar = [
    "سبحان الله",
    "الحمد الله",
    "لا اله الا الله ",
    "الله اكبر",
    "لا حولا ولا قوة الا بالله",
  ];

  int count = 1;
  int index = 0;
  double turns = 0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "سَبِّحِ اسْمَ رَبِّكَ الأعلى ",
            style: AppTextStyles.white36W700,
            textAlign: TextAlign.center,
          ),
          GestureDetector(
            onTap: sebhaOnTaped,
            child: Stack(
              alignment: AlignmentGeometry.directional(0, .3),
              children: [
                AnimatedRotation(
                  turns: turns,
                  duration: Duration(milliseconds: 400),
                  curve: Easing.linear,
                  child: Image.asset(ImageAssets.sebha, height: height * .50),
                ),
                Column(
                  children: [
                    Text(azkar[index], style: AppTextStyles.white36W700),
                    SizedBox(height: height * .02),
                    Text("$count", style: AppTextStyles.white36W700),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void sebhaOnTaped() {
    count++;
    turns += 1 / 33;
    if (count > 33) {
      count = 1;
      index = (index + 1) % azkar.length;
      turns = 1 / 33;
      // index++;
      // if(index>azkar.length-1){
      //   index=0;
      // }
    }
    setState(() {});
  }
}
