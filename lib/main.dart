import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies_planet/business/watch_list_bloc/watch_list_bloc.dart';
import 'package:movies_planet/data/model/mp_media.dart';
import 'package:movies_planet/data/services/service_locator.dart';
import 'package:movies_planet/resources/mp_router.dart';
import 'package:movies_planet/resources/mp_strings.dart';
import 'package:movies_planet/resources/mp_theme.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(MpMediaAdapter());
  await Hive.openBox('items');
  ServiceLocator.init();
  runApp(BlocProvider(
    create: (context) => serviceLocator<WatchListBloc>(),
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: MPStrings.appTitle,
      theme: getMPTheme(),
      routerConfig: MPRouter().router,
    );
  }
}
