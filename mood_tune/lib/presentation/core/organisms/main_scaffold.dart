import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/organisms/custom_bottom_nav_bar.dart';
import '../../core/theme/app_colors.dart';
import 'global_mini_player.dart';

class MainScaffold extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainScaffold({
    super.key,
    required this.navigationShell,
  });

  void _onTap(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgMain,
      body: Stack(
        children: [
          navigationShell,
          // Global MiniPlayer at the bottom of the body
          const GlobalMiniPlayer(),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: navigationShell.currentIndex,
        onTap: _onTap,
      ),
    );
  }
}
