import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:stacked/stacked.dart';
import 'package:yd_workout_program/config/color_theme.dart';
import 'package:yd_workout_program/config/font_theme.dart';
import 'package:yd_workout_program/screens/shop/shop_view.dart';
import 'package:yd_workout_program/screens/storage/storage_view.dart';
import 'package:yd_workout_program/screens/workout/workout_view.dart';

import '../calendar/calendar_view.dart';
import 'home_view_model.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(),
        onModelReady: (model) => model.initialize(),
        builder: (context, model, child) => Scaffold(
              body: switchView(model.bottomIndex),
              bottomNavigationBar: SalomonBottomBar(
                currentIndex: model.bottomIndex,
                onTap: (i) => model.setBottomIndex(i),
                items: [
                  SalomonBottomBarItem(
                      icon: Image.asset(
                        "assets/images/workout.png",
                        width: 40,
                        height: 40,
                      ),
                      title: Text(
                        "운동",
                        style: FontTheme.neoDgm16Medium,
                      ),
                      selectedColor: Colors.red.withOpacity(0.8)),
                  SalomonBottomBarItem(
                    icon: Image.asset(
                      "assets/images/calendar.png",
                      width: 40,
                      height: 40,
                    ),
                    title: Text(
                      "일지",
                      style: FontTheme.neoDgm16Medium,
                    ),
                    selectedColor: ColorTheme.mediumBlue,
                  ),
                  SalomonBottomBarItem(
                    icon: Image.asset(
                      "assets/images/store.png",
                      width: 40,
                      height: 40,
                    ),
                    title: Text(
                      "샵",
                      style: FontTheme.neoDgm16Medium,
                    ),
                    selectedColor: Colors.cyan,
                  ),
                  SalomonBottomBarItem(
                    icon: Image.asset(
                      "assets/images/storage2_icon.png",
                      width: 40,
                      height: 40,
                    ),
                    title: Text(
                      "창고",
                      style: FontTheme.neoDgm16Medium,
                    ),
                    selectedColor: Colors.brown,
                  ),
                ],
              ),
            ));
  }
}

Widget switchView(int index) {
  switch (index) {
    case 0:
      {
        return WorkOutView();
      }
    case 1:
      {
        return CalendarView();
      }
    case 2:
      {
        return ShopView();
      }
    case 3:
      {
        return StorageView();
      }
  }
  return Container();
}
