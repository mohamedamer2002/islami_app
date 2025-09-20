import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_assets.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_text_styles.dart';
import 'package:islami_app/features/views/hadeth/model/hadeth_model.dart';

class HadethDetails extends StatelessWidget {
  const HadethDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Map<dynamic, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map;
    HadethModel hadeth = args["hadeth"] as HadethModel;
    int count = args["index"] as int;
    return Scaffold(
      appBar: AppBar(title: Text("Hadith $count")),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        ImageAssets.cornerLeft,
                        color: AppColors.gold,
                      ),
                      Expanded(
                        child: Text(
                          hadeth.title,
                          style: AppTextStyles.gold24W700,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Image.asset(
                        ImageAssets.cornerRight,
                        color: AppColors.gold,
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        Text(
                          hadeth.content,
                          style: AppTextStyles.gold20W700,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Image.asset(ImageAssets.bottomMosque),
        ],
      ),
    );
  }
}
