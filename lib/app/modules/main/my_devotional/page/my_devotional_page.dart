import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pray_app/app/core/routes/app_router.dart';
import 'package:pray_app/app/di/di.dart';
import 'package:pray_app/app/modules/main/home/controller/home_page_controller.dart';
import 'package:pray_app/app/modules/main/my_devotional/controller/my_devotional_page_controller.dart';
import 'package:pray_app/app/modules/main/my_devotional/widgets/daily_limit_reached_modal.dart';
import 'package:pray_app/app/modules/main/my_devotional/widgets/generate_my_devotional_section.dart';
import 'package:pray_app/app/modules/main/my_devotional/widgets/generating_my_devotional_modal.dart';
import 'package:pray_app/app/modules/main/my_devotional/widgets/my_devotional_header.dart';
import 'package:pray_app/app/modules/main/my_devotional/widgets/my_devotional_history_section.dart';
import 'package:pray_app/app/modules/main/my_devotional/widgets/my_devotional_success_modal.dart';

class MyDevotionalPage extends StatefulWidget {
  const MyDevotionalPage({super.key});

  @override
  State<MyDevotionalPage> createState() => _MyDevotionalPageState();
}

class _MyDevotionalPageState extends State<MyDevotionalPage> {
  late final MyDevotionalPageController _controller;
  late final HomePageController _homeController;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller = getIt<MyDevotionalPageController>();
    _homeController = getIt<HomePageController>();
    _controller.loadLatestPrivateDevotional();
    _homeController.addListener(_onTabChanged);
  }

  void _onTabChanged() {
    if (_homeController.currentIndex == 1) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_scrollController.hasClients) {
          _scrollController.jumpTo(0);
        }
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(0);
      }
    });
  }

  Future<void> _handleGenerateDevotional() async {
    // Verificar se pode gerar devocional hoje
    if (!_controller.canGenerateDevotionalToday()) {
      showDialog(
        context: context,
        builder: (context) => const DailyLimitReachedModal(),
      );
      return;
    }

    // Mostrar modal de geração
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => ListenableBuilder(
        listenable: _controller,
        builder: (context, _) {
          return const GeneratingMyDevotionalModal();
        },
      ),
    );

    // Executar geração (inicia polling)
    _controller.generateDevotional();

    // Adicionar listener para detectar quando devocional estiver pronto
    void listener() {
      if (!mounted) return;

      // Verificar erro (só fecha modal se não estiver loading)
      if (_controller.errorMessage != null && !_controller.isLoading) {
        _controller.removeListener(listener);
        GoRouter.of(context).pop();

        ScaffoldMessenger.of(context)
          ..clearSnackBars()
          ..showSnackBar(SnackBar(content: Text(_controller.errorMessage!)));
        _controller.clearError();
        return;
      }

      // Verificar sucesso (devocional pronto e não está mais loading)
      if (_controller.generatedDevotional != null && !_controller.isLoading) {
        _controller.removeListener(listener);

        GoRouter.of(context).pop();

        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => const MyDevotionalSuccessModal(),
        );

        Future.delayed(const Duration(seconds: 2), () {
          if (!mounted) return;

          GoRouter.of(context).pop();

          GoRouter.of(context).pushNamed(
            AppRoutes.devotionalName,
            extra: {'devotional': _controller.generatedDevotional},
          );

          _controller.clearGeneratedDevotional();
        });
      }
    }

    _controller.addListener(listener);
  }

  void _navigateToDevotionalDetails() {
    if (_controller.lastDevotional == null) return;

    GoRouter.of(context).pushNamed(
      AppRoutes.devotionalName,
      extra: {'devotional': _controller.lastDevotional},
    );
  }

  @override
  void dispose() {
    _homeController.removeListener(_onTabChanged);
    _scrollController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).colorScheme.surface,
      child: ListenableBuilder(
        listenable: _controller,
        builder: (context, _) {
          return SafeArea(
            child: RepaintBoundary(
              child: SingleChildScrollView(
                controller: _scrollController,
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const MyDevotionalHeader(),
                    const SizedBox(height: 32),
                    GenerateMyDevotionalSection(
                      controller: _controller.feelingController,
                      maxCharacters: _controller.maxCharacters,
                      onGeneratePressed: _handleGenerateDevotional,
                      isLoading: _controller.isLoading,
                    ),
                    const SizedBox(height: 32),
                    MyDevotionalHistorySection(
                      lastDevotional: _controller.lastDevotional,
                      isLoading: _controller.isLoadingLastDevotional,
                      onAccessPressed: _navigateToDevotionalDetails,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
