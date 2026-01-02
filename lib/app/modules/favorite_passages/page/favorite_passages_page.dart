import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pray_app/app/core/routes/app_router.dart';
import 'package:pray_app/app/di/di.dart';
import 'package:pray_app/app/modules/favorite_passages/controller/favorite_passages_page_controller.dart';
import 'package:pray_app/app/modules/favorite_passages/widgets/empty_passages_state.dart';
import 'package:pray_app/app/modules/favorite_passages/widgets/passage_list_item.dart';
import 'package:pray_app/app/modules/favorite_passages/widgets/passage_search_bar.dart';

class FavoritePassagesPage extends StatefulWidget {
  const FavoritePassagesPage({super.key});

  @override
  State<FavoritePassagesPage> createState() => _FavoritePassagesPageState();
}

class _FavoritePassagesPageState extends State<FavoritePassagesPage> {
  late final FavoritePassagesPageController _controller;
  late final ScrollController _scrollController;
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _controller = getIt<FavoritePassagesPageController>();
    _scrollController = ScrollController();
    _searchController = TextEditingController();
    _scrollController.addListener(_onScroll);
    _loadInitialData();
  }

  Future<void> _loadInitialData() async {
    await _controller.loadPassages();

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

  void _onPassageTap(int index) {
    final passage = _controller.filteredPassages[index];

    GoRouter.of(
      context,
    ).pushNamed(AppRoutes.passageName, extra: {'passage': passage});
  }

  Future<void> _onLikeTap(int passageId) async {
    await _controller.toggleLike(passageId);

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

  Future<void> _retryLoad() async {
    _controller.clearError();
    await _controller.loadPassages();

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
    _controller.searchPassages(query);
  }

  void _clearSearch() {
    _searchController.clear();
    _controller.searchPassages('');
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
          'Passagens Favoritas',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
      body: ListenableBuilder(
        listenable: _controller,
        builder: (context, _) {
          if (_controller.isLoading && _controller.passages.isEmpty) {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.primary,
              ),
            );
          }

          if (_controller.errorMessage != null &&
              _controller.passages.isEmpty) {
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

          if (_controller.passages.isEmpty) {
            return const EmptyPassagesState();
          }

          return Column(
            children: [
              PassageSearchBar(
                controller: _searchController,
                onChanged: _onSearchChanged,
                onClear: _clearSearch,
              ),
              if (_controller.filteredPassages.isEmpty &&
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
                        _controller.filteredPassages.length +
                        (_controller.isLoadingMore ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index == _controller.filteredPassages.length) {
                        return Padding(
                          padding: const EdgeInsets.all(20),
                          child: Center(
                            child: CircularProgressIndicator(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        );
                      }

                      final passage = _controller.filteredPassages[index];
                      return PassageListItem(
                        passage: passage,
                        onTap: () => _onPassageTap(index),
                        onLikeTap: () => _onLikeTap(passage.id),
                        isTogglingLike: _controller.isTogglingLike(passage.id),
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
