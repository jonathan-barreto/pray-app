import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pray_app/app/core/routes/app_router.dart';
import 'package:pray_app/app/di/di.dart';
import 'package:pray_app/app/modules/private_devotionals/controller/private_devotionals_page_controller.dart';
import 'package:pray_app/app/modules/private_devotionals/widgets/devotional_list_item.dart';
import 'package:pray_app/app/modules/private_devotionals/widgets/devotional_search_bar.dart';

class PrivateDevotionalsPage extends StatefulWidget {
  const PrivateDevotionalsPage({super.key});

  @override
  State<PrivateDevotionalsPage> createState() => _PrivateDevotionalsPageState();
}

class _PrivateDevotionalsPageState extends State<PrivateDevotionalsPage> {
  late final PrivateDevotionalsPageController _controller;
  late final ScrollController _scrollController;
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _controller = getIt<PrivateDevotionalsPageController>();
    _scrollController = ScrollController();
    _searchController = TextEditingController();
    _scrollController.addListener(_onScroll);
    _loadInitialData();
  }

  Future<void> _loadInitialData() async {
    await _controller.loadDevotionals();

    if (!mounted) {
      return;
    }

    if (_controller.errorMessage != null) {
      ScaffoldMessenger.of(context)
        ..clearSnackBars()
        ..showSnackBar(SnackBar(content: Text(_controller.errorMessage!)));
      _controller.clearError();
    }
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.8) {
      _controller.loadMore();
    }
  }

  void _navigateToDevotionalDetails(int index) {
    GoRouter.of(context).pushNamed(
      AppRoutes.devotionalName,
      extra: {'devotional': _controller.devotionals[index]},
    );
  }

  Future<void> _retryLoad() async {
    _controller.clearError();
    await _controller.loadDevotionals();

    if (!mounted) {
      return;
    }

    if (_controller.errorMessage != null) {
      ScaffoldMessenger.of(context)
        ..clearSnackBars()
        ..showSnackBar(SnackBar(content: Text(_controller.errorMessage!)));
      _controller.clearError();
    }
  }

  void _onSearchChanged(String query) {
    _controller.searchDevotionals(query);
  }

  void _clearSearch() {
    _searchController.clear();
    _controller.searchDevotionals('');
  }

  void _onFilterPressed() {
    // TODO: Implementar filtros
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(
        const SnackBar(content: Text('Filtros em desenvolvimento')),
      );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          onPressed: () => GoRouter.of(context).pop(),
        ),
        title: Text(
          'Meus Devocionais',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
      body: ListenableBuilder(
        listenable: _controller,
        builder: (context, _) {
          if (_controller.isLoading && _controller.devotionals.isEmpty) {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.primary,
              ),
            );
          }

          if (_controller.errorMessage != null &&
              _controller.devotionals.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline,
                      size: 64,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      _controller.errorMessage!,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    FilledButton(
                      onPressed: _retryLoad,
                      child: const Text('Tentar Novamente'),
                    ),
                  ],
                ),
              ),
            );
          }

          if (_controller.devotionals.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.auto_stories_outlined,
                      size: 64,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Nenhum devocional encontrado',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Gere seu primeiro devocional personalizado',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          return Column(
            children: [
              DevotionalSearchBar(
                controller: _searchController,
                onChanged: _onSearchChanged,
                onClear: _clearSearch,
                onFilterPressed: _onFilterPressed,
              ),
              if (_controller.filteredDevotionals.isEmpty &&
                  _controller.searchQuery.isNotEmpty)
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(32),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.search_off_rounded,
                            size: 64,
                            color: Theme.of(
                              context,
                            ).colorScheme.onSurfaceVariant,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Nenhum resultado encontrado',
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurface,
                                ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Tente buscar por outro termo',
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurfaceVariant,
                                ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              else
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount:
                        _controller.filteredDevotionals.length +
                        (_controller.isLoadingMore ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index == _controller.filteredDevotionals.length) {
                        return Padding(
                          padding: const EdgeInsets.all(20),
                          child: Center(
                            child: CircularProgressIndicator(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        );
                      }

                      final devotional = _controller.filteredDevotionals[index];
                      return DevotionalListItem(
                        devotional: devotional,
                        onTap: () => _navigateToDevotionalDetails(index),
                      );
                    },
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
