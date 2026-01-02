import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:pray_app/app/core/widgets/feature_in_development_dialog.dart';
import 'package:pray_app/app/di/di.dart';
import 'package:pray_app/app/domain/entities/passage_entity.dart';
import 'package:pray_app/app/modules/passage/controller/passage_page_controller.dart';
import 'package:pray_app/app/modules/passage/widgets/passage_actions.dart';
import 'package:pray_app/app/modules/passage/widgets/passage_content.dart';
import 'package:pray_app/app/modules/passage/widgets/passage_description.dart';
import 'package:pray_app/app/modules/passage/widgets/passage_header.dart';

class PassagePage extends StatefulWidget {
  final PassageEntity passage;

  const PassagePage({super.key, required this.passage});

  @override
  State<PassagePage> createState() => _PassagePageState();
}

class _PassagePageState extends State<PassagePage> {
  late final PassagePageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = getIt<PassagePageController>();
    _controller.setIsLiked(widget.passage.liked);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _handleLikeTap() async {
    await _controller.toggleLike(widget.passage);

    if (!mounted) return;

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
    }
  }

  void _handleShare() {
    FeatureInDevelopmentDialog.show(
      context,
      featureName: 'Compartilhar passagem',
    );
  }

  void _handleListen() {
    FeatureInDevelopmentDialog.show(context, featureName: 'Ouvir passagem');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text('Passagem Bíblica'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => GoRouter.of(context).pop(),
        ),
      ),
      body: ListenableBuilder(
        listenable: _controller,
        builder: (context, _) {
          return SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PassageHeader(
                    passage: widget.passage,
                    isLiked: _controller.isLiked,
                    isLiking: _controller.isLiking,
                    onLikeTap: _handleLikeTap,
                  ),
                  PassageContent(passage: widget.passage),
                  PassageDescription(passage: widget.passage),
                  PassageActions(
                    onShare: _handleShare,
                    onListen: _handleListen,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
