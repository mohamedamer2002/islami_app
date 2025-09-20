import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/utils/app_assets.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_routes.dart';
import 'package:islami_app/core/utils/app_text_styles.dart';
import 'package:islami_app/features/views/hadeth/model/hadeth_model.dart';

class HadethItem extends StatefulWidget {
  const HadethItem({super.key, required this.index});
  final int index;

  @override
  State<HadethItem> createState() => _HadethItemState();
}

class _HadethItemState extends State<HadethItem> {
  HadethModel? hadeth;
  @override
  void initState() {
    super.initState();
    bulidHadeth();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutes.hadethDetails,
          arguments: {"hadeth": hadeth, "index": widget.index},
        );
      },
      child: Container(
        padding: EdgeInsets.only(
          right: width * .02,
          left: width * .02,
          top: height * .01,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.gold,
          image: DecorationImage(
            image: AssetImage(ImageAssets.hadethCardBackGround),
            scale: 1.4,
          ),
        ),
        child: hadeth == null
            ? Center(child: CircularProgressIndicator(color: AppColors.black))
            : Column(
                children: [
                  Row(
                    children: [
                      Image.asset(ImageAssets.cornerLeft),
                      Expanded(
                        child: Text(
                          hadeth?.title ?? "",
                          style: AppTextStyles.black24W700,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Image.asset(ImageAssets.cornerRight),
                    ],
                  ),

                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        hadeth?.content ?? "",
                        style: AppTextStyles.black18W700,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Image.asset(ImageAssets.bottomMosque, color: AppColors.gray),
                ],
              ),
      ),
    );
  }

  void bulidHadeth() async {
    String fileContent = (await rootBundle.loadString(
      "assets/files/hadeth/h${widget.index}.txt",
    )).trim();
    String title = fileContent.substring(0, fileContent.indexOf("\n"));
    String content = fileContent.substring(fileContent.indexOf("\n") + 1);

    hadeth = HadethModel(content: content, title: title);

    await Future.delayed(Duration(milliseconds: 500));
    if (mounted) {
      setState(() {});
    }
  }
}
