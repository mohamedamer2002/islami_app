import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/features/views/hadeth/widget/hadeth_item.dart';


class HadethView extends StatelessWidget {
  const HadethView({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding:  EdgeInsets.only(bottom: height*.02),
      child: Scaffold(
        body: CarouselSlider(
        options: CarouselOptions(height: height*.66,
        enlargeCenterPage: true,
        enlargeFactor: 0.2,
        enableInfiniteScroll: true,
        
        ),
        
        items: List.generate(50,(index)=>index+1 ).map((index) {
      return HadethItem(index: index,);
        }).toList(),
      ),
        
        
        
      ),
    );
  }
}