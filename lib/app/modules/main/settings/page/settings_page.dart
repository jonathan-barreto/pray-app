import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pray_app/app/app_controller.dart';
import 'package:pray_app/app/core/routes/app_router.dart';
import 'package:pray_app/app/di/di.dart';
import 'package:pray_app/app/modules/main/home/controller/home_page_controller.dart';
import 'package:pray_app/app/modules/main/settings/controller/settings_page_controller.dart';
import 'package:pray_app/app/modules/main/settings/widgets/logout_dialog.dart';
import 'package:pray_app/app/modules/main/settings/widgets/settings_section.dart';
import 'package:pray_app/app/modules/main/settings/widgets/settings_tile.dart';
import 'package:pray_app/app/modules/main/settings/widgets/user_profile_card.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late final SettingsPageController _controller;
  late final HomePageController _homeController;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller = getIt<SettingsPageController>();
    _homeController = getIt<HomePageController>();
    _homeController.addListener(_onTabChanged);
  }

  void _onTabChanged() {
    if (_homeController.currentIndex == 3) {
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

  Future<void> _handleLogout() async {
    final shouldLogout = await LogoutDialog.show(context);

    if (shouldLogout != true || !mounted) return;

    await _controller.logout(context);

    if (!mounted) return;

    if (_controller.errorMessage != null) {
      ScaffoldMessenger.of(context)
        ..clearSnackBars()
        ..showSnackBar(
          SnackBar(
            content: Text('Erro ao fazer logout: ${_controller.errorMessage}'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      _controller.clearError();
    }
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
    return ListenableBuilder(
      listenable: _controller,
      builder: (context, _) {
        return RepaintBoundary(
          child: ListView(
            controller: _scrollController,
            children: [
              UserProfileCard(
                userName: AppController.instance.userProfile?.name ?? '',
                userEmail: AppController.instance.userProfile?.email ?? '',
                userInitials:
                    AppController.instance.userProfile?.getInitials() ?? '',
                rankingValue:
                    '${AppController.instance.userProfile?.metrics?.rankPosition ?? 'N/A'}',
                streakValue:
                    '${AppController.instance.userProfile?.metrics?.streakDays ?? 0}',
                completedValue:
                    '${AppController.instance.userProfile?.metrics?.devotionalsCompleted ?? 0}',
                onMetricsTap: () {
                  GoRouter.of(context).pushNamed(AppRoutes.metricsName);
                },
              ),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: Column(
                  children: [
                    SettingsSection(
                      title: 'Conta',
                      items: [
                        SettingsTile(
                          icon: Icons.person_outline,
                          title: 'Perfil',
                          subtitle: 'Editar informações pessoais',
                          onTap: () {
                            GoRouter.of(
                              context,
                            ).pushNamed(AppRoutes.profileName);
                          },
                        ),
                        SettingsTile(
                          icon: Icons.email_outlined,
                          title: 'E-mail',
                          subtitle: 'Editar e-mail',
                          onTap: () {
                            GoRouter.of(context).pushNamed(AppRoutes.emailName);
                          },
                        ),
                        SettingsTile(
                          icon: Icons.lock_outlined,
                          title: 'Senha',
                          subtitle: 'Editar senha',
                          onTap: () {
                            GoRouter.of(
                              context,
                            ).pushNamed(AppRoutes.passwordName);
                          },
                        ),
                        // SettingsTile(
                        //   icon: Icons.notifications_outlined,
                        //   title: 'Notificações',
                        //   subtitle: 'Gerenciar preferências de notificação',
                        //   onTap: () {
                        //     FeatureInDevelopmentDialog.show(
                        //       context,
                        //       featureName: 'Notificações',
                        //     );
                        //   },
                        // ),
                      ],
                    ),
                    SettingsSection(
                      title: 'Favoritos',
                      items: [
                        SettingsTile(
                          icon: Icons.auto_stories_outlined,
                          title: 'Devocionais Diários Favoritos',
                          subtitle:
                              'Ver e gerenciar devocionais diários favoritos',
                          onTap: () {
                            GoRouter.of(
                              context,
                            ).pushNamed(AppRoutes.publicDevotionalsName);
                          },
                        ),
                        SettingsTile(
                          icon: Icons.menu_book_outlined,
                          title: 'Passagens Diárias Favoritas',
                          subtitle:
                              'Ver e gerenciar passagens diárias favoritas',
                          onTap: () {
                            GoRouter.of(
                              context,
                            ).pushNamed(AppRoutes.favoritePassagesName);
                          },
                        ),
                      ],
                    ),
                    SettingsSection(
                      title: 'Suporte',
                      items: [
                        SettingsTile(
                          icon: Icons.help_outline,
                          title: 'Ajuda',
                          subtitle: 'Central de ajuda e FAQ',
                          onTap: () {
                            GoRouter.of(context).pushNamed(AppRoutes.helpName);
                          },
                        ),
                        SettingsTile(
                          icon: Icons.info_outline,
                          title: 'Sobre',
                          subtitle: 'Versão e informações do app',
                          onTap: () {
                            GoRouter.of(context).pushNamed(AppRoutes.aboutName);
                          },
                        ),
                        SettingsTile(
                          icon: Icons.privacy_tip_outlined,
                          title: 'Privacidade',
                          subtitle: 'Política de privacidade',
                          onTap: () {
                            GoRouter.of(
                              context,
                            ).pushNamed(AppRoutes.privacyName);
                          },
                        ),
                        SettingsTile(
                          icon: Icons.description_outlined,
                          title: 'Termos de Uso',
                          subtitle: 'Termos e condições',
                          onTap: () {
                            GoRouter.of(context).pushNamed(AppRoutes.termsName);
                          },
                        ),
                      ],
                    ),
                    SettingsSection(
                      title: 'Sessão',
                      isLast: true,
                      items: [
                        SettingsTile(
                          icon: Icons.logout,
                          title: 'Sair',
                          subtitle: 'Desconectar da conta',
                          onTap: _controller.isLoggingOut
                              ? null
                              : _handleLogout,
                          isDestructive: true,
                          trailing: _controller.isLoggingOut
                              ? SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Theme.of(context).colorScheme.error,
                                  ),
                                )
                              : null,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
