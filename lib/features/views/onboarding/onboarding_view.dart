import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami_app/core/utils/app_routes.dart';
import 'package:islami_app/core/utils/app_assets.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_text_styles.dart';
import 'package:islami_app/features/views/onboarding/widgets/page_body.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      
      body: IntroductionScreen(
        dotsDecorator: DotsDecorator(
    size: const Size.square(10.0),
    activeSize: const Size(20.0, 10.0),
    activeColor: AppColors.gold,
    color: AppColors.gray,
    spacing: const EdgeInsets.symmetric(horizontal: 3.0),
    activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0)
    ),
  ),
        
        globalBackgroundColor: AppColors.black,
        showBackButton:true, 
        showDoneButton: true,
        
         
         
 
  next: Text("Next",style: AppTextStyles.gold16W700,),
  done: Text("Finish",style: AppTextStyles.gold16W700,),
  back: Text("Back",style: AppTextStyles.gold16W700,),
  onDone: () {
    Navigator.pushReplacementNamed(context, AppRoutes.homeView);
  },
  
  
        pages: [
          PageViewModel(
            titleWidget: Image.asset(ImageAssets.islami),   
            bodyWidget: PageBody(title: "Welcome To Islmi App",imagePass: ImageAssets.welcome,),
          ),
          PageViewModel(
            titleWidget: Image.asset(ImageAssets.islami),   
            bodyWidget: PageBody(title: "Welcome To Islmi App",imagePass: ImageAssets.mosque,
            subtitle: "We Are Very Excited To Have You In Our Community",
             ),
            
          ),
          PageViewModel(
             titleWidget: Image.asset(ImageAssets.islami),   
            bodyWidget: PageBody(title: "Reading the Quran",imagePass: ImageAssets.reading,
            subtitle: "Read, and your Lord is the Most Generous",
             ),
                     
          ),
          PageViewModel(
             titleWidget: Image.asset(ImageAssets.islami),   
            bodyWidget: PageBody(title: "Bearish",imagePass: ImageAssets.bearish,
            subtitle: "Praise the name of your Lord, the Most High",
             ),
                     
          ),
          PageViewModel(
             titleWidget: Image.asset(ImageAssets.islami),   
            bodyWidget: PageBody(title: "Holy Quran Radio",imagePass: ImageAssets.radio,
            subtitle: "You can listen to the Holy Quran Radio through the application for free and easily",
             ),
                     
          ),
        ],
        
        

      ),
     
    );
  }
}