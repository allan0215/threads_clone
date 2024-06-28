import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:thread_clone/router.dart';
import 'package:thread_clone/screens/home_screen.dart';
import 'package:thread_clone/screens/main_navagation_screen.dart';
import 'package:thread_clone/setting/view_model/settings_vm.dart';

void main() {
  GoRouter.optionURLReflectsImperativeAPIs = true;
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isDarkMode = ref.watch(settingsProvider).isDarkMode;

    return MaterialApp.router(
      routerConfig: router,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          shadowColor: Colors.white.withOpacity(0),
          elevation: 0,
        ),
        scaffoldBackgroundColor: Colors.white,
        bottomAppBarTheme: const BottomAppBarTheme(
          color: Colors.white,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
        ),

        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
          primary: Colors.white,
          surface: Colors.white,
          secondary: Colors.grey,
          onPrimary: Colors.black,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
          colorScheme: const ColorScheme.dark(
        primary: Color(0xff121212),
        surface: Color(0xff121212),
        secondary: Colors.grey,
        onPrimary: Colors.white,
      )),
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
    );
  }
}
