import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/utils/app_assets.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_text_styles.dart';
import 'package:islami_app/features/views/quran/quran_resourses.dart';
import 'package:islami_app/features/views/quran/quran_view.dart';

class QuranDetails extends StatefulWidget {
  const QuranDetails({super.key});
   

  @override
  State<QuranDetails> createState() => _QuranDetailsState();
}

class _QuranDetailsState extends State<QuranDetails> {
 late SuraDetailsModel args;

  String suraContent="";
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    args= ModalRoute.of(context)!.settings.arguments as SuraDetailsModel; 
  }
  @override
  void dispose() {
    args.mostRecentKey.currentState?.getMotRecent();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
  
    
    
    if(suraContent.isEmpty){
      loadSuracontent(args.mostRecentIndex);
    }
    
    return Scaffold(
      appBar: AppBar(
        title: Text(QuranResourses.englishQuranSurahs[args.mostRecentIndex]),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
             padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                children: [
                   Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(ImageAssets.cornerLeft,color: AppColors.gold,),
                  Text(QuranResourses.arabicAuranSuras[args.mostRecentIndex],style: AppTextStyles.gold24W700,),
                  Image.asset(ImageAssets.cornerRight,color: AppColors.gold,),
                ],
              ),
              Expanded(child:suraContent.isEmpty ? Center(
                child: CircularProgressIndicator(
                  color: AppColors.gold,
                ),
              ):
               ListView(children:[
                Text(suraContent,style: AppTextStyles.gold20W700,textAlign: TextAlign.center,textDirection: TextDirection.rtl,)] )),
                ],
              ),
            ),
          ),
          
         
          Image.asset(ImageAssets.bottomMosque,),
        ],
      ),
    );
  }

  Future<void> loadSuracontent(int index)async{
    String suraFile =await rootBundle.loadString("assets/files/quran/${index+1}.txt");
    List<String> suraVerses = suraFile.trim().split("\n");
     for(int i=0 ; i<suraVerses.length;i++){
      suraVerses[i] += "[${i+1}] "; 
     }
     suraContent = suraVerses.join();
    await Future.delayed(Duration(milliseconds: 500));
    
     if (mounted) {
      setState(() {});
    }
    
    
  }
}