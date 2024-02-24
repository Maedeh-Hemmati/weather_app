import 'package:flutter/material.dart';
import 'package:weather_app/core/widgets/main_wrapper.dart';
import 'package:weather_app/features/feature_weather/presentation/bloc/home_bloc.dart';

import 'locator.dart';

void main() async {
  ///init locator
  await setup();

  runApp(
     MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers:[
          BlocProvider(create: (_)=>locator<HomeBloc>()),
        ],
        child:MainWrapper(),
      )

    )
  );
}

