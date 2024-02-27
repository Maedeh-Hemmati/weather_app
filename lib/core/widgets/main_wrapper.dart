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

// class MainWrapper extends StatefulWidget {
//   const MainWrapper({super.key});
//
//   @override
//   State<MainWrapper> createState() => _MainWrapperState();
// }
//
// class _MainWrapperState extends State<MainWrapper> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     BlocProvider.of<HomeBloc>(context).add(LoadCwEvent("Tehran"));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(),
//         body: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
//           if (state.cwStatus is CwLoading) {
//             return const Text("Loading...");
//           }
//           if (state.cwStatus is CwCompleted) {
//
//             final CwCompleted cwCompleted = state.cwStatus as CwCompleted;
//             final CurrentCityEntity currentCityEntity = cwCompleted.currentCityEntity;
//
//             return Text(currentCityEntity.name.toString());
//           }
//           if (state.cwStatus is CwError) {
//             return const Text("error");
//           }
//           return Container();
//         }));
//   }
// }
