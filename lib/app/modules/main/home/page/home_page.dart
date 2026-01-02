import 'package:flutter/material.dart';
import 'package:pray_app/app/di/di.dart';
import 'package:pray_app/app/modules/main/home/controller/home_page_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomePageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = getIt<HomePageController>();
    _loadData();
  }

  Future<void> _loadData() async {
    await _controller.loadDashboard();

    if (!mounted) return;

    if (_controller.errorMessage != null) {
      ScaffoldMessenger.of(context)
        ..clearSnackBars()
        ..showSnackBar(SnackBar(content: Text(_controller.errorMessage!)));
      _controller.clearError();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _controller,
      builder: (context, child) {
        final colorScheme = Theme.of(context).colorScheme;
        final currentIndex = _controller.currentIndex;

        return Scaffold(
          backgroundColor: colorScheme.surface,
          appBar: AppBar(
            backgroundColor: colorScheme.surface,
            surfaceTintColor: Colors.transparent,
            scrolledUnderElevation: 0,
            title: Text(_controller.tabs[currentIndex].label),
          ),
          body: RepaintBoundary(
            child: IndexedStack(
              index: currentIndex,
              children: _controller.pages,
            ),
          ),
          bottomNavigationBar: RepaintBoundary(
            child: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: _controller.onTabSelected,
              backgroundColor: colorScheme.surface,
              selectedItemColor: colorScheme.primary,
              unselectedItemColor: colorScheme.onSurfaceVariant,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              type: BottomNavigationBarType.fixed,
              items: _controller.tabs
                  .map(
                    (tab) => BottomNavigationBarItem(
                      icon: Image.asset(
                        tab.assetPath,
                        width: 24,
                        height: 24,
                        color: currentIndex == _controller.tabs.indexOf(tab)
                            ? colorScheme.primary
                            : colorScheme.onSurfaceVariant,
                      ),
                      label: tab.label,
                    ),
                  )
                  .toList(),
            ),
          ),
        );
      },
    );
  }
}
