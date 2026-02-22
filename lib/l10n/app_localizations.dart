import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('pt')
  ];

  /// Login page title
  ///
  /// In en, this message translates to:
  /// **'Access Pray!'**
  String get loginTitle;

  /// No description provided for @loginSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Sign in to experience moments of faith and inspiration every day.'**
  String get loginSubtitle;

  /// No description provided for @loginButton.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get loginButton;

  /// No description provided for @loginForgotPassword.
  ///
  /// In en, this message translates to:
  /// **'I forgot my password'**
  String get loginForgotPassword;

  /// No description provided for @loginNoAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account? '**
  String get loginNoAccount;

  /// No description provided for @loginSignUp.
  ///
  /// In en, this message translates to:
  /// **'Create one now'**
  String get loginSignUp;

  /// No description provided for @registerTitle.
  ///
  /// In en, this message translates to:
  /// **'Create your account'**
  String get registerTitle;

  /// No description provided for @registerSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Join us and start your journey of faith and inspiration.'**
  String get registerSubtitle;

  /// No description provided for @registerButton.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get registerButton;

  /// No description provided for @registerHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account? '**
  String get registerHaveAccount;

  /// No description provided for @registerSignIn.
  ///
  /// In en, this message translates to:
  /// **'Sign in now'**
  String get registerSignIn;

  /// No description provided for @forgotPasswordAppBar.
  ///
  /// In en, this message translates to:
  /// **'Recover Password'**
  String get forgotPasswordAppBar;

  /// No description provided for @forgotPasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Forgot your password?'**
  String get forgotPasswordTitle;

  /// No description provided for @forgotPasswordSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter your email and we\'ll send a verification code to reset your password.'**
  String get forgotPasswordSubtitle;

  /// No description provided for @forgotPasswordButton.
  ///
  /// In en, this message translates to:
  /// **'Send Code'**
  String get forgotPasswordButton;

  /// No description provided for @verifyCodeAppBar.
  ///
  /// In en, this message translates to:
  /// **'Verify Code'**
  String get verifyCodeAppBar;

  /// No description provided for @verifyCodeTitle.
  ///
  /// In en, this message translates to:
  /// **'Enter the code'**
  String get verifyCodeTitle;

  /// No description provided for @verifyCodeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'We sent a 6-digit code to {email}'**
  String verifyCodeSubtitle(String email);

  /// No description provided for @verifyCodeLabel.
  ///
  /// In en, this message translates to:
  /// **'Verification Code'**
  String get verifyCodeLabel;

  /// No description provided for @verifyCodeHint.
  ///
  /// In en, this message translates to:
  /// **'123456'**
  String get verifyCodeHint;

  /// No description provided for @verifyCodeEmpty.
  ///
  /// In en, this message translates to:
  /// **'Enter the code'**
  String get verifyCodeEmpty;

  /// No description provided for @verifyCodeInvalid.
  ///
  /// In en, this message translates to:
  /// **'The code must be 6 digits'**
  String get verifyCodeInvalid;

  /// No description provided for @verifyCodeButton.
  ///
  /// In en, this message translates to:
  /// **'Verify Code'**
  String get verifyCodeButton;

  /// No description provided for @resetPasswordAppBar.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get resetPasswordAppBar;

  /// No description provided for @resetPasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Create new password'**
  String get resetPasswordTitle;

  /// No description provided for @resetPasswordSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter your new password. Make sure it is secure and easy to remember.'**
  String get resetPasswordSubtitle;

  /// No description provided for @resetPasswordNewLabel.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get resetPasswordNewLabel;

  /// No description provided for @resetPasswordConfirmLabel.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get resetPasswordConfirmLabel;

  /// No description provided for @resetPasswordConfirmEmpty.
  ///
  /// In en, this message translates to:
  /// **'Confirm your password'**
  String get resetPasswordConfirmEmpty;

  /// No description provided for @resetPasswordMismatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get resetPasswordMismatch;

  /// No description provided for @resetPasswordButton.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get resetPasswordButton;

  /// No description provided for @emailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get emailLabel;

  /// No description provided for @passwordLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get passwordLabel;

  /// No description provided for @nameLabel.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get nameLabel;

  /// No description provided for @todaySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Keep your flame alive, every day is a new opportunity to connect with God.'**
  String get todaySubtitle;

  /// No description provided for @greetingMorning.
  ///
  /// In en, this message translates to:
  /// **'Good morning, {name}!'**
  String greetingMorning(String name);

  /// No description provided for @greetingAfternoon.
  ///
  /// In en, this message translates to:
  /// **'Good afternoon, {name}!'**
  String greetingAfternoon(String name);

  /// No description provided for @greetingEvening.
  ///
  /// In en, this message translates to:
  /// **'Good evening, {name}!'**
  String greetingEvening(String name);

  /// No description provided for @personalizedDevotionalTitle.
  ///
  /// In en, this message translates to:
  /// **'Personalized Devotional'**
  String get personalizedDevotionalTitle;

  /// No description provided for @personalizedDevotionalSubtitle.
  ///
  /// In en, this message translates to:
  /// **'How are you feeling today?'**
  String get personalizedDevotionalSubtitle;

  /// No description provided for @personalizedDevotionalHint.
  ///
  /// In en, this message translates to:
  /// **'Ex: I\'m anxious about work...'**
  String get personalizedDevotionalHint;

  /// No description provided for @personalizedDevotionalButton.
  ///
  /// In en, this message translates to:
  /// **'Generate Devotional'**
  String get personalizedDevotionalButton;

  /// No description provided for @myFavoritesTitle.
  ///
  /// In en, this message translates to:
  /// **'My Favorites'**
  String get myFavoritesTitle;

  /// No description provided for @myFavoritesDescription.
  ///
  /// In en, this message translates to:
  /// **'Personalized devotionals you marked as favorites'**
  String get myFavoritesDescription;

  /// No description provided for @myFavoritesViewMore.
  ///
  /// In en, this message translates to:
  /// **'View More Devotionals'**
  String get myFavoritesViewMore;

  /// No description provided for @myFavoritesEmpty.
  ///
  /// In en, this message translates to:
  /// **'No favorites yet'**
  String get myFavoritesEmpty;

  /// No description provided for @settingsAccountSection.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get settingsAccountSection;

  /// No description provided for @settingsProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get settingsProfile;

  /// No description provided for @settingsProfileSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Edit personal information'**
  String get settingsProfileSubtitle;

  /// No description provided for @settingsEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get settingsEmail;

  /// No description provided for @settingsEmailSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Edit email'**
  String get settingsEmailSubtitle;

  /// No description provided for @settingsPassword.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get settingsPassword;

  /// No description provided for @settingsPasswordSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Edit password'**
  String get settingsPasswordSubtitle;

  /// No description provided for @settingsLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settingsLanguage;

  /// No description provided for @settingsLanguageSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Change app language'**
  String get settingsLanguageSubtitle;

  /// No description provided for @settingsFavoritesSection.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get settingsFavoritesSection;

  /// No description provided for @settingsDailyDevotionals.
  ///
  /// In en, this message translates to:
  /// **'Favorite Daily Devotionals'**
  String get settingsDailyDevotionals;

  /// No description provided for @settingsDailyDevotionalsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'View and manage favorite daily devotionals'**
  String get settingsDailyDevotionalsSubtitle;

  /// No description provided for @settingsDailyPassages.
  ///
  /// In en, this message translates to:
  /// **'Favorite Daily Passages'**
  String get settingsDailyPassages;

  /// No description provided for @settingsDailyPassagesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'View and manage favorite daily passages'**
  String get settingsDailyPassagesSubtitle;

  /// No description provided for @settingsSupportSection.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get settingsSupportSection;

  /// No description provided for @settingsHelp.
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get settingsHelp;

  /// No description provided for @settingsHelpSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Help center and FAQ'**
  String get settingsHelpSubtitle;

  /// No description provided for @settingsAbout.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get settingsAbout;

  /// No description provided for @settingsAboutSubtitle.
  ///
  /// In en, this message translates to:
  /// **'App version and information'**
  String get settingsAboutSubtitle;

  /// No description provided for @settingsPrivacy.
  ///
  /// In en, this message translates to:
  /// **'Privacy'**
  String get settingsPrivacy;

  /// No description provided for @settingsPrivacySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Privacy policy'**
  String get settingsPrivacySubtitle;

  /// No description provided for @settingsTerms.
  ///
  /// In en, this message translates to:
  /// **'Terms of Use'**
  String get settingsTerms;

  /// No description provided for @settingsTermsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Terms and conditions'**
  String get settingsTermsSubtitle;

  /// No description provided for @settingsSessionSection.
  ///
  /// In en, this message translates to:
  /// **'Session'**
  String get settingsSessionSection;

  /// No description provided for @settingsLogout.
  ///
  /// In en, this message translates to:
  /// **'Sign Out'**
  String get settingsLogout;

  /// No description provided for @settingsLogoutSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Disconnect from account'**
  String get settingsLogoutSubtitle;

  /// No description provided for @settingsLogoutError.
  ///
  /// In en, this message translates to:
  /// **'Error signing out: {error}'**
  String settingsLogoutError(String error);

  /// No description provided for @logoutDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Sign out'**
  String get logoutDialogTitle;

  /// No description provided for @logoutDialogMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to sign out?'**
  String get logoutDialogMessage;

  /// No description provided for @logoutDialogCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get logoutDialogCancel;

  /// No description provided for @logoutDialogConfirm.
  ///
  /// In en, this message translates to:
  /// **'Sign Out'**
  String get logoutDialogConfirm;

  /// No description provided for @profileCardRanking.
  ///
  /// In en, this message translates to:
  /// **'Ranking'**
  String get profileCardRanking;

  /// No description provided for @profileCardStreak.
  ///
  /// In en, this message translates to:
  /// **'Streak'**
  String get profileCardStreak;

  /// No description provided for @profileCardCompleted.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get profileCardCompleted;

  /// No description provided for @profileCardViewMetrics.
  ///
  /// In en, this message translates to:
  /// **'View my metrics'**
  String get profileCardViewMetrics;

  /// No description provided for @metricsAppBar.
  ///
  /// In en, this message translates to:
  /// **'My Metrics'**
  String get metricsAppBar;

  /// No description provided for @metricsProgress.
  ///
  /// In en, this message translates to:
  /// **'Progress'**
  String get metricsProgress;

  /// No description provided for @metricsDevotionalsCompleted.
  ///
  /// In en, this message translates to:
  /// **'Devotionals Completed'**
  String get metricsDevotionalsCompleted;

  /// No description provided for @metricsDevotionalsCompletedSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Total devotionals completed'**
  String get metricsDevotionalsCompletedSubtitle;

  /// No description provided for @metricsPassagesCompleted.
  ///
  /// In en, this message translates to:
  /// **'Passages Completed'**
  String get metricsPassagesCompleted;

  /// No description provided for @metricsPassagesCompletedSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Total passages completed'**
  String get metricsPassagesCompletedSubtitle;

  /// No description provided for @metricsRanking.
  ///
  /// In en, this message translates to:
  /// **'Ranking'**
  String get metricsRanking;

  /// No description provided for @metricsRankingSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Your position in the global ranking'**
  String get metricsRankingSubtitle;

  /// No description provided for @helpAppBar.
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get helpAppBar;

  /// No description provided for @helpFaqTitle.
  ///
  /// In en, this message translates to:
  /// **'Frequently Asked Questions (FAQ)'**
  String get helpFaqTitle;

  /// No description provided for @helpQ1.
  ///
  /// In en, this message translates to:
  /// **'What is Pray?'**
  String get helpQ1;

  /// No description provided for @helpA1.
  ///
  /// In en, this message translates to:
  /// **'Pray is a Christian devotional app that uses technology to help you reflect on the Bible and pray based on what you\'re feeling at the moment. It does not replace Bible reading, personal prayer, or pastoral care, but serves as daily spiritual support.'**
  String get helpA1;

  /// No description provided for @helpQ2.
  ///
  /// In en, this message translates to:
  /// **'How do personalized devotionals work?'**
  String get helpQ2;

  /// No description provided for @helpA2.
  ///
  /// In en, this message translates to:
  /// **'By telling us how you\'re feeling, Pray generates a devotional based on Scripture, with a reflection and prayer that help contextualize God\'s Word to your current experience. The content is always grounded in the Bible and presented as a possible reading, not as absolute revelation.'**
  String get helpA2;

  /// No description provided for @helpQ3.
  ///
  /// In en, this message translates to:
  /// **'Does Pray \"speak for God\"?'**
  String get helpQ3;

  /// No description provided for @helpA3.
  ///
  /// In en, this message translates to:
  /// **'No. Pray does not offer prophecies, revelations, or direct messages from God. The app acts as a facilitator of biblical reflection, encouraging you to pray, think, and seek God personally.'**
  String get helpA3;

  /// No description provided for @helpQ4.
  ///
  /// In en, this message translates to:
  /// **'Are my private devotionals really private?'**
  String get helpQ4;

  /// No description provided for @helpA4.
  ///
  /// In en, this message translates to:
  /// **'Yes. Private devotionals are visible only to you. They are not published, shared, or displayed to other users.'**
  String get helpA4;

  /// No description provided for @helpQ5.
  ///
  /// In en, this message translates to:
  /// **'What\'s the difference between public and private devotionals?'**
  String get helpQ5;

  /// No description provided for @helpA5.
  ///
  /// In en, this message translates to:
  /// **'Public devotionals: daily content generated for the entire app community.\n\nPrivate devotionals: personalized content generated exclusively from the feeling you share.'**
  String get helpA5;

  /// No description provided for @helpQ6.
  ///
  /// In en, this message translates to:
  /// **'What are streaks, metrics, and achievements?'**
  String get helpQ6;

  /// No description provided for @helpA6.
  ///
  /// In en, this message translates to:
  /// **'These are optional features that help you track your consistency and engagement with the app. They do not measure spirituality, faith, or Christian maturity — they only record usage and habits.'**
  String get helpA6;

  /// No description provided for @helpQ7.
  ///
  /// In en, this message translates to:
  /// **'Can I delete my account?'**
  String get helpQ7;

  /// No description provided for @helpA7.
  ///
  /// In en, this message translates to:
  /// **'Yes. You can request to delete your account at any time. When you do, your personal data and private devotionals will be removed as described in the privacy policy.'**
  String get helpA7;

  /// No description provided for @helpQ8.
  ///
  /// In en, this message translates to:
  /// **'Does Pray replace pastoral or psychological counseling?'**
  String get helpQ8;

  /// No description provided for @helpA8.
  ///
  /// In en, this message translates to:
  /// **'No. Pray does not replace spiritual leaders, pastoral counseling, therapy, or professional care. In situations of intense suffering, persistent anxiety, or emotional crisis, it is important to seek qualified help.'**
  String get helpA8;

  /// No description provided for @aboutAppBar.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get aboutAppBar;

  /// No description provided for @aboutVersion.
  ///
  /// In en, this message translates to:
  /// **'Version 1.0.0'**
  String get aboutVersion;

  /// No description provided for @aboutTitle.
  ///
  /// In en, this message translates to:
  /// **'About Pray'**
  String get aboutTitle;

  /// No description provided for @aboutDescription.
  ///
  /// In en, this message translates to:
  /// **'Pray was born from the desire to create a simple, respectful, and profound space for those who want to draw closer to God amid the real emotions of life.\n\nWe believe that the Christian faith does not ignore feelings like anxiety, doubt, or weariness, but brings them honestly before God. That\'s why Pray uses technology as a tool to point to Scripture, encourage prayer, and foster moments of listening and reflection.\n\nPray does not offer ready-made answers, easy promises, or magic solutions. It invites you to pause, read the Bible, and pray personally, recognizing that each spiritual journey is unique.\n\nOur commitment is to unite theological care, responsible language, and human experience, respecting both the faith and the conscience of each user.'**
  String get aboutDescription;

  /// No description provided for @aboutDevelopedWith.
  ///
  /// In en, this message translates to:
  /// **'Developed with'**
  String get aboutDevelopedWith;

  /// No description provided for @aboutCopyright.
  ///
  /// In en, this message translates to:
  /// **'© 2025 Pray. All rights reserved.'**
  String get aboutCopyright;

  /// No description provided for @aboutLastUpdate.
  ///
  /// In en, this message translates to:
  /// **'Last update'**
  String get aboutLastUpdate;

  /// No description provided for @aboutLastUpdateValue.
  ///
  /// In en, this message translates to:
  /// **'December 2025'**
  String get aboutLastUpdateValue;

  /// No description provided for @languageAppBar.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get languageAppBar;

  /// No description provided for @languageDescription.
  ///
  /// In en, this message translates to:
  /// **'Select the app language. Changes will be applied immediately.'**
  String get languageDescription;

  /// No description provided for @languagePortuguese.
  ///
  /// In en, this message translates to:
  /// **'Português'**
  String get languagePortuguese;

  /// No description provided for @languageEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageEnglish;

  /// No description provided for @languageChanged.
  ///
  /// In en, this message translates to:
  /// **'Language changed successfully'**
  String get languageChanged;

  /// No description provided for @notificationsAppBar.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notificationsAppBar;

  /// No description provided for @notificationsDescription.
  ///
  /// In en, this message translates to:
  /// **'Customize your notifications so you don\'t miss any important content.'**
  String get notificationsDescription;

  /// No description provided for @notificationsPushSection.
  ///
  /// In en, this message translates to:
  /// **'Push Notifications'**
  String get notificationsPushSection;

  /// No description provided for @notificationsDailyDevotional.
  ///
  /// In en, this message translates to:
  /// **'Daily Devotional'**
  String get notificationsDailyDevotional;

  /// No description provided for @notificationsDailyDevotionalSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Receive reminders for the daily devotional'**
  String get notificationsDailyDevotionalSubtitle;

  /// No description provided for @notificationsNewContent.
  ///
  /// In en, this message translates to:
  /// **'New Content'**
  String get notificationsNewContent;

  /// No description provided for @notificationsNewContentSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Notifications about new devotionals'**
  String get notificationsNewContentSubtitle;

  /// No description provided for @notificationsAchievements.
  ///
  /// In en, this message translates to:
  /// **'Achievements'**
  String get notificationsAchievements;

  /// No description provided for @notificationsAchievementsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Receive achievement notifications'**
  String get notificationsAchievementsSubtitle;

  /// No description provided for @notificationsReminders.
  ///
  /// In en, this message translates to:
  /// **'Reminders'**
  String get notificationsReminders;

  /// No description provided for @notificationsRemindersSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Personalized reminders'**
  String get notificationsRemindersSubtitle;

  /// No description provided for @notificationsEmailSection.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get notificationsEmailSection;

  /// No description provided for @notificationsEmailToggle.
  ///
  /// In en, this message translates to:
  /// **'Email Notifications'**
  String get notificationsEmailToggle;

  /// No description provided for @notificationsEmailToggleSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Receive updates by email'**
  String get notificationsEmailToggleSubtitle;

  /// No description provided for @devotionalCongrats.
  ///
  /// In en, this message translates to:
  /// **'Congratulations, {name}!'**
  String devotionalCongrats(String name);

  /// No description provided for @devotionalCompleteMessage.
  ///
  /// In en, this message translates to:
  /// **'You completed today\'s devotional. May the reflections and teachings stay with you throughout the day.'**
  String get devotionalCompleteMessage;

  /// No description provided for @devotionalRateQuestion.
  ///
  /// In en, this message translates to:
  /// **'How do you rate this devotional?'**
  String get devotionalRateQuestion;

  /// No description provided for @devotionalFeedbackHint.
  ///
  /// In en, this message translates to:
  /// **'Leave a comment about this devotional (optional)'**
  String get devotionalFeedbackHint;

  /// No description provided for @devotionalSubmitting.
  ///
  /// In en, this message translates to:
  /// **'Submitting...'**
  String get devotionalSubmitting;

  /// No description provided for @devotionalSubmitButton.
  ///
  /// In en, this message translates to:
  /// **'Rate'**
  String get devotionalSubmitButton;

  /// No description provided for @devotionalBackHome.
  ///
  /// In en, this message translates to:
  /// **'Back to home'**
  String get devotionalBackHome;

  /// No description provided for @errorLikePassage.
  ///
  /// In en, this message translates to:
  /// **'Error liking passage'**
  String get errorLikePassage;

  /// No description provided for @errorLikeDevotional.
  ///
  /// In en, this message translates to:
  /// **'Error liking devotional'**
  String get errorLikeDevotional;

  /// No description provided for @errorServerError.
  ///
  /// In en, this message translates to:
  /// **'A server error occurred. Please try again later.'**
  String get errorServerError;

  /// No description provided for @errorNoConnection.
  ///
  /// In en, this message translates to:
  /// **'No internet connection. Check your connection and try again.'**
  String get errorNoConnection;

  /// No description provided for @errorNotAuthenticated.
  ///
  /// In en, this message translates to:
  /// **'Could not authenticate. Please log in again.'**
  String get errorNotAuthenticated;

  /// No description provided for @errorInvalidRequest.
  ///
  /// In en, this message translates to:
  /// **'Invalid request. Check the data and try again.'**
  String get errorInvalidRequest;

  /// No description provided for @errorParsingError.
  ///
  /// In en, this message translates to:
  /// **'Error processing data. Please try again.'**
  String get errorParsingError;

  /// No description provided for @errorGeneric.
  ///
  /// In en, this message translates to:
  /// **'An error occurred. Please try again later.'**
  String get errorGeneric;

  /// No description provided for @welcomeHeadline.
  ///
  /// In en, this message translates to:
  /// **'Welcome\nto Pray!'**
  String get welcomeHeadline;

  /// No description provided for @welcomeDescription.
  ///
  /// In en, this message translates to:
  /// **'Discover devotionals created especially for you. Reflect, pray, and strengthen your walk with God every day.'**
  String get welcomeDescription;

  /// No description provided for @welcomeButton.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get welcomeButton;

  /// No description provided for @privacyAppBar.
  ///
  /// In en, this message translates to:
  /// **'Privacy'**
  String get privacyAppBar;

  /// No description provided for @privacyBanner.
  ///
  /// In en, this message translates to:
  /// **'Your privacy is taken seriously.'**
  String get privacyBanner;

  /// No description provided for @privacyDataTitle.
  ///
  /// In en, this message translates to:
  /// **'What data do we collect?'**
  String get privacyDataTitle;

  /// No description provided for @privacyDataContent.
  ///
  /// In en, this message translates to:
  /// **'Pray only collects the data necessary for the app to function, such as:\n\n• Name and email\n• Authentication information\n• Feelings shared for devotional generation\n• In-app interactions (likes, completions, feedback)'**
  String get privacyDataContent;

  /// No description provided for @privacyUsageTitle.
  ///
  /// In en, this message translates to:
  /// **'How is your data used?'**
  String get privacyUsageTitle;

  /// No description provided for @privacyUsageContent.
  ///
  /// In en, this message translates to:
  /// **'Your data is used exclusively to:\n\n• Authenticate your account\n• Personalize your app experience\n• Generate private devotionals\n• Improve content and service quality\n\nWe never use your data for external commercial purposes or sell it to third parties.'**
  String get privacyUsageContent;

  /// No description provided for @privacySharedTitle.
  ///
  /// In en, this message translates to:
  /// **'Are private devotionals shared?'**
  String get privacySharedTitle;

  /// No description provided for @privacySharedContent.
  ///
  /// In en, this message translates to:
  /// **'No. Private devotionals and shared feelings are not shared with other users. They are treated as personal content.'**
  String get privacySharedContent;

  /// No description provided for @privacyAiTitle.
  ///
  /// In en, this message translates to:
  /// **'Use of artificial intelligence'**
  String get privacyAiTitle;

  /// No description provided for @privacyAiContent.
  ///
  /// In en, this message translates to:
  /// **'Pray uses artificial intelligence to generate devotional content from defined parameters. This content does not represent divine revelations nor replace faith, the Bible, or personal prayer.'**
  String get privacyAiContent;

  /// No description provided for @privacyDeleteTitle.
  ///
  /// In en, this message translates to:
  /// **'Can I delete my data?'**
  String get privacyDeleteTitle;

  /// No description provided for @privacyDeleteContent.
  ///
  /// In en, this message translates to:
  /// **'Yes. You can request account deletion at any time. After deletion, your personal data and private content will be permanently removed, subject to applicable legal obligations.'**
  String get privacyDeleteContent;

  /// No description provided for @privacySecurityTitle.
  ///
  /// In en, this message translates to:
  /// **'Security'**
  String get privacySecurityTitle;

  /// No description provided for @privacySecurityContent.
  ///
  /// In en, this message translates to:
  /// **'We adopt technical and organizational measures to protect your data against unauthorized access, loss, or misuse.'**
  String get privacySecurityContent;

  /// No description provided for @privacyLastUpdate.
  ///
  /// In en, this message translates to:
  /// **'Last update: December 2025'**
  String get privacyLastUpdate;

  /// No description provided for @termsAppBar.
  ///
  /// In en, this message translates to:
  /// **'Terms of Use'**
  String get termsAppBar;

  /// No description provided for @termsBanner.
  ///
  /// In en, this message translates to:
  /// **'Terms and Conditions of Use'**
  String get termsBanner;

  /// No description provided for @termsIntro.
  ///
  /// In en, this message translates to:
  /// **'By using the Pray app, you agree to the terms and conditions described below. If you disagree with any point, we recommend that you do not use the app.'**
  String get termsIntro;

  /// No description provided for @termsSection1Title.
  ///
  /// In en, this message translates to:
  /// **'1. About Pray'**
  String get termsSection1Title;

  /// No description provided for @termsSection1Content.
  ///
  /// In en, this message translates to:
  /// **'Pray is an app that uses technology, including artificial intelligence, to assist users in biblical reflection and the practice of Christian prayer.\n\nPray does not offer pastoral, psychological, medical, or individualized spiritual counseling, nor does it replace Bible reading, personal prayer, pastoral care, or professional guidance.\n\nThe content provided is reflective and devotional in nature, and is not presented as divine revelation, prophecy, or absolute guidance.'**
  String get termsSection1Content;

  /// No description provided for @termsSection2Title.
  ///
  /// In en, this message translates to:
  /// **'2. Eligibility'**
  String get termsSection2Title;

  /// No description provided for @termsSection2Content.
  ///
  /// In en, this message translates to:
  /// **'By using Pray, you declare that:\n\n• You have the legal capacity to accept these Terms\n• The information provided during registration is true and up-to-date\n• You will use the app ethically, respectfully, and in compliance with these Terms'**
  String get termsSection2Content;

  /// No description provided for @termsSection3Title.
  ///
  /// In en, this message translates to:
  /// **'3. User Account'**
  String get termsSection3Title;

  /// No description provided for @termsSection3Content.
  ///
  /// In en, this message translates to:
  /// **'To access certain features, you need to create an account.\n\nYou are responsible for:\n\n• Maintaining the confidentiality of your credentials\n• All activities carried out on your account\n• Immediately reporting any unauthorized use\n\nPray reserves the right to suspend or terminate accounts in case of misuse or violation of these Terms.'**
  String get termsSection3Content;

  /// No description provided for @termsSection4Title.
  ///
  /// In en, this message translates to:
  /// **'4. Use of Artificial Intelligence'**
  String get termsSection4Title;

  /// No description provided for @termsSection4Content.
  ///
  /// In en, this message translates to:
  /// **'Pray uses artificial intelligence to generate devotional content based on defined parameters, including feelings shared by the user.\n\nYou acknowledge that:\n\n• The generated content is a possible reading of Scripture, not a definitive interpretation\n• Artificial intelligence does not speak on behalf of God\n• No content should be understood as a specific promise of divine action\n\nThe use of AI aims to assist reflection and prayer, not to replace the user\'s personal spiritual experience.'**
  String get termsSection4Content;

  /// No description provided for @termsSection5Title.
  ///
  /// In en, this message translates to:
  /// **'5. Personalized Devotionals and Usage Limits'**
  String get termsSection5Title;

  /// No description provided for @termsSection5Content.
  ///
  /// In en, this message translates to:
  /// **'Pray may establish limits on the generation of personalized devotionals, in order to:\n\n• Preserve a healthy usage rhythm\n• Maintain experience quality\n• Ensure the technical sustainability of the service\n\nThese limits may be adjusted at any time, with communication within the app.'**
  String get termsSection5Content;

  /// No description provided for @termsSection6Title.
  ///
  /// In en, this message translates to:
  /// **'6. Private and Public Content'**
  String get termsSection6Title;

  /// No description provided for @termsSection6Content.
  ///
  /// In en, this message translates to:
  /// **'Private devotionals are generated exclusively for the user and are not shared publicly.\n\nPublic devotionals are made available to the entire app community.\n\nThe user is responsible for the emotional or textual content they provide when using the app.'**
  String get termsSection6Content;

  /// No description provided for @termsSection7Title.
  ///
  /// In en, this message translates to:
  /// **'7. Proper Use of the App'**
  String get termsSection7Title;

  /// No description provided for @termsSection7Content.
  ///
  /// In en, this message translates to:
  /// **'The user is prohibited from:\n\n• Using Pray for illegal or abusive purposes\n• Attempting to exploit technical or security flaws\n• Using the app\'s content as a substitute for professional counseling in serious situations\n\nIn cases of intense suffering, persistent anxiety, or emotional crises, it is recommended to seek specialized help.'**
  String get termsSection7Content;

  /// No description provided for @termsSection8Title.
  ///
  /// In en, this message translates to:
  /// **'8. Intellectual Property'**
  String get termsSection8Title;

  /// No description provided for @termsSection8Content.
  ///
  /// In en, this message translates to:
  /// **'All content available on Pray, including texts, design, structure, and features, is protected by copyright.\n\nReproduction, distribution, or modification of content without prior authorization is prohibited, except within the limits permitted by law.'**
  String get termsSection8Content;

  /// No description provided for @termsSection9Title.
  ///
  /// In en, this message translates to:
  /// **'9. Account Deletion'**
  String get termsSection9Title;

  /// No description provided for @termsSection9Content.
  ///
  /// In en, this message translates to:
  /// **'The user may request account deletion at any time.\n\nAfter deletion:\n\n• Personal data and private content will be removed, subject to applicable legal obligations\n• Access to the app will be permanently terminated'**
  String get termsSection9Content;

  /// No description provided for @termsSection10Title.
  ///
  /// In en, this message translates to:
  /// **'10. Limitation of Liability'**
  String get termsSection10Title;

  /// No description provided for @termsSection10Content.
  ///
  /// In en, this message translates to:
  /// **'Pray is not responsible for:\n\n• Personal decisions made based on app content\n• Individual interpretations of generated content\n• Possible temporary technical unavailability\n\nUse of the app is the sole responsibility of the user.'**
  String get termsSection10Content;

  /// No description provided for @termsSection11Title.
  ///
  /// In en, this message translates to:
  /// **'11. Changes to Terms'**
  String get termsSection11Title;

  /// No description provided for @termsSection11Content.
  ///
  /// In en, this message translates to:
  /// **'Pray may update these Terms of Use periodically.\n\nContinued use of the app after changes implies agreement with the new terms.'**
  String get termsSection11Content;

  /// No description provided for @termsSection12Title.
  ///
  /// In en, this message translates to:
  /// **'12. Contact'**
  String get termsSection12Title;

  /// No description provided for @termsSection12Content.
  ///
  /// In en, this message translates to:
  /// **'For questions, suggestions, or requests related to these Terms, the user may contact us through the official channels available in the app.'**
  String get termsSection12Content;

  /// No description provided for @termsLastUpdate.
  ///
  /// In en, this message translates to:
  /// **'Last update: December 2025'**
  String get termsLastUpdate;

  /// No description provided for @appearanceAppBar.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get appearanceAppBar;

  /// No description provided for @appearanceTheme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get appearanceTheme;

  /// No description provided for @appearanceLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get appearanceLight;

  /// No description provided for @appearanceDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get appearanceDark;

  /// No description provided for @appearanceSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get appearanceSystem;

  /// No description provided for @appearanceFontSize.
  ///
  /// In en, this message translates to:
  /// **'Font Size'**
  String get appearanceFontSize;

  /// No description provided for @appearanceSmall.
  ///
  /// In en, this message translates to:
  /// **'Small'**
  String get appearanceSmall;

  /// No description provided for @appearanceLarge.
  ///
  /// In en, this message translates to:
  /// **'Large'**
  String get appearanceLarge;

  /// No description provided for @profileAppBar.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileAppBar;

  /// No description provided for @profilePersonalInfo.
  ///
  /// In en, this message translates to:
  /// **'Personal Information'**
  String get profilePersonalInfo;

  /// No description provided for @profileNameHint.
  ///
  /// In en, this message translates to:
  /// **'Full name'**
  String get profileNameHint;

  /// No description provided for @profileNameEmpty.
  ///
  /// In en, this message translates to:
  /// **'Please enter your name'**
  String get profileNameEmpty;

  /// No description provided for @profileSaveButton.
  ///
  /// In en, this message translates to:
  /// **'Save Changes'**
  String get profileSaveButton;

  /// No description provided for @profileUpdateSuccess.
  ///
  /// In en, this message translates to:
  /// **'Profile updated successfully!'**
  String get profileUpdateSuccess;

  /// No description provided for @emailUpdateAppBar.
  ///
  /// In en, this message translates to:
  /// **'Update Email'**
  String get emailUpdateAppBar;

  /// No description provided for @emailUpdateTitle.
  ///
  /// In en, this message translates to:
  /// **'Update Email'**
  String get emailUpdateTitle;

  /// No description provided for @emailUpdateSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter your new email address and your current password for verification.'**
  String get emailUpdateSubtitle;

  /// No description provided for @emailUpdateNewHint.
  ///
  /// In en, this message translates to:
  /// **'New email'**
  String get emailUpdateNewHint;

  /// No description provided for @emailUpdateEmpty.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email'**
  String get emailUpdateEmpty;

  /// No description provided for @emailUpdateInvalid.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email'**
  String get emailUpdateInvalid;

  /// No description provided for @emailUpdateCurrentPassword.
  ///
  /// In en, this message translates to:
  /// **'Current password'**
  String get emailUpdateCurrentPassword;

  /// No description provided for @emailUpdatePasswordEmpty.
  ///
  /// In en, this message translates to:
  /// **'Please enter your password'**
  String get emailUpdatePasswordEmpty;

  /// No description provided for @emailUpdateButton.
  ///
  /// In en, this message translates to:
  /// **'Update Email'**
  String get emailUpdateButton;

  /// No description provided for @emailUpdateSuccess.
  ///
  /// In en, this message translates to:
  /// **'Email updated successfully. Please verify your new email.'**
  String get emailUpdateSuccess;

  /// No description provided for @passwordUpdateAppBar.
  ///
  /// In en, this message translates to:
  /// **'Update Password'**
  String get passwordUpdateAppBar;

  /// No description provided for @passwordUpdateTitle.
  ///
  /// In en, this message translates to:
  /// **'Update Password'**
  String get passwordUpdateTitle;

  /// No description provided for @passwordUpdateSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter your current password and the new password you want to use.'**
  String get passwordUpdateSubtitle;

  /// No description provided for @passwordUpdateCurrentLabel.
  ///
  /// In en, this message translates to:
  /// **'Current password'**
  String get passwordUpdateCurrentLabel;

  /// No description provided for @passwordUpdateCurrentEmpty.
  ///
  /// In en, this message translates to:
  /// **'Please enter your current password'**
  String get passwordUpdateCurrentEmpty;

  /// No description provided for @passwordUpdateNewLabel.
  ///
  /// In en, this message translates to:
  /// **'New password'**
  String get passwordUpdateNewLabel;

  /// No description provided for @passwordUpdateNewEmpty.
  ///
  /// In en, this message translates to:
  /// **'Please enter your new password'**
  String get passwordUpdateNewEmpty;

  /// No description provided for @passwordUpdateMinLength.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters'**
  String get passwordUpdateMinLength;

  /// No description provided for @passwordUpdateConfirmLabel.
  ///
  /// In en, this message translates to:
  /// **'Confirm new password'**
  String get passwordUpdateConfirmLabel;

  /// No description provided for @passwordUpdateConfirmEmpty.
  ///
  /// In en, this message translates to:
  /// **'Please confirm your new password'**
  String get passwordUpdateConfirmEmpty;

  /// No description provided for @passwordUpdateMismatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordUpdateMismatch;

  /// No description provided for @passwordUpdateButton.
  ///
  /// In en, this message translates to:
  /// **'Update Password'**
  String get passwordUpdateButton;

  /// No description provided for @passwordUpdateSuccess.
  ///
  /// In en, this message translates to:
  /// **'Password updated successfully.'**
  String get passwordUpdateSuccess;

  /// No description provided for @devotionalAppBar.
  ///
  /// In en, this message translates to:
  /// **'Devotional'**
  String get devotionalAppBar;

  /// No description provided for @devotionalFeedbackSuccess.
  ///
  /// In en, this message translates to:
  /// **'Rating submitted! Thank you for your feedback.'**
  String get devotionalFeedbackSuccess;

  /// No description provided for @passageAppBar.
  ///
  /// In en, this message translates to:
  /// **'Bible Passage'**
  String get passageAppBar;

  /// No description provided for @sharePassageFeature.
  ///
  /// In en, this message translates to:
  /// **'Share passage'**
  String get sharePassageFeature;

  /// No description provided for @listenPassageFeature.
  ///
  /// In en, this message translates to:
  /// **'Listen to passage'**
  String get listenPassageFeature;

  /// No description provided for @favoritePassagesAppBar.
  ///
  /// In en, this message translates to:
  /// **'Favorite Passages'**
  String get favoritePassagesAppBar;

  /// No description provided for @favoritePassagesEmpty.
  ///
  /// In en, this message translates to:
  /// **'No favorite passages'**
  String get favoritePassagesEmpty;

  /// No description provided for @favoritePassagesEmptyDescription.
  ///
  /// In en, this message translates to:
  /// **'You haven\'t favorited any Bible passages yet. Explore and favorite your preferred passages!'**
  String get favoritePassagesEmptyDescription;

  /// No description provided for @retryButton.
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get retryButton;

  /// No description provided for @searchNoResults.
  ///
  /// In en, this message translates to:
  /// **'No results found'**
  String get searchNoResults;

  /// No description provided for @searchTryAnother.
  ///
  /// In en, this message translates to:
  /// **'Try searching for another term'**
  String get searchTryAnother;

  /// No description provided for @searchPassagesHint.
  ///
  /// In en, this message translates to:
  /// **'Search passages...'**
  String get searchPassagesHint;

  /// No description provided for @searchFavoritesHint.
  ///
  /// In en, this message translates to:
  /// **'Search favorites...'**
  String get searchFavoritesHint;

  /// No description provided for @searchDevotionalsHint.
  ///
  /// In en, this message translates to:
  /// **'Search devotionals...'**
  String get searchDevotionalsHint;

  /// No description provided for @filtersInDevelopment.
  ///
  /// In en, this message translates to:
  /// **'Filters in development'**
  String get filtersInDevelopment;

  /// No description provided for @publicDevotionalsAppBar.
  ///
  /// In en, this message translates to:
  /// **'Favorite Devotionals'**
  String get publicDevotionalsAppBar;

  /// No description provided for @publicDevotionalsEmpty.
  ///
  /// In en, this message translates to:
  /// **'No favorites yet'**
  String get publicDevotionalsEmpty;

  /// No description provided for @publicDevotionalsEmptyDescription.
  ///
  /// In en, this message translates to:
  /// **'Tap the heart icon on devotionals to save them here and access them easily later.'**
  String get publicDevotionalsEmptyDescription;

  /// No description provided for @privateDevotionalsAppBar.
  ///
  /// In en, this message translates to:
  /// **'My Devotionals'**
  String get privateDevotionalsAppBar;

  /// No description provided for @privateDevotionalsEmpty.
  ///
  /// In en, this message translates to:
  /// **'No devotionals found'**
  String get privateDevotionalsEmpty;

  /// No description provided for @privateDevotionalsEmptyDescription.
  ///
  /// In en, this message translates to:
  /// **'Generate your first personalized devotional'**
  String get privateDevotionalsEmptyDescription;

  /// No description provided for @streakCurrentTitle.
  ///
  /// In en, this message translates to:
  /// **'Current Streak'**
  String get streakCurrentTitle;

  /// No description provided for @streakDays.
  ///
  /// In en, this message translates to:
  /// **'Days'**
  String get streakDays;

  /// No description provided for @streakMonths.
  ///
  /// In en, this message translates to:
  /// **'Months'**
  String get streakMonths;

  /// No description provided for @streakYears.
  ///
  /// In en, this message translates to:
  /// **'Years'**
  String get streakYears;

  /// No description provided for @streakLongest.
  ///
  /// In en, this message translates to:
  /// **'Longest streak: '**
  String get streakLongest;

  /// No description provided for @streakLongestValue.
  ///
  /// In en, this message translates to:
  /// **'{days} days'**
  String streakLongestValue(int days);

  /// No description provided for @readingTimeMin.
  ///
  /// In en, this message translates to:
  /// **'{minutes} min'**
  String readingTimeMin(int minutes);

  /// No description provided for @swipeToContinue.
  ///
  /// In en, this message translates to:
  /// **'Swipe to continue'**
  String get swipeToContinue;

  /// No description provided for @featureInDevTitle.
  ///
  /// In en, this message translates to:
  /// **'In Development'**
  String get featureInDevTitle;

  /// No description provided for @featureInDevMessage.
  ///
  /// In en, this message translates to:
  /// **'The \"{featureName}\" feature is being developed and will be available soon.'**
  String featureInDevMessage(String featureName);

  /// No description provided for @featureInDevButton.
  ///
  /// In en, this message translates to:
  /// **'Got it'**
  String get featureInDevButton;

  /// No description provided for @metricsHeaderSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Your spiritual progress'**
  String get metricsHeaderSubtitle;

  /// No description provided for @devotionalReflection.
  ///
  /// In en, this message translates to:
  /// **'Reflection'**
  String get devotionalReflection;

  /// No description provided for @devotionalApplication.
  ///
  /// In en, this message translates to:
  /// **'Application'**
  String get devotionalApplication;

  /// No description provided for @devotionalPrayer.
  ///
  /// In en, this message translates to:
  /// **'Prayer'**
  String get devotionalPrayer;

  /// No description provided for @devotionalShare.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get devotionalShare;

  /// No description provided for @passageContext.
  ///
  /// In en, this message translates to:
  /// **'Context'**
  String get passageContext;

  /// No description provided for @passageListen.
  ///
  /// In en, this message translates to:
  /// **'Listen'**
  String get passageListen;

  /// No description provided for @passageShare.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get passageShare;

  /// No description provided for @passageOfTheDay.
  ///
  /// In en, this message translates to:
  /// **'Passage of the Day'**
  String get passageOfTheDay;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @loadingVerseText.
  ///
  /// In en, this message translates to:
  /// **'Loading verse text...'**
  String get loadingVerseText;

  /// No description provided for @dailyQuote.
  ///
  /// In en, this message translates to:
  /// **'Daily quote'**
  String get dailyQuote;

  /// No description provided for @loadingDescription.
  ///
  /// In en, this message translates to:
  /// **'Loading description...'**
  String get loadingDescription;

  /// No description provided for @viewMyMetrics.
  ///
  /// In en, this message translates to:
  /// **'View my metrics'**
  String get viewMyMetrics;

  /// No description provided for @listenFeature.
  ///
  /// In en, this message translates to:
  /// **'Listen'**
  String get listenFeature;

  /// No description provided for @readAction.
  ///
  /// In en, this message translates to:
  /// **'Read'**
  String get readAction;

  /// No description provided for @dailyDevotional.
  ///
  /// In en, this message translates to:
  /// **'Daily devotional'**
  String get dailyDevotional;

  /// No description provided for @viewHistory.
  ///
  /// In en, this message translates to:
  /// **'View History'**
  String get viewHistory;

  /// No description provided for @myDevotionalHeaderDescription.
  ///
  /// In en, this message translates to:
  /// **'Create personalized devotionals and track your spiritual journey.'**
  String get myDevotionalHeaderDescription;

  /// No description provided for @emptyDevotionalTitle.
  ///
  /// In en, this message translates to:
  /// **'No devotionals generated yet'**
  String get emptyDevotionalTitle;

  /// No description provided for @emptyDevotionalDescription.
  ///
  /// In en, this message translates to:
  /// **'Generate your first personalized devotional and it will appear here for you to access whenever you want.'**
  String get emptyDevotionalDescription;

  /// No description provided for @historyTitle.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get historyTitle;

  /// No description provided for @historyDescription.
  ///
  /// In en, this message translates to:
  /// **'Access all the personalized devotionals you\'ve already created. Your last devotional will appear here.'**
  String get historyDescription;

  /// No description provided for @generatingPhase1.
  ///
  /// In en, this message translates to:
  /// **'Analyzing your feelings...'**
  String get generatingPhase1;

  /// No description provided for @generatingPhase2.
  ///
  /// In en, this message translates to:
  /// **'Weaving a reflection made especially for you...'**
  String get generatingPhase2;

  /// No description provided for @generatingPhase3.
  ///
  /// In en, this message translates to:
  /// **'Refining every detail into a unique devotional...'**
  String get generatingPhase3;

  /// No description provided for @generatingTimeEstimate.
  ///
  /// In en, this message translates to:
  /// **'This may take up to 1 minute'**
  String get generatingTimeEstimate;

  /// No description provided for @dailyLimitTitle.
  ///
  /// In en, this message translates to:
  /// **'Daily Limit Reached'**
  String get dailyLimitTitle;

  /// No description provided for @dailyLimitMessage.
  ///
  /// In en, this message translates to:
  /// **'You\'ve already created a personalized devotional today. Come back tomorrow to create a new one!'**
  String get dailyLimitMessage;

  /// No description provided for @dailyLimitButton.
  ///
  /// In en, this message translates to:
  /// **'Got it'**
  String get dailyLimitButton;

  /// No description provided for @logoSemanticLabel.
  ///
  /// In en, this message translates to:
  /// **'Pray Logo'**
  String get logoSemanticLabel;

  /// No description provided for @devotionalGeneratedTitle.
  ///
  /// In en, this message translates to:
  /// **'Devotional Generated!'**
  String get devotionalGeneratedTitle;

  /// No description provided for @devotionalGeneratedMessage.
  ///
  /// In en, this message translates to:
  /// **'Your personalized devotional is ready. You will be redirected to read it.'**
  String get devotionalGeneratedMessage;

  /// No description provided for @comingSoonTitle.
  ///
  /// In en, this message translates to:
  /// **'Coming Soon'**
  String get comingSoonTitle;

  /// No description provided for @comingSoonDescription.
  ///
  /// In en, this message translates to:
  /// **'We are preparing a special space for you to share your faith experiences and connect with other community members.'**
  String get comingSoonDescription;

  /// No description provided for @successTitle.
  ///
  /// In en, this message translates to:
  /// **'Success!'**
  String get successTitle;

  /// No description provided for @continueButton.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueButton;

  /// No description provided for @devotionalLabel.
  ///
  /// In en, this message translates to:
  /// **'Devotional'**
  String get devotionalLabel;

  /// No description provided for @noDevotionalsYet.
  ///
  /// In en, this message translates to:
  /// **'No devotionals yet'**
  String get noDevotionalsYet;

  /// No description provided for @seeMoreDevotionals.
  ///
  /// In en, this message translates to:
  /// **'See More Devotionals'**
  String get seeMoreDevotionals;

  /// No description provided for @tabToday.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get tabToday;

  /// No description provided for @tabMyDevotional.
  ///
  /// In en, this message translates to:
  /// **'My Devotional'**
  String get tabMyDevotional;

  /// No description provided for @tabCommunity.
  ///
  /// In en, this message translates to:
  /// **'Community'**
  String get tabCommunity;

  /// No description provided for @tabSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get tabSettings;

  /// No description provided for @dateFormatterToday.
  ///
  /// In en, this message translates to:
  /// **'TODAY'**
  String get dateFormatterToday;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'pt':
      return AppLocalizationsPt();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
