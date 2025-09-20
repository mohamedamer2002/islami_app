import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_text_styles.dart';

class PageBody extends StatelessWidget {
  const PageBody({super.key,required this.imagePass,required this.title,this.subtitle});
  final String title;
  final String? subtitle;
  final String imagePass;
  

  @override
  Widget build(BuildContext context) {
    double height =MediaQuery.of(context).size.height;
   
    
     
    return Column(
      children: [
       
        Padding(
          padding:  EdgeInsets.only(
            bottom: height *0.065,
          ),
          child: Image.asset(imagePass,height: 280,fit: BoxFit.cover,),
        ),
        Text(title,style: AppTextStyles.gold24W700,),
        SizedBox(
          height: height*0.03,
        ),
        Text(subtitle??"",style: AppTextStyles.gold18W700,textAlign: TextAlign.center,),
        
      ],
    );
  }
}