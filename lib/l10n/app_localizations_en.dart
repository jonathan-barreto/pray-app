// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get loginTitle => 'Access Pray!';

  @override
  String get loginSubtitle =>
      'Sign in to experience moments of faith and inspiration every day.';

  @override
  String get loginButton => 'Sign In';

  @override
  String get loginForgotPassword => 'I forgot my password';

  @override
  String get loginNoAccount => 'Don\'t have an account? ';

  @override
  String get loginSignUp => 'Create one now';

  @override
  String get registerTitle => 'Create your account';

  @override
  String get registerSubtitle =>
      'Join us and start your journey of faith and inspiration.';

  @override
  String get registerButton => 'Sign Up';

  @override
  String get registerHaveAccount => 'Already have an account? ';

  @override
  String get registerSignIn => 'Sign in now';

  @override
  String get forgotPasswordAppBar => 'Recover Password';

  @override
  String get forgotPasswordTitle => 'Forgot your password?';

  @override
  String get forgotPasswordSubtitle =>
      'Enter your email and we\'ll send a verification code to reset your password.';

  @override
  String get forgotPasswordButton => 'Send Code';

  @override
  String get verifyCodeAppBar => 'Verify Code';

  @override
  String get verifyCodeTitle => 'Enter the code';

  @override
  String verifyCodeSubtitle(String email) {
    return 'We sent a 6-digit code to $email';
  }

  @override
  String get verifyCodeLabel => 'Verification Code';

  @override
  String get verifyCodeHint => '123456';

  @override
  String get verifyCodeEmpty => 'Enter the code';

  @override
  String get verifyCodeInvalid => 'The code must be 6 digits';

  @override
  String get verifyCodeButton => 'Verify Code';

  @override
  String get resetPasswordAppBar => 'New Password';

  @override
  String get resetPasswordTitle => 'Create new password';

  @override
  String get resetPasswordSubtitle =>
      'Enter your new password. Make sure it is secure and easy to remember.';

  @override
  String get resetPasswordNewLabel => 'New Password';

  @override
  String get resetPasswordConfirmLabel => 'Confirm Password';

  @override
  String get resetPasswordConfirmEmpty => 'Confirm your password';

  @override
  String get resetPasswordMismatch => 'Passwords do not match';

  @override
  String get resetPasswordButton => 'Reset Password';

  @override
  String get emailLabel => 'Email';

  @override
  String get passwordLabel => 'Password';

  @override
  String get nameLabel => 'Name';

  @override
  String get todaySubtitle =>
      'Keep your flame alive, every day is a new opportunity to connect with God.';

  @override
  String greetingMorning(String name) {
    return 'Good morning, $name!';
  }

  @override
  String greetingAfternoon(String name) {
    return 'Good afternoon, $name!';
  }

  @override
  String greetingEvening(String name) {
    return 'Good evening, $name!';
  }

  @override
  String get personalizedDevotionalTitle => 'Personalized Devotional';

  @override
  String get personalizedDevotionalSubtitle => 'How are you feeling today?';

  @override
  String get personalizedDevotionalHint => 'Ex: I\'m anxious about work...';

  @override
  String get personalizedDevotionalButton => 'Generate Devotional';

  @override
  String get myFavoritesTitle => 'My Favorites';

  @override
  String get myFavoritesDescription =>
      'Personalized devotionals you marked as favorites';

  @override
  String get myFavoritesViewMore => 'View More Devotionals';

  @override
  String get myFavoritesEmpty => 'No favorites yet';

  @override
  String get settingsAccountSection => 'Account';

  @override
  String get settingsProfile => 'Profile';

  @override
  String get settingsProfileSubtitle => 'Edit personal information';

  @override
  String get settingsEmail => 'Email';

  @override
  String get settingsEmailSubtitle => 'Edit email';

  @override
  String get settingsPassword => 'Password';

  @override
  String get settingsPasswordSubtitle => 'Edit password';

  @override
  String get settingsFavoritesSection => 'Favorites';

  @override
  String get settingsDailyDevotionals => 'Favorite Daily Devotionals';

  @override
  String get settingsDailyDevotionalsSubtitle =>
      'View and manage favorite daily devotionals';

  @override
  String get settingsDailyPassages => 'Favorite Daily Passages';

  @override
  String get settingsDailyPassagesSubtitle =>
      'View and manage favorite daily passages';

  @override
  String get settingsSupportSection => 'Support';

  @override
  String get settingsHelp => 'Help';

  @override
  String get settingsHelpSubtitle => 'Help center and FAQ';

  @override
  String get settingsAbout => 'About';

  @override
  String get settingsAboutSubtitle => 'App version and information';

  @override
  String get settingsPrivacy => 'Privacy';

  @override
  String get settingsPrivacySubtitle => 'Privacy policy';

  @override
  String get settingsTerms => 'Terms of Use';

  @override
  String get settingsTermsSubtitle => 'Terms and conditions';

  @override
  String get settingsSessionSection => 'Session';

  @override
  String get settingsLogout => 'Sign Out';

  @override
  String get settingsLogoutSubtitle => 'Disconnect from account';

  @override
  String settingsLogoutError(String error) {
    return 'Error signing out: $error';
  }

  @override
  String get logoutDialogTitle => 'Sign out';

  @override
  String get logoutDialogMessage => 'Are you sure you want to sign out?';

  @override
  String get logoutDialogCancel => 'Cancel';

  @override
  String get logoutDialogConfirm => 'Sign Out';

  @override
  String get profileCardRanking => 'Ranking';

  @override
  String get profileCardStreak => 'Streak';

  @override
  String get profileCardCompleted => 'Completed';

  @override
  String get profileCardViewMetrics => 'View my metrics';

  @override
  String get metricsAppBar => 'My Metrics';

  @override
  String get metricsProgress => 'Progress';

  @override
  String get metricsDevotionalsCompleted => 'Devotionals Completed';

  @override
  String get metricsDevotionalsCompletedSubtitle =>
      'Total devotionals completed';

  @override
  String get metricsPassagesCompleted => 'Passages Completed';

  @override
  String get metricsPassagesCompletedSubtitle => 'Total passages completed';

  @override
  String get metricsRanking => 'Ranking';

  @override
  String get metricsRankingSubtitle => 'Your position in the global ranking';

  @override
  String get helpAppBar => 'Help';

  @override
  String get helpFaqTitle => 'Frequently Asked Questions (FAQ)';

  @override
  String get helpQ1 => 'What is Pray?';

  @override
  String get helpA1 =>
      'Pray is a Christian devotional app that uses technology to help you reflect on the Bible and pray based on what you\'re feeling at the moment. It does not replace Bible reading, personal prayer, or pastoral care, but serves as daily spiritual support.';

  @override
  String get helpQ2 => 'How do personalized devotionals work?';

  @override
  String get helpA2 =>
      'By telling us how you\'re feeling, Pray generates a devotional based on Scripture, with a reflection and prayer that help contextualize God\'s Word to your current experience. The content is always grounded in the Bible and presented as a possible reading, not as absolute revelation.';

  @override
  String get helpQ3 => 'Does Pray \"speak for God\"?';

  @override
  String get helpA3 =>
      'No. Pray does not offer prophecies, revelations, or direct messages from God. The app acts as a facilitator of biblical reflection, encouraging you to pray, think, and seek God personally.';

  @override
  String get helpQ4 => 'Are my private devotionals really private?';

  @override
  String get helpA4 =>
      'Yes. Private devotionals are visible only to you. They are not published, shared, or displayed to other users.';

  @override
  String get helpQ5 =>
      'What\'s the difference between public and private devotionals?';

  @override
  String get helpA5 =>
      'Public devotionals: daily content generated for the entire app community.\n\nPrivate devotionals: personalized content generated exclusively from the feeling you share.';

  @override
  String get helpQ6 => 'What are streaks, metrics, and achievements?';

  @override
  String get helpA6 =>
      'These are optional features that help you track your consistency and engagement with the app. They do not measure spirituality, faith, or Christian maturity — they only record usage and habits.';

  @override
  String get helpQ7 => 'Can I delete my account?';

  @override
  String get helpA7 =>
      'Yes. You can request to delete your account at any time. When you do, your personal data and private devotionals will be removed as described in the privacy policy.';

  @override
  String get helpQ8 =>
      'Does Pray replace pastoral or psychological counseling?';

  @override
  String get helpA8 =>
      'No. Pray does not replace spiritual leaders, pastoral counseling, therapy, or professional care. In situations of intense suffering, persistent anxiety, or emotional crisis, it is important to seek qualified help.';

  @override
  String get aboutAppBar => 'About';

  @override
  String get aboutVersion => 'Version 1.0.0';

  @override
  String get aboutTitle => 'About Pray';

  @override
  String get aboutDescription =>
      'Pray was born from the desire to create a simple, respectful, and profound space for those who want to draw closer to God amid the real emotions of life.\n\nWe believe that the Christian faith does not ignore feelings like anxiety, doubt, or weariness, but brings them honestly before God. That\'s why Pray uses technology as a tool to point to Scripture, encourage prayer, and foster moments of listening and reflection.\n\nPray does not offer ready-made answers, easy promises, or magic solutions. It invites you to pause, read the Bible, and pray personally, recognizing that each spiritual journey is unique.\n\nOur commitment is to unite theological care, responsible language, and human experience, respecting both the faith and the conscience of each user.';

  @override
  String get aboutDevelopedWith => 'Developed with';

  @override
  String get aboutCopyright => '© 2025 Pray. All rights reserved.';

  @override
  String get aboutLastUpdate => 'Last update';

  @override
  String get aboutLastUpdateValue => 'December 2025';

  @override
  String get languageAppBar => 'Language';

  @override
  String get languageDescription =>
      'Select the app language. Changes will be applied immediately.';

  @override
  String get notificationsAppBar => 'Notifications';

  @override
  String get notificationsDescription =>
      'Customize your notifications so you don\'t miss any important content.';

  @override
  String get notificationsPushSection => 'Push Notifications';

  @override
  String get notificationsDailyDevotional => 'Daily Devotional';

  @override
  String get notificationsDailyDevotionalSubtitle =>
      'Receive reminders for the daily devotional';

  @override
  String get notificationsNewContent => 'New Content';

  @override
  String get notificationsNewContentSubtitle =>
      'Notifications about new devotionals';

  @override
  String get notificationsAchievements => 'Achievements';

  @override
  String get notificationsAchievementsSubtitle =>
      'Receive achievement notifications';

  @override
  String get notificationsReminders => 'Reminders';

  @override
  String get notificationsRemindersSubtitle => 'Personalized reminders';

  @override
  String get notificationsEmailSection => 'Email';

  @override
  String get notificationsEmailToggle => 'Email Notifications';

  @override
  String get notificationsEmailToggleSubtitle => 'Receive updates by email';

  @override
  String devotionalCongrats(String name) {
    return 'Congratulations, $name!';
  }

  @override
  String get devotionalCompleteMessage =>
      'You completed today\'s devotional. May the reflections and teachings stay with you throughout the day.';

  @override
  String get devotionalRateQuestion => 'How do you rate this devotional?';

  @override
  String get devotionalFeedbackHint =>
      'Leave a comment about this devotional (optional)';

  @override
  String get devotionalSubmitting => 'Submitting...';

  @override
  String get devotionalSubmitButton => 'Rate';

  @override
  String get devotionalBackHome => 'Back to home';

  @override
  String get errorLikePassage => 'Error liking passage';

  @override
  String get errorLikeDevotional => 'Error liking devotional';

  @override
  String get errorServerError =>
      'A server error occurred. Please try again later.';

  @override
  String get errorNoConnection =>
      'No internet connection. Check your connection and try again.';

  @override
  String get errorNotAuthenticated =>
      'Could not authenticate. Please log in again.';

  @override
  String get errorInvalidRequest =>
      'Invalid request. Check the data and try again.';

  @override
  String get errorParsingError => 'Error processing data. Please try again.';

  @override
  String get errorGeneric => 'An error occurred. Please try again later.';

  @override
  String get welcomeHeadline => 'Welcome\nto Pray!';

  @override
  String get welcomeDescription =>
      'Discover devotionals created especially for you. Reflect, pray, and strengthen your walk with God every day.';

  @override
  String get welcomeButton => 'Get Started';

  @override
  String get privacyAppBar => 'Privacy';

  @override
  String get privacyBanner => 'Your privacy is taken seriously.';

  @override
  String get privacyDataTitle => 'What data do we collect?';

  @override
  String get privacyDataContent =>
      'Pray only collects the data necessary for the app to function, such as:\n\n• Name and email\n• Authentication information\n• Feelings shared for devotional generation\n• In-app interactions (likes, completions, feedback)';

  @override
  String get privacyUsageTitle => 'How is your data used?';

  @override
  String get privacyUsageContent =>
      'Your data is used exclusively to:\n\n• Authenticate your account\n• Personalize your app experience\n• Generate private devotionals\n• Improve content and service quality\n\nWe never use your data for external commercial purposes or sell it to third parties.';

  @override
  String get privacySharedTitle => 'Are private devotionals shared?';

  @override
  String get privacySharedContent =>
      'No. Private devotionals and shared feelings are not shared with other users. They are treated as personal content.';

  @override
  String get privacyAiTitle => 'Use of artificial intelligence';

  @override
  String get privacyAiContent =>
      'Pray uses artificial intelligence to generate devotional content from defined parameters. This content does not represent divine revelations nor replace faith, the Bible, or personal prayer.';

  @override
  String get privacyDeleteTitle => 'Can I delete my data?';

  @override
  String get privacyDeleteContent =>
      'Yes. You can request account deletion at any time. After deletion, your personal data and private content will be permanently removed, subject to applicable legal obligations.';

  @override
  String get privacySecurityTitle => 'Security';

  @override
  String get privacySecurityContent =>
      'We adopt technical and organizational measures to protect your data against unauthorized access, loss, or misuse.';

  @override
  String get privacyLastUpdate => 'Last update: December 2025';

  @override
  String get termsAppBar => 'Terms of Use';

  @override
  String get termsBanner => 'Terms and Conditions of Use';

  @override
  String get termsIntro =>
      'By using the Pray app, you agree to the terms and conditions described below. If you disagree with any point, we recommend that you do not use the app.';

  @override
  String get termsSection1Title => '1. About Pray';

  @override
  String get termsSection1Content =>
      'Pray is an app that uses technology, including artificial intelligence, to assist users in biblical reflection and the practice of Christian prayer.\n\nPray does not offer pastoral, psychological, medical, or individualized spiritual counseling, nor does it replace Bible reading, personal prayer, pastoral care, or professional guidance.\n\nThe content provided is reflective and devotional in nature, and is not presented as divine revelation, prophecy, or absolute guidance.';

  @override
  String get termsSection2Title => '2. Eligibility';

  @override
  String get termsSection2Content =>
      'By using Pray, you declare that:\n\n• You have the legal capacity to accept these Terms\n• The information provided during registration is true and up-to-date\n• You will use the app ethically, respectfully, and in compliance with these Terms';

  @override
  String get termsSection3Title => '3. User Account';

  @override
  String get termsSection3Content =>
      'To access certain features, you need to create an account.\n\nYou are responsible for:\n\n• Maintaining the confidentiality of your credentials\n• All activities carried out on your account\n• Immediately reporting any unauthorized use\n\nPray reserves the right to suspend or terminate accounts in case of misuse or violation of these Terms.';

  @override
  String get termsSection4Title => '4. Use of Artificial Intelligence';

  @override
  String get termsSection4Content =>
      'Pray uses artificial intelligence to generate devotional content based on defined parameters, including feelings shared by the user.\n\nYou acknowledge that:\n\n• The generated content is a possible reading of Scripture, not a definitive interpretation\n• Artificial intelligence does not speak on behalf of God\n• No content should be understood as a specific promise of divine action\n\nThe use of AI aims to assist reflection and prayer, not to replace the user\'s personal spiritual experience.';

  @override
  String get termsSection5Title =>
      '5. Personalized Devotionals and Usage Limits';

  @override
  String get termsSection5Content =>
      'Pray may establish limits on the generation of personalized devotionals, in order to:\n\n• Preserve a healthy usage rhythm\n• Maintain experience quality\n• Ensure the technical sustainability of the service\n\nThese limits may be adjusted at any time, with communication within the app.';

  @override
  String get termsSection6Title => '6. Private and Public Content';

  @override
  String get termsSection6Content =>
      'Private devotionals are generated exclusively for the user and are not shared publicly.\n\nPublic devotionals are made available to the entire app community.\n\nThe user is responsible for the emotional or textual content they provide when using the app.';

  @override
  String get termsSection7Title => '7. Proper Use of the App';

  @override
  String get termsSection7Content =>
      'The user is prohibited from:\n\n• Using Pray for illegal or abusive purposes\n• Attempting to exploit technical or security flaws\n• Using the app\'s content as a substitute for professional counseling in serious situations\n\nIn cases of intense suffering, persistent anxiety, or emotional crises, it is recommended to seek specialized help.';

  @override
  String get termsSection8Title => '8. Intellectual Property';

  @override
  String get termsSection8Content =>
      'All content available on Pray, including texts, design, structure, and features, is protected by copyright.\n\nReproduction, distribution, or modification of content without prior authorization is prohibited, except within the limits permitted by law.';

  @override
  String get termsSection9Title => '9. Account Deletion';

  @override
  String get termsSection9Content =>
      'The user may request account deletion at any time.\n\nAfter deletion:\n\n• Personal data and private content will be removed, subject to applicable legal obligations\n• Access to the app will be permanently terminated';

  @override
  String get termsSection10Title => '10. Limitation of Liability';

  @override
  String get termsSection10Content =>
      'Pray is not responsible for:\n\n• Personal decisions made based on app content\n• Individual interpretations of generated content\n• Possible temporary technical unavailability\n\nUse of the app is the sole responsibility of the user.';

  @override
  String get termsSection11Title => '11. Changes to Terms';

  @override
  String get termsSection11Content =>
      'Pray may update these Terms of Use periodically.\n\nContinued use of the app after changes implies agreement with the new terms.';

  @override
  String get termsSection12Title => '12. Contact';

  @override
  String get termsSection12Content =>
      'For questions, suggestions, or requests related to these Terms, the user may contact us through the official channels available in the app.';

  @override
  String get termsLastUpdate => 'Last update: December 2025';

  @override
  String get appearanceAppBar => 'Appearance';

  @override
  String get appearanceTheme => 'Theme';

  @override
  String get appearanceLight => 'Light';

  @override
  String get appearanceDark => 'Dark';

  @override
  String get appearanceSystem => 'System';

  @override
  String get appearanceFontSize => 'Font Size';

  @override
  String get appearanceSmall => 'Small';

  @override
  String get appearanceLarge => 'Large';

  @override
  String get profileAppBar => 'Profile';

  @override
  String get profilePersonalInfo => 'Personal Information';

  @override
  String get profileNameHint => 'Full name';

  @override
  String get profileNameEmpty => 'Please enter your name';

  @override
  String get profileSaveButton => 'Save Changes';

  @override
  String get profileUpdateSuccess => 'Profile updated successfully!';

  @override
  String get emailUpdateAppBar => 'Update Email';

  @override
  String get emailUpdateTitle => 'Update Email';

  @override
  String get emailUpdateSubtitle =>
      'Enter your new email address and your current password for verification.';

  @override
  String get emailUpdateNewHint => 'New email';

  @override
  String get emailUpdateEmpty => 'Please enter your email';

  @override
  String get emailUpdateInvalid => 'Please enter a valid email';

  @override
  String get emailUpdateCurrentPassword => 'Current password';

  @override
  String get emailUpdatePasswordEmpty => 'Please enter your password';

  @override
  String get emailUpdateButton => 'Update Email';

  @override
  String get emailUpdateSuccess =>
      'Email updated successfully. Please verify your new email.';

  @override
  String get passwordUpdateAppBar => 'Update Password';

  @override
  String get passwordUpdateTitle => 'Update Password';

  @override
  String get passwordUpdateSubtitle =>
      'Enter your current password and the new password you want to use.';

  @override
  String get passwordUpdateCurrentLabel => 'Current password';

  @override
  String get passwordUpdateCurrentEmpty => 'Please enter your current password';

  @override
  String get passwordUpdateNewLabel => 'New password';

  @override
  String get passwordUpdateNewEmpty => 'Please enter your new password';

  @override
  String get passwordUpdateMinLength =>
      'Password must be at least 6 characters';

  @override
  String get passwordUpdateConfirmLabel => 'Confirm new password';

  @override
  String get passwordUpdateConfirmEmpty => 'Please confirm your new password';

  @override
  String get passwordUpdateMismatch => 'Passwords do not match';

  @override
  String get passwordUpdateButton => 'Update Password';

  @override
  String get passwordUpdateSuccess => 'Password updated successfully.';

  @override
  String get devotionalAppBar => 'Devotional';

  @override
  String get devotionalFeedbackSuccess =>
      'Rating submitted! Thank you for your feedback.';

  @override
  String get passageAppBar => 'Bible Passage';

  @override
  String get sharePassageFeature => 'Share passage';

  @override
  String get listenPassageFeature => 'Listen to passage';

  @override
  String get favoritePassagesAppBar => 'Favorite Passages';

  @override
  String get favoritePassagesEmpty => 'No favorite passages';

  @override
  String get favoritePassagesEmptyDescription =>
      'You haven\'t favorited any Bible passages yet. Explore and favorite your preferred passages!';

  @override
  String get retryButton => 'Try Again';

  @override
  String get searchNoResults => 'No results found';

  @override
  String get searchTryAnother => 'Try searching for another term';

  @override
  String get searchPassagesHint => 'Search passages...';

  @override
  String get searchFavoritesHint => 'Search favorites...';

  @override
  String get searchDevotionalsHint => 'Search devotionals...';

  @override
  String get filtersInDevelopment => 'Filters in development';

  @override
  String get publicDevotionalsAppBar => 'Favorite Devotionals';

  @override
  String get publicDevotionalsEmpty => 'No favorites yet';

  @override
  String get publicDevotionalsEmptyDescription =>
      'Tap the heart icon on devotionals to save them here and access them easily later.';

  @override
  String get privateDevotionalsAppBar => 'My Devotionals';

  @override
  String get privateDevotionalsEmpty => 'No devotionals found';

  @override
  String get privateDevotionalsEmptyDescription =>
      'Generate your first personalized devotional';

  @override
  String get streakCurrentTitle => 'Current Streak';

  @override
  String get streakDays => 'Days';

  @override
  String get streakMonths => 'Months';

  @override
  String get streakYears => 'Years';

  @override
  String get streakLongest => 'Longest streak: ';

  @override
  String streakLongestValue(int days) {
    return '$days days';
  }

  @override
  String readingTimeMin(int minutes) {
    return '$minutes min';
  }

  @override
  String get swipeToContinue => 'Swipe to continue';

  @override
  String get featureInDevTitle => 'In Development';

  @override
  String featureInDevMessage(String featureName) {
    return 'The \"$featureName\" feature is being developed and will be available soon.';
  }

  @override
  String get featureInDevButton => 'Got it';

  @override
  String get metricsHeaderSubtitle => 'Your spiritual progress';

  @override
  String get devotionalReflection => 'Reflection';

  @override
  String get devotionalApplication => 'Application';

  @override
  String get devotionalPrayer => 'Prayer';

  @override
  String get devotionalShare => 'Share';

  @override
  String get passageContext => 'Context';

  @override
  String get passageListen => 'Listen';

  @override
  String get passageShare => 'Share';

  @override
  String get passageOfTheDay => 'Passage of the Day';

  @override
  String get loading => 'Loading...';

  @override
  String get loadingVerseText => 'Loading verse text...';

  @override
  String get dailyQuote => 'Daily quote';

  @override
  String get loadingDescription => 'Loading description...';

  @override
  String get viewMyMetrics => 'View my metrics';

  @override
  String get listenFeature => 'Listen';

  @override
  String get readAction => 'Read';

  @override
  String get dailyDevotional => 'Daily devotional';

  @override
  String get viewHistory => 'View History';

  @override
  String get myDevotionalHeaderDescription =>
      'Create personalized devotionals and track your spiritual journey.';

  @override
  String get emptyDevotionalTitle => 'No devotionals generated yet';

  @override
  String get emptyDevotionalDescription =>
      'Generate your first personalized devotional and it will appear here for you to access whenever you want.';

  @override
  String get historyTitle => 'History';

  @override
  String get historyDescription =>
      'Access all the personalized devotionals you\'ve already created. Your last devotional will appear here.';

  @override
  String get generatingPhase1 => 'Analyzing your feelings...';

  @override
  String get generatingPhase2 =>
      'Weaving a reflection made especially for you...';

  @override
  String get generatingPhase3 =>
      'Refining every detail into a unique devotional...';

  @override
  String get generatingTimeEstimate => 'This may take up to 1 minute';

  @override
  String get dailyLimitTitle => 'Daily Limit Reached';

  @override
  String get dailyLimitMessage =>
      'You\'ve already created a personalized devotional today. Come back tomorrow to create a new one!';

  @override
  String get dailyLimitButton => 'Got it';

  @override
  String get logoSemanticLabel => 'Pray Logo';

  @override
  String get devotionalGeneratedTitle => 'Devotional Generated!';

  @override
  String get devotionalGeneratedMessage =>
      'Your personalized devotional is ready. You will be redirected to read it.';

  @override
  String get comingSoonTitle => 'Coming Soon';

  @override
  String get comingSoonDescription =>
      'We are preparing a special space for you to share your faith experiences and connect with other community members.';

  @override
  String get successTitle => 'Success!';

  @override
  String get continueButton => 'Continue';

  @override
  String get devotionalLabel => 'Devotional';

  @override
  String get noDevotionalsYet => 'No devotionals yet';

  @override
  String get seeMoreDevotionals => 'See More Devotionals';

  @override
  String get tabToday => 'Today';

  @override
  String get tabMyDevotional => 'My Devotional';

  @override
  String get tabCommunity => 'Community';

  @override
  String get tabSettings => 'Settings';

  @override
  String get dateFormatterToday => 'TODAY';
}
