import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopy/model/app_tabs.dart';
import 'package:shopy/providers/app_tab_provider.dart';
import 'package:shopy/widgets/bottom_bar_widget.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    AppTabs tab = ref.watch(appTabProvider);

    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: IndexedStack(
            index: tab.index,
            children: AppTabs.values.map((t) => t.screen).toList(),
          ),
          bottomNavigationBar: const BottomBarWidget(),
        ),
      ),
    );
  }
}
