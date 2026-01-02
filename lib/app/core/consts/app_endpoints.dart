/// Class containing all API endpoints used in the application
class AppEndpoints {
  /// Base URL for all API requests
  static const String baseUrl =
      'https://pdbwdnvajqxbubjemvus.supabase.co/functions/v1';

  // Auth endpoints
  static const String register = '/register';
  static const String login = '/login';

  // Profile endpoints
  static const String profile = '/profile';
  static const String profileUpdate = '/user-profile-update';
  static const String emailUpdate = '/user-email-update';
  static const String passwordUpdate = '/user-password-update';

  // User endpoints
  static const String user = '/user';
  static const String userRegister = '/user-register';
  static const String userLogin = '/user-login';
  static const String userProfileUpdate = '/user-profile-update';
  static const String userEmailUpdate = '/user-email-update';
  static const String userPasswordUpdate = '/user-password-update';
  static const String userDelete = '/user-delete';
  static const String userMetrics = '/user-metrics';

  // Dashboard endpoints
  static const String dashboard = '/dashboard';

  // Private Devotional endpoints
  static const String privateDevotionals = '/private-devotionals';
  static const String privateDevotional = '/private-devotional';
  static const String privateDevotionalCreate = '/private-devotional-create';
  static const String privateDevotionalLike = '/private-devotional-like';
  static const String privateDevotionalLiked = '/private-devotional-liked';
  static const String privateDevotionalFeedback =
      '/private-devotional-feedback';
  static const String latestPrivateDevotional = '/latest-private-devotional';
  static const String devotionalCompletion = '/devotional-completion';

  // Public Devotional endpoints
  static const String publicDevotionalLike = '/public-devotional-like';
  static const String publicDevotionalLiked = '/public-devotional-liked';
  static const String publicDevotionalFeedback = '/public-devotional-feedback';

  // Legacy Devotional endpoints (to be deprecated)
  static const String generateDevotional = '/generate-devotional';
  static const String listUserDevotionals = '/list-user-devotionals';

  // Like endpoints
  static const String likeDevotional = '/devotional-like';
  static const String likeUserDevotional = '/user-devotional-like';
  static const String likePassage = '/passage-like';

  // Passage endpoints
  static const String passageLike = '/passage-like';
  static const String passageLiked = '/passage-liked';
}
