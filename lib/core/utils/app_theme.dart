import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_text_styles.dart';

abstract class AppTheme {
  static final ThemeData lightTheme =ThemeData(
    appBarTheme: AppBarTheme(
      titleTextStyle:  AppTextStyles.gold20W700,
      centerTitle: true,
        backgroundColor: AppColors.black,
      iconTheme: IconThemeData(
        color: AppColors.gold
        
      )
    ),
    
    inputDecorationTheme: InputDecorationTheme(
      
      labelStyle: AppTextStyles.white16W700,
      enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColors.gold),
                
              ),
               
      focusedBorder:  OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColors.gold),
              ),
    ),
    
    scaffoldBackgroundColor: AppColors.black,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(
        size: 30
      ),
      backgroundColor: AppColors.gold,
      type:BottomNavigationBarType.fixed,
      unselectedItemColor: AppColors.black,
      selectedItemColor: AppColors.white,
      unselectedLabelStyle: AppTextStyles.white12W700,

    )
  );
}