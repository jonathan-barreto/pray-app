import 'package:go_router/go_router.dart';
import 'package:pray_app/app/modules/about/page/about_page.dart';
import 'package:pray_app/app/modules/appearance/page/appearance_page.dart';
import 'package:pray_app/app/modules/auth/login/page/login_page.dart';
import 'package:pray_app/app/modules/auth/register/page/register_page.dart';
import 'package:pray_app/app/modules/auth/splash/page/splash_page.dart';
import 'package:pray_app/app/modules/devotional/page/devotional_page.dart';
import 'package:pray_app/app/modules/favorite_passages/page/favorite_passages_page.dart';
import 'package:pray_app/app/modules/help/page/help_page.dart';
import 'package:pray_app/app/modules/language/page/language_page.dart';
import 'package:pray_app/app/modules/main/home/page/home_page.dart';
import 'package:pray_app/app/modules/metrics/page/metrics_page.dart';
import 'package:pray_app/app/modules/notifications/page/notifications_page.dart';
import 'package:pray_app/app/modules/passage/page/passage_page.dart';
import 'package:pray_app/app/modules/privacy/page/privacy_page.dart';
import 'package:pray_app/app/modules/private_devotionals/page/private_devotionals_page.dart';
import 'package:pray_app/app/modules/public_devotionals/page/public_devotionals_page.dart';
import 'package:pray_app/app/modules/terms/page/terms_page.dart';
import 'package:pray_app/app/modules/user/profile/page/profile_page.dart';
import 'package:pray_app/app/modules/welcome/page/welcome_page.dart';

class AppRoutes {
  static const splash = '/';
  static const welcome = '/welcome';
  static const login = '/login';
  static const register = '/register';
  static const home = '/home';
  static const devotional = '/devotional';
  static const metrics = '/metrics';
  static const profile = '/profile';
  static const email = '/email';
  static const password = '/password';
  static const notifications = '/notifications';
  static const privateDevotionals = '/private-devotionals';
  static const publicDevotionals = '/public-devotionals';
  static const favoritePassages = '/favorite-passages';
  static const help = '/help';
  static const about = '/about';
  static const privacy = '/privacy';
  static const terms = '/terms';
  static const language = '/language';
  static const appearance = '/appearance';
  static const passage = '/passage';

  static const splashName = 'splash';
  static const welcomeName = 'welcome';
  static const loginName = 'login';
  static const registerName = 'register';
  static const homeName = 'home';
  static const devotionalName = 'devotional';
  static const privateDevotionalsName = 'privateDevotionals';
  static const publicDevotionalsName = 'publicDevotionals';
  static const favoritePassagesName = 'favoritePassages';
  static const metricsName = 'metrics';
  static const profileName = 'profile';
  static const emailName = 'email';
  static const passwordName = 'password';
  static const notificationsName = 'notifications';
  static const helpName = 'help';
  static const aboutName = 'about';
  static const privacyName = 'privacy';
  static const termsName = 'terms';
  static const languageName = 'language';
  static const appearanceName = 'appearance';
  static const passageName = 'passage';
}

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.splash,
  routes: [
    GoRoute(
      path: AppRoutes.splash,
      name: AppRoutes.splashName,
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: AppRoutes.welcome,
      name: AppRoutes.welcomeName,
      builder: (context, state) => const WelcomePage(),
    ),
    GoRoute(
      path: AppRoutes.login,
      name: AppRoutes.loginName,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: AppRoutes.register,
      name: AppRoutes.registerName,
      builder: (context, state) => const RegisterPage(),
    ),
    GoRoute(
      path: AppRoutes.home,
      name: AppRoutes.homeName,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: AppRoutes.devotional,
      name: AppRoutes.devotionalName,
      builder: (context, state) {
        final extras = state.extra as Map<String, dynamic>?;
        final devotional = extras?['devotional'];

        return DevotionalPage(devotional: devotional);
      },
    ),
    GoRoute(
      path: AppRoutes.privateDevotionals,
      name: AppRoutes.privateDevotionalsName,
      builder: (context, state) => const PrivateDevotionalsPage(),
    ),
    GoRoute(
      path: AppRoutes.metrics,
      name: AppRoutes.metricsName,
      builder: (context, state) => const MetricsPage(),
    ),
    GoRoute(
      path: AppRoutes.profile,
      name: AppRoutes.profileName,
      builder: (context, state) => const ProfilePage(),
    ),
    GoRoute(
      path: AppRoutes.notifications,
      name: AppRoutes.notificationsName,
      builder: (context, state) => const NotificationsPage(),
    ),
    GoRoute(
      path: AppRoutes.publicDevotionals,
      name: AppRoutes.publicDevotionalsName,
      builder: (context, state) => const PublicDevotionalsPage(),
    ),
    GoRoute(
      path: AppRoutes.favoritePassages,
      name: AppRoutes.favoritePassagesName,
      builder: (context, state) => const FavoritePassagesPage(),
    ),
    GoRoute(
      path: AppRoutes.help,
      name: AppRoutes.helpName,
      builder: (context, state) => const HelpPage(),
    ),
    GoRoute(
      path: AppRoutes.about,
      name: AppRoutes.aboutName,
      builder: (context, state) => const AboutPage(),
    ),
    GoRoute(
      path: AppRoutes.privacy,
      name: AppRoutes.privacyName,
      builder: (context, state) => const PrivacyPage(),
    ),
    GoRoute(
      path: AppRoutes.terms,
      name: AppRoutes.termsName,
      builder: (context, state) => const TermsPage(),
    ),
    GoRoute(
      path: AppRoutes.language,
      name: AppRoutes.languageName,
      builder: (context, state) => const LanguagePage(),
    ),
    GoRoute(
      path: AppRoutes.appearance,
      name: AppRoutes.appearanceName,
      builder: (context, state) => const AppearancePage(),
    ),
    GoRoute(
      path: AppRoutes.passage,
      name: AppRoutes.passageName,
      builder: (context, state) {
        final extras = state.extra as Map<String, dynamic>?;
        final passage = extras?['passage'];

        return PassagePage(passage: passage);
      },
    ),
  ],
);
