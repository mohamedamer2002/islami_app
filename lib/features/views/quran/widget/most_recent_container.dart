import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_assets.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_text_styles.dart';
import 'package:islami_app/core/utils/shared_preference.dart';
import 'package:islami_app/features/views/quran/quran_resourses.dart';

class MostRecentContainer extends StatefulWidget {
   const MostRecentContainer({super.key});

  @override
  State<MostRecentContainer> createState() => MostRecentContainerState();
}

class MostRecentContainerState extends State<MostRecentContainer> {
  List<int> mostRecentList =[] ;
  Future<void> getMotRecent() async {
  mostRecentList= await getMostRecentData();
  setState(() {
    
  });
  }
 @override
  void initState() {
    super.initState();
    getMotRecent();
   
  }

  @override
  Widget build(BuildContext context) {
    double width =MediaQuery.of(context).size.width;
    double height =MediaQuery.of(context).size.height;
    return Visibility(
      visible: mostRecentList.isNotEmpty,


      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * .04,
                vertical: height * .01,
              ),
              child: Text("Most Recently ", style: AppTextStyles.white16W700),
            ),
          SizedBox(
            height: height*.16,
            child: ListView.separated(
              padding: EdgeInsets.only(left: width*.04,bottom: height*.01),
              
              scrollDirection: Axis.horizontal,
              separatorBuilder:(context,index){
               return SizedBox(width: width*.03,);
              },
              itemCount: mostRecentList.length,
              itemBuilder: (context,index){
              return  Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.gold,
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(QuranResourses.englishQuranSurahs[mostRecentList[index]],style: AppTextStyles.black24W700,),
                        Text(QuranResourses.arabicAuranSuras[mostRecentList[index]],style: AppTextStyles.black24W700,),
                        Text("${QuranResourses.ayaNumber[mostRecentList[index]]} Verses  ",style: AppTextStyles.black18W700,),
                      ],
                    ),
                    Image.asset(ImageAssets.mostRecent),
                  ],
                ),
              );
            
              },
              
            ),
          ),
        ],
      ),
    );
  }
}