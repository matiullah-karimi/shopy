import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopy/providers/auth_provider.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      body: Column(
        children: [
          Text(ref.watch(authStateProvider).user!.email!),
          Center(
            child: TextButton(
              onPressed: () {
                ref.watch(authStateProvider.notifier).logout();
              },
              child: Text('Logout'),
            ),
          ),
        ],
      ),
    );
  }
}
