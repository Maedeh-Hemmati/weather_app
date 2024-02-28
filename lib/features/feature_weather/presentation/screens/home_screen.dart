import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/widgets/app_background.dart';
import 'package:weather_app/core/widgets/dot_loading_widget.dart';
import 'package:weather_app/features/feature_weather/domain/entities/current_city_entity.dart';
import 'package:weather_app/features/feature_weather/presentation/bloc/cw_status.dart';
import 'package:weather_app/features/feature_weather/presentation/bloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String cityName = "Tehran";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<HomeBloc>(context).add(LoadCwEvent("Tehran"));
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
        child: Column(
      children: [
        BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
          if (state.cwStatus is CwLoading) {
            return const Expanded(child: DotLoadingWidget());
          }
          if (state.cwStatus is CwCompleted) {
            final CwCompleted cwCompleted = state.cwStatus as CwCompleted;
            final CurrentCityEntity currentCityEntity = cwCompleted.currentCityEntity;

            return Expanded(
                child: ListView(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Text(
                        currentCityEntity.name!,
                        style: const TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(
                        currentCityEntity.weather![0].description!,
                        style: const TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: AppBackground.setIconForMain(currentCityEntity.weather![0].description!, width * 0.2),
                    ),
                  ],
                )
              ],
            ));
          }
          if (state.cwStatus is CwError) {
            return const Text("error");
          }
          return Container();
        })
      ],
    ));
  }
}
