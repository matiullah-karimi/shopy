import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopy/model/app_tabs.dart';

final appTabProvider = StateNotifierProvider<AppTabNotifier, AppTabs>((
  ref,
) {
  return AppTabNotifier(AppTabs.home);
});

class AppTabNotifier extends StateNotifier<AppTabs> {
  AppTabNotifier(AppTabs currentTab) : super(currentTab);

  void changeTab(int tabIndex) {
    state = AppTabs.values[tabIndex];
  }
}
