import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_assets.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_routes.dart';
import 'package:islami_app/core/utils/app_text_styles.dart';
import 'package:islami_app/core/utils/shared_preference.dart';
import 'package:islami_app/features/views/quran/quran_resourses.dart';
import 'package:islami_app/features/views/quran/widget/most_recent_container.dart';

class QuranView extends StatefulWidget {
 const QuranView({super.key});

  @override
  State<QuranView> createState() => _QuranViewState();

}

class _QuranViewState extends State<QuranView> {
      List<int> suraList = List.generate(114, (index) => index);
      GlobalKey<MostRecentContainerState> mostRecentKey = GlobalKey<MostRecentContainerState>();


  @override
  Widget build(BuildContext context) {
     double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Padding(
            padding: EdgeInsets.only(right: width * .04, left: width * .04),
            child: TextFormField(
              style: AppTextStyles.white20W700,

              onChanged: (input) {
                searchWithText(input);
              },
              keyboardType: TextInputType.text,

              cursorColor: AppColors.gold,
              decoration: InputDecoration(
                prefixIcon: Image.asset(IconAssets.search),
                labelText: "Sura Name",
              ),
            ),
          ),
          
          MostRecentContainer(key: mostRecentKey,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * .04),
            child: Text("Suras List", style: AppTextStyles.white16W700),
          ),
          Expanded(
            child: suraList.isEmpty?
                Center(child: Text("Invalid Name!",style: AppTextStyles.white20W700,)):ListView.separated(
              padding: EdgeInsets.zero,
              separatorBuilder: (context, index) => Divider(
                thickness: 1,
                color: AppColors.white,
                endIndent: width * .15,
                indent: width * .15,
              ),

              itemCount: suraList.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  saveMostRecentData(suraList[index]);
                  Navigator.pushNamed( 
                    context,
                    AppRoutes.quranDetails,
                    arguments: SuraDetailsModel(mostRecentIndex: suraList[index], mostRecentKey: mostRecentKey),
                  );
                },
                child:ListTile(
                  leading: Stack(
                    alignment: Alignment.center,

                    children: [
                      Image.asset(ImageAssets.frameNumber),
                      Text("${suraList[index] + 1}", style: AppTextStyles.white12W700),
                    ],
                  ),
                  title: Text(
                    QuranResourses.englishQuranSurahs[suraList[index]],
                    style: AppTextStyles.white20W700,
                  ),
                  subtitle: Text(
                    "${QuranResourses.ayaNumber[suraList[index]]} Verses",
                    style: AppTextStyles.white16W700,
                  ),
                  trailing: Text(
                    QuranResourses.arabicAuranSuras[suraList[index]],
                    style: AppTextStyles.white20W700,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void searchWithText(String text) {
    List<int> fliterSearch = [];
    for(int i = 0 ; i<QuranResourses.arabicAuranSuras.length  ;i++){
      if(QuranResourses.arabicAuranSuras[i].toLowerCase().contains(text.toLowerCase())){
        fliterSearch.add(i);
      }
      if(QuranResourses.englishQuranSurahs[i].toLowerCase().contains(text.toLowerCase())){
        fliterSearch.add(i);
      }
      suraList=fliterSearch;
      setState(() {
        
      });
      
      
    }
   

  }
  
}
 class SuraDetailsModel{
  GlobalKey<MostRecentContainerState> mostRecentKey;
  int mostRecentIndex;
  SuraDetailsModel({required this.mostRecentIndex,required this.mostRecentKey});
        
      }
