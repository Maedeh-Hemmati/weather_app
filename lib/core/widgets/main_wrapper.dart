import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/core/widgets/app_background.dart';
import 'package:weather_app/core/widgets/bottom_nav.dart';
import 'package:weather_app/features/feature_bookmark/presentation/screens/bookmark_screen.dart';
import 'package:weather_app/features/feature_weather/domain/entities/current_city_entity.dart';
import 'package:weather_app/features/feature_weather/presentation/bloc/cw_status.dart';
import 'package:weather_app/features/feature_weather/presentation/bloc/home_bloc.dart';
import 'package:weather_app/features/feature_weather/presentation/screens/home_screen.dart';

class MainWrapper extends StatelessWidget {
  MainWrapper({super.key});

  final PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    List<Widget> pageViewWidget = [
      const HomeScreen(),
      const BookMarkScreen(),
    ];
    var height = MediaQuery.of(context).size.height;
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('kk').format(now);
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: BottomNav(
        controller: pageController,
      ),
      body: Container(
        decoration: BoxDecoration(image: DecorationImage(image: AppBackground.getBackGroundImage(formattedDate), fit: BoxFit.fill)),
        height: height,
        child: PageView(
          controller: pageController,
          children: pageViewWidget,
        ),
      ),
    );
  }
}
