import 'package:flutter/material.dart';
import 'package:yd_workout_program/screens/shop/shop_view_model.dart';

class AllCompleteStage extends StatelessWidget {
  final ShopViewModel model;

  const AllCompleteStage({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Column(
                  children: <Widget>[
                    Image.asset(
                      "assets/images/grey_cat_workout_motion_ani.gif",
                      width: 100,
                      height: 100,
                    ),
                  ],
                );
              },
            ),
          ),
          Container(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Column(
                  children: <Widget>[
                    Image.asset(
                      "assets/images/yellow_cat_workout_motion.gif",
                      width: 100,
                      height: 100,
                    ),
                  ],
                );
              },
            ),
          ),
          Container(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Column(
                  children: <Widget>[
                    Image.asset(
                      "assets/images/grey_cat_workout_motion_ani.gif",
                      width: 100,
                      height: 100,
                    ),
                  ],
                );
              },
            ),
          ),
          Container(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Column(
                  children: <Widget>[
                    Image.asset(
                      "assets/images/yellow_cat_workout_motion.gif",
                      width: 100,
                      height: 100,
                    ),
                  ],
                );
              },
            ),
          ),
          Container(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Column(
                  children: <Widget>[
                    Image.asset(
                      "assets/images/grey_cat_workout_motion_ani.gif",
                      width: 100,
                      height: 100,
                    ),
                  ],
                );
              },
            ),
          ),
          Container(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Column(
                  children: <Widget>[
                    Image.asset(
                      "assets/images/yellow_cat_workout_motion.gif",
                      width: 100,
                      height: 100,
                    ),
                  ],
                );
              },
            ),
          ),
          Container(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Column(
                  children: <Widget>[
                    Image.asset(
                      "assets/images/grey_cat_workout_motion_ani.gif",
                      width: 100,
                      height: 100,
                    ),
                  ],
                );
              },
            ),
          ),
          Container(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Column(
                  children: <Widget>[
                    Image.asset(
                      "assets/images/yellow_cat_workout_motion.gif",
                      width: 100,
                      height: 100,
                    ),
                  ],
                );
              },
            ),
          ),
          Container(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Column(
                  children: <Widget>[
                    Image.asset(
                      "assets/images/grey_cat_workout_motion_ani.gif",
                      width: 100,
                      height: 100,
                    ),
                  ],
                );
              },
            ),
          ),
          Container(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Column(
                  children: <Widget>[
                    Image.asset(
                      "assets/images/yellow_cat_workout_motion.gif",
                      width: 100,
                      height: 100,
                    ),
                  ],
                );
              },
            ),
          ),
          Container(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Column(
                  children: <Widget>[
                    Image.asset(
                      "assets/images/grey_cat_workout_motion_ani.gif",
                      width: 100,
                      height: 100,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
