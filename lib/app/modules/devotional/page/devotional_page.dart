import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pray_app/app/di/di.dart';
import 'package:pray_app/app/domain/entities/devotional_entity.dart';
import 'package:pray_app/app/modules/devotional/controller/devotional_page_controller.dart';
import 'package:pray_app/app/modules/devotional/widgets/devotional_fifth_page.dart';
import 'package:pray_app/app/modules/devotional/widgets/devotional_first_page.dart';
import 'package:pray_app/app/modules/devotional/widgets/devotional_fourth_page.dart';
import 'package:pray_app/app/modules/devotional/widgets/devotional_page_indicator.dart';
import 'package:pray_app/app/modules/devotional/widgets/devotional_second_page.dart';
import 'package:pray_app/app/modules/devotional/widgets/devotional_third_page.dart';

class DevotionalPage extends StatefulWidget {
  final DevotionalEntity devotional;

  const DevotionalPage({super.key, required this.devotional});

  @override
  State<DevotionalPage> createState() => _DevotionalPageState();
}

class _DevotionalPageState extends State<DevotionalPage> {
  late final DevotionalPageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = getIt<DevotionalPageController>();

    // Marca o devocional como concluído assim que a página é carregada
    _markDevotionalAsCompleted();
  }

  Future<void> _markDevotionalAsCompleted() async {
    await _controller.completeDevotional(widget.devotional);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onPageChanged(int page) {
    _controller.changePage(page);
  }

  Future<void> onSubmitFeedback() async {
    if (widget.devotional.userId != null &&
        widget.devotional.userId!.isNotEmpty) {
      await _controller.submitPrivateFeedback(widget.devotional);
    } else {
      await _controller.submitPublicFeedback(widget.devotional);
    }

    if (!mounted) {
      return;
    }

    if (_controller.errorMessage != null) {
      ScaffoldMessenger.of(context)
        ..clearSnackBars()
        ..showSnackBar(
          SnackBar(
            content: Text(_controller.errorMessage!),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      _controller.clearError();
    } else {
      ScaffoldMessenger.of(context)
        ..clearSnackBars()
        ..showSnackBar(
          SnackBar(
            content: const Text('Avaliação enviada! Obrigado pelo feedback.'),
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
        );
      GoRouter.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text('Devocional'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
      ),
      body: ListenableBuilder(
        listenable: _controller,
        builder: (context, _) {
          return SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: PageView(
                    controller: _controller.pageController,
                    onPageChanged: _onPageChanged,
                    children: [
                      DevotionalFirstPage(devotional: widget.devotional),
                      DevotionalSecondPage(devotional: widget.devotional),
                      DevotionalThirdPage(devotional: widget.devotional),
                      DevotionalFourthPage(devotional: widget.devotional),
                      DevotionalFifthPage(
                        feedbackController: _controller.feedbackController,
                        onSubmitFeedback: onSubmitFeedback,
                        rating: _controller.rating,
                        isLoading: _controller.isLoading,
                        onRatingChanged: _controller.setRating,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: DevotionalPageIndicator(
                    currentPage: _controller.currentPage,
                    pageCount: 5,
                    onPageTap: (index) {
                      _controller.animateToPage(index);
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
