import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pray_app/app/core/routes/app_router.dart';
import 'package:pray_app/app/core/widgets/devotional_card.dart';
import 'package:pray_app/app/di/di.dart';
import 'package:pray_app/app/modules/main/home/controller/home_page_controller.dart';
import 'package:pray_app/app/modules/main/today/controller/today_page_controller.dart';
import 'package:pray_app/app/modules/main/today/widgets/passage_card.dart';
import 'package:pray_app/app/modules/main/today/widgets/quick_actions.dart';
import 'package:pray_app/app/modules/main/today/widgets/today_header.dart';

class TodayPage extends StatefulWidget {
  const TodayPage({super.key});

  @override
  State<TodayPage> createState() => _TodayPageState();
}

class _TodayPageState extends State<TodayPage> {
  late final TodayPageController _controller;
  late final HomePageController _homeController;

  @override
  void initState() {
    super.initState();
    _controller = getIt<TodayPageController>();
    _homeController = getIt<HomePageController>();
    _loadData();
    _homeController.addListener(_onTabChanged);
  }

  void _onTabChanged() {
    if (_homeController.currentIndex == 0) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_controller.scrollController.hasClients) {
          _controller.scrollController.jumpTo(0);
        }
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_controller.scrollController.hasClients) {
        _controller.scrollController.jumpTo(0);
      }
    });
  }

  Future<void> _loadData() async {
    await _controller.loadDashboard();
    _controller.loadUserMetrics();

    if (!mounted) return;

    if (_controller.errorMessage != null) {
      ScaffoldMessenger.of(context)
        ..clearSnackBars()
        ..showSnackBar(SnackBar(content: Text(_controller.errorMessage!)));
      _controller.clearError();
    }
  }

  Future<void> _navigateToDevotionalDetails() async {
    if (_controller.todayDevotional == null) return;

    await GoRouter.of(context).pushNamed(
      AppRoutes.devotionalName,
      extra: {'devotional': _controller.todayDevotional},
    );

    _loadData();
    _controller.loadUserMetrics();
  }

  Future<void> _navigateToPassageDetails() async {
    if (_controller.todayPassage == null) return;

    await GoRouter.of(context).pushNamed(
      AppRoutes.passageName,
      extra: {'passage': _controller.todayPassage},
    );

    _loadData();
    _controller.loadUserMetrics();
  }

  Future<void> _handlePassageLike() async {
    if (_controller.todayPassage == null) return;

    await _controller.togglePassageLike(_controller.todayPassage!);

    if (!mounted) return;

    if (_controller.errorMessage != null) {
      ScaffoldMessenger.of(context)
        ..clearSnackBars()
        ..showSnackBar(SnackBar(content: Text(_controller.errorMessage!)));
      _controller.clearError();
    }
  }

  Future<void> _handleDevotionalLike() async {
    if (_controller.todayDevotional == null) return;

    await _controller.toggleDevotionalLike(_controller.todayDevotional!);

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
    _homeController.removeListener(_onTabChanged);
    _controller.scrollController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _controller,
      builder: (context, _) {
        if (_controller.isLoading && _controller.todayDevotional == null) {
          return ColoredBox(
            color: Theme.of(context).colorScheme.surface,
            child: const Center(child: CircularProgressIndicator()),
          );
        }

        return ColoredBox(
          color: Theme.of(context).colorScheme.surface,
          child: SafeArea(
            child: RepaintBoundary(
              child: SingleChildScrollView(
                controller: _controller.scrollController,
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 24, 20, 32),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TodayHeader(greeting: _controller.getGreeting()),
                          const SizedBox(height: 32),
                          QuickActions(calendar: _controller.calendar),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.outlineVariant,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(32),
                          topRight: Radius.circular(32),
                        ),
                      ),
                      padding: const EdgeInsets.fromLTRB(20, 32, 20, 24),
                      child: Column(
                        children: [
                          RepaintBoundary(
                            child: PassageCard(
                              passage: _controller.todayPassage,
                              onFavoritePressed: _handlePassageLike,
                              isFavorite: _controller.passageLiked,
                              onReadPressed: _navigateToPassageDetails,
                            ),
                          ),
                          const SizedBox(height: 20),
                          RepaintBoundary(
                            child: DevotionalCard(
                              devotional: _controller.todayDevotional,
                              onAccessPressed: _navigateToDevotionalDetails,
                              showFavorite: true,
                              onFavoritePressed: _handleDevotionalLike,
                              isFavorite: _controller.devotionalLiked,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
