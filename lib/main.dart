import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopy/constants/styles.dart';
import 'package:shopy/model/app_tabs.dart';
import 'package:shopy/providers/app_tab_provider.dart';
import 'package:shopy/providers/auth_provider.dart';
import 'package:shopy/screens/splash_screen.dart';
import 'package:shopy/widgets/bottom_bar_widget.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    AppTabs tab = ref.watch(appTabProvider);
    final authState = ref.watch(authStateProvider);

    return MaterialApp(
      theme: ThemeData(
        primarySwatch: kPrimaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SafeArea(
        child: Scaffold(
          body: LayoutBuilder(
            builder: (context, snapshot) {
              if (authState.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (authState.notAuthenticated) {
                return const SplashScreen();
              }

              return IndexedStack(
                index: tab.index,
                children: AppTabs.values.map((t) => t.screen).toList(),
              );
            },
          ),
          bottomNavigationBar:
              authState.authenticated == true ? const BottomBarWidget() : null,
        ),
      ),
    );
  }
}
