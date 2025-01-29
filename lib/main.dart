import 'package:flutter/material.dart';
import 'package:joemidi_flutter_fe/tab_body_mappings.dart';
import 'package:joemidi_flutter_fe/tab_body_misc.dart';
import 'package:joemidi_flutter_fe/tab_body_random.dart';
import 'package:joemidi_flutter_fe/tab_body_setlists.dart';
import 'package:joemidi_flutter_fe/tab_body_show.dart';
import 'package:joemidi_flutter_fe/tab_body_songs.dart';
import 'package:joemidi_flutter_fe/tab_body_sound_generators.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var theme = ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
      useMaterial3: true,
    );

    return MaterialApp(
      theme: theme,
      home: DefaultTabController(
        length: 7,
        child: Scaffold(
          appBar: AppBar(
            flexibleSpace: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(5), // Creates border
                    color: theme.colorScheme.primary,
                  ),
                  labelColor: theme.colorScheme.onPrimary,
                  tabs: [
                    Tab(text: TabBodyRandom.tabTitle),
                    Tab(text: TabBodyShow.tabTitle),
                    Tab(text: TabBodySongs.tabTitle),
                    Tab(text: TabBodySetlists.tabTitle),
                    Tab(text: TabBodyMappings.tabTitle),
                    Tab(text: TabBodySoundGenerators.tabTitle),
                    Tab(text: TabBodyMisc.tabTitle),
                  ],
                ),
              ]
            )
          ),
          body: const TabBarView(
            children: [
              TabBodyRandom(),
              TabBodyShow(),
              TabBodySongs(),
              TabBodySetlists(),
              TabBodyMappings(),
              TabBodySoundGenerators(),
              TabBodyMisc(),
            ],
          ),
        ),
      ),
    );
  }
}
