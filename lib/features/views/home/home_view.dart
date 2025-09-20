import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_assets.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/features/views/hadeth/hadeth_view.dart';
import 'package:islami_app/features/views/quran/quran_view.dart';
import 'package:islami_app/features/views/radio/radio_view.dart';
import 'package:islami_app/features/views/sebha/sebha_view.dart';
import 'package:islami_app/features/views/time/time_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

int selectIndex = 0;

class _HomeViewState extends State<HomeView> {
  final List<String> tabsBackGround = [
    ImageAssets.quranBackGround,
    ImageAssets.hadethBackGround,
    ImageAssets.sebhaBackGround,
    ImageAssets.radioBackGround,
    ImageAssets.timeBackGround,
  ];
  final List<Widget> tabView = [
    QuranView(),
    HadethView(),
    SebhaView(),
    RadioView(),
    TimeView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          tabsBackGround[selectIndex],
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),

        Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectIndex,

            onTap: (index) {
              setState(() {
                selectIndex = index;
              });
            },

            items: [
              BottomNavigationBarItem(
                icon: selectedTab(index: 0, tabName: IconAssets.quran),
                label: "Quran",
              ),
              BottomNavigationBarItem(
                icon: selectedTab(index: 1, tabName: IconAssets.hadeth),
                label: "Hadeth",
              ),
              BottomNavigationBarItem(
                icon: selectedTab(index: 2, tabName: IconAssets.sebha),
                label: "Sebha",
              ),
              BottomNavigationBarItem(
                icon: selectedTab(index: 3, tabName: IconAssets.radio),
                label: "Radio",
              ),
              BottomNavigationBarItem(
                icon: selectedTab(index: 4, tabName: IconAssets.time),
                label: "Time",
              ),
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 150,
                child: Image.asset(ImageAssets.islami,)),
              Expanded(child: tabView[selectIndex]),
            ],
          ),
        ),
      ],
    );
  }

  Widget selectedTab({required int index, required String tabName}) {
    return selectIndex == index
        ? Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.black,
              borderRadius: BorderRadius.circular(66),
            ),
            child: ImageIcon(AssetImage(tabName)),
          )
        : ImageIcon(AssetImage(tabName));
  }
}
