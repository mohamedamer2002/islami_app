import 'package:flutter/widgets.dart';
import 'package:islami_app/features/views/hadeth/hadeth_details.dart';
import 'package:islami_app/features/views/home/home_view.dart';
import 'package:islami_app/features/views/onboarding/onboarding_view.dart';
import 'package:islami_app/features/views/quran/quran_details.dart';

abstract class AppRoutes {
  static const onboardingView = "onboarding_view";
  static const homeView = "home_view";
  static const hadethDetails ="hadeth_details";
  static const quranDetails ="quran_details";




  static  Map<String,WidgetBuilder> routes ={
    onboardingView :(context)=>OnboardingView(),
    homeView :(context)=>HomeView(),
    hadethDetails:(context)=>HadethDetails(),
    quranDetails:(context)=>QuranDetails(),


  };
    
  
}