import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopy/providers/auth_provider.dart';
import 'package:shopy/widgets/app_bar_widget.dart';
import 'package:shopy/widgets/auth/profile_short_info_widget.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: const AppBarWidget(title: 'My account'),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const ProfileShortInfoWidget(),
          const Divider(height: 32),
          _buildListItem('Account details', () {
            Navigator.of(context).pushNamed('/account-details');
          }),
          const Divider(height: 12),
          _buildListItem('Cards & Offers', () {
            Navigator.of(context).pushNamed('/cards-offers');
          }),
          const Divider(height: 12),
          _buildListItem('Notifications', () {
            Navigator.of(context).pushNamed('/notifications');
          }),
          const Divider(height: 12),
          _buildListItem('Delivery information', () {
            Navigator.of(context).pushNamed('/delivery-information');
          }),
          const Divider(height: 12),
          _buildListItem('Payment information', () {
            Navigator.of(context).pushNamed('/payment-information');
          }),
          const Divider(height: 12),
          _buildListItem('Language', () {
            Navigator.of(context).pushNamed('/language');
          }),
          const Divider(height: 12),
          _buildListItem('Privacy & security', () {
            Navigator.of(context).pushNamed('/privacy-security');
          }),
          const Divider(height: 12),
          _buildListItem('Logout', () {
            ref.watch(authStateProvider.notifier).logout();
          }),
        ],
      ),
    );
  }

  _buildListItem(String text, Function onTap) {
    return ListTile(
      style: ListTileStyle.drawer,
      title: Text(text),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 14,
      ),
      onTap: () => onTap(),
    );
  }
}
