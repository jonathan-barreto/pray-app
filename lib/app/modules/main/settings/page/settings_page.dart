import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:pray_app/app/app_controller.dart';
import 'package:pray_app/app/core/routes/app_router.dart';
import 'package:pray_app/app/di/di.dart';
import 'package:pray_app/app/modules/main/home/controller/home_page_controller.dart';
import 'package:pray_app/app/modules/main/settings/controller/settings_page_controller.dart';
import 'package:pray_app/app/modules/main/settings/widgets/language_dialog.dart';
import 'package:pray_app/app/modules/main/settings/widgets/logout_dialog.dart';
import 'package:pray_app/app/modules/main/settings/widgets/settings_section.dart';
import 'package:pray_app/app/modules/main/settings/widgets/settings_tile.dart';
import 'package:pray_app/app/modules/main/settings/widgets/user_profile_card.dart';
import 'package:pray_app/l10n/app_localizations.dart';

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
            content: Text(AppLocalizations.of(context)!
                .settingsLogoutError(_controller.errorMessage!)),
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
                      title:
                          AppLocalizations.of(context)!.settingsAccountSection,
                      items: [
                        SettingsTile(
                          icon: Icons.person_outline,
                          title: AppLocalizations.of(context)!.settingsProfile,
                          subtitle: AppLocalizations.of(context)!
                              .settingsProfileSubtitle,
                          onTap: () {
                            GoRouter.of(
                              context,
                            ).pushNamed(AppRoutes.profileName);
                          },
                        ),
                        SettingsTile(
                          icon: Icons.email_outlined,
                          title: AppLocalizations.of(context)!.settingsEmail,
                          subtitle: AppLocalizations.of(context)!
                              .settingsEmailSubtitle,
                          onTap: () {
                            GoRouter.of(context).pushNamed(AppRoutes.emailName);
                          },
                        ),
                        SettingsTile(
                          icon: Icons.lock_outlined,
                          title: AppLocalizations.of(context)!.settingsPassword,
                          subtitle: AppLocalizations.of(context)!
                              .settingsPasswordSubtitle,
                          onTap: () {
                            GoRouter.of(
                              context,
                            ).pushNamed(AppRoutes.passwordName);
                          },
                        ),
                        SettingsTile(
                          icon: Icons.language_outlined,
                          title: AppLocalizations.of(context)!.settingsLanguage,
                          subtitle: AppLocalizations.of(context)!
                              .settingsLanguageSubtitle,
                          onTap: () {
                            LanguageDialog.show(context);
                          },
                        ),
                      ],
                    ),
                    SettingsSection(
                      title: AppLocalizations.of(context)!
                          .settingsFavoritesSection,
                      items: [
                        SettingsTile(
                          icon: Icons.auto_stories_outlined,
                          title: AppLocalizations.of(context)!
                              .settingsDailyDevotionals,
                          subtitle: AppLocalizations.of(context)!
                              .settingsDailyDevotionalsSubtitle,
                          onTap: () {
                            GoRouter.of(
                              context,
                            ).pushNamed(AppRoutes.publicDevotionalsName);
                          },
                        ),
                        SettingsTile(
                          icon: Icons.menu_book_outlined,
                          title: AppLocalizations.of(context)!
                              .settingsDailyPassages,
                          subtitle: AppLocalizations.of(context)!
                              .settingsDailyPassagesSubtitle,
                          onTap: () {
                            GoRouter.of(
                              context,
                            ).pushNamed(AppRoutes.favoritePassagesName);
                          },
                        ),
                      ],
                    ),
                    SettingsSection(
                      title:
                          AppLocalizations.of(context)!.settingsSupportSection,
                      items: [
                        SettingsTile(
                          icon: Icons.help_outline,
                          title: AppLocalizations.of(context)!.settingsHelp,
                          subtitle: AppLocalizations.of(context)!
                              .settingsHelpSubtitle,
                          onTap: () {
                            GoRouter.of(context).pushNamed(AppRoutes.helpName);
                          },
                        ),
                        // SettingsTile(
                        //   icon: Icons.info_outline,
                        //   title: AppLocalizations.of(context)!.settingsAbout,
                        //   subtitle: AppLocalizations.of(context)!
                        //       .settingsAboutSubtitle,
                        //   onTap: () {
                        //     GoRouter.of(context).pushNamed(AppRoutes.aboutName);
                        //   },
                        // ),
                        SettingsTile(
                          icon: Icons.privacy_tip_outlined,
                          title: AppLocalizations.of(context)!.settingsPrivacy,
                          subtitle: AppLocalizations.of(context)!
                              .settingsPrivacySubtitle,
                          onTap: () {
                            GoRouter.of(
                              context,
                            ).pushNamed(AppRoutes.privacyName);
                          },
                        ),
                        SettingsTile(
                          icon: Icons.description_outlined,
                          title: AppLocalizations.of(context)!.settingsTerms,
                          subtitle: AppLocalizations.of(context)!
                              .settingsTermsSubtitle,
                          onTap: () {
                            GoRouter.of(context).pushNamed(AppRoutes.termsName);
                          },
                        ),
                      ],
                    ),
                    SettingsSection(
                      title:
                          AppLocalizations.of(context)!.settingsSessionSection,
                      isLast: true,
                      items: [
                        SettingsTile(
                          icon: Icons.logout,
                          title: AppLocalizations.of(context)!.settingsLogout,
                          subtitle: AppLocalizations.of(context)!
                              .settingsLogoutSubtitle,
                          onTap:
                              _controller.isLoggingOut ? null : _handleLogout,
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
