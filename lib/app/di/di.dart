import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:pray_app/app/core/consts/app_endpoints.dart';
import 'package:pray_app/app/core/http_client/http_client.dart';
import 'package:pray_app/app/core/http_client/http_client_impl.dart';
import 'package:pray_app/app/core/secure_storage/secure_storage.dart';
import 'package:pray_app/app/core/secure_storage/secure_storage_impl.dart';
import 'package:pray_app/app/data/datasources/dashboard_datasource.dart';
import 'package:pray_app/app/data/datasources/devotional_datasource.dart';
import 'package:pray_app/app/data/datasources/passage_datasource.dart';
import 'package:pray_app/app/data/datasources/token_datasource.dart';
import 'package:pray_app/app/data/datasources/user_datasource.dart';
import 'package:pray_app/app/data/repositories/dashboard_repository_impl.dart';
import 'package:pray_app/app/data/repositories/devotional_repository_impl.dart';
import 'package:pray_app/app/data/repositories/passage_repository_impl.dart';
import 'package:pray_app/app/data/repositories/token_repository_impl.dart';
import 'package:pray_app/app/data/repositories/user_repository_impl.dart';
import 'package:pray_app/app/domain/repositories/dashboard_repository.dart';
import 'package:pray_app/app/domain/repositories/devotional_repository.dart';
import 'package:pray_app/app/domain/repositories/passage_repository.dart';
import 'package:pray_app/app/domain/repositories/token_repository.dart';
import 'package:pray_app/app/domain/repositories/user_repository.dart';
import 'package:pray_app/app/domain/usecases/complete_devotional_usecase.dart';
import 'package:pray_app/app/domain/usecases/delete_token_usecase.dart';
import 'package:pray_app/app/domain/usecases/delete_user_usecase.dart';
import 'package:pray_app/app/domain/usecases/generate_devotional_usecase.dart';
import 'package:pray_app/app/domain/usecases/get_dashboard_usecase.dart';
import 'package:pray_app/app/domain/usecases/get_latest_private_devotional_usecase.dart';
import 'package:pray_app/app/domain/usecases/get_liked_passages_usecase.dart';
import 'package:pray_app/app/domain/usecases/get_liked_private_devotionals_usecase.dart';
import 'package:pray_app/app/domain/usecases/get_liked_public_devotionals_usecase.dart';
import 'package:pray_app/app/domain/usecases/get_private_devotional_by_id_usecase.dart';
import 'package:pray_app/app/domain/usecases/get_private_devotionals_usecase.dart';
import 'package:pray_app/app/domain/usecases/get_token_usecase.dart';
import 'package:pray_app/app/domain/usecases/get_user_devotionals_usecase.dart';
import 'package:pray_app/app/domain/usecases/get_user_metrics_usecase.dart';
import 'package:pray_app/app/domain/usecases/get_user_usecase.dart';
import 'package:pray_app/app/domain/usecases/like_passage_usecase.dart';
import 'package:pray_app/app/domain/usecases/like_private_devotional_usecase.dart';
import 'package:pray_app/app/domain/usecases/like_public_devotional_usecase.dart';
import 'package:pray_app/app/domain/usecases/login_usecase.dart';
import 'package:pray_app/app/domain/usecases/register_usecase.dart';
import 'package:pray_app/app/domain/usecases/save_token_usecase.dart';
import 'package:pray_app/app/domain/usecases/submit_private_devotional_feedback_usecase.dart';
import 'package:pray_app/app/domain/usecases/submit_public_devotional_feedback_usecase.dart';
import 'package:pray_app/app/domain/usecases/update_email_usecase.dart';
import 'package:pray_app/app/domain/usecases/update_password_usecase.dart';
import 'package:pray_app/app/domain/usecases/update_profile_usecase.dart';
import 'package:pray_app/app/modules/auth/login/controller/login_page_controller.dart';
import 'package:pray_app/app/modules/auth/splash/controller/splash_controller.dart';
import 'package:pray_app/app/modules/devotional/controller/devotional_page_controller.dart';
import 'package:pray_app/app/modules/favorite_passages/controller/favorite_passages_page_controller.dart';
import 'package:pray_app/app/modules/main/home/controller/home_page_controller.dart';
import 'package:pray_app/app/modules/main/my_devotional/controller/my_devotional_page_controller.dart';
import 'package:pray_app/app/modules/main/settings/controller/settings_page_controller.dart';
import 'package:pray_app/app/modules/main/today/controller/today_page_controller.dart';
import 'package:pray_app/app/modules/passage/controller/passage_page_controller.dart';
import 'package:pray_app/app/modules/private_devotionals/controller/private_devotionals_page_controller.dart';
import 'package:pray_app/app/modules/public_devotionals/controller/public_devotionals_page_controller.dart';
import 'package:pray_app/app/modules/user/email-update/controller/email_update_controller.dart';
import 'package:pray_app/app/modules/user/password-update/controller/password_update_controller.dart';
import 'package:pray_app/app/modules/user/profile/controller/profile_page_controller.dart';

/// GetIt instance for dependency injection
final getIt = GetIt.instance;

/// Initialize all dependencies
Future<void> initDependencies() async {
  // Services
  _registerGlobalServices();

  // Data Sources
  _registerDataSources();

  // Repositories
  _registerRepositories();

  // Use Cases
  _registerUseCases();

  // Controllers
  _registerControllers();
}

void _registerGlobalServices() {
  // Register Dio with base configuration
  getIt.registerLazySingleton<Dio>(() {
    final dio = Dio(
      BaseOptions(
        baseUrl: AppEndpoints.baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 60), // Aumentado para 60s
        sendTimeout: const Duration(seconds: 60), // Timeout para envio
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );
    return dio;
  });

  // Register HTTP client implementation
  getIt.registerLazySingleton<HttpClient>(
    () => HttpClientImpl(dio: getIt<Dio>(), useTokenInterceptor: true),
  );

  // Register secure storage
  getIt.registerLazySingleton<SecureStorage>(
    () => SecureStorageImpl(storage: const FlutterSecureStorage()),
  );
}

void _registerDataSources() {
  // Register data sources here

  getIt.registerFactory<TokenDataSource>(
    () => TokenDataSourceImpl(secureStorage: getIt<SecureStorage>()),
  );

  getIt.registerFactory<DashboardDataSource>(
    () => DashboardDataSourceImpl(httpClient: getIt<HttpClient>()),
  );

  getIt.registerFactory<DevotionalDataSource>(
    () => DevotionalDataSourceImpl(httpClient: getIt<HttpClient>()),
  );

  getIt.registerFactory<UserDataSource>(
    () => UserDataSourceImpl(httpClient: getIt<HttpClient>()),
  );

  getIt.registerFactory<PassageDataSource>(
    () => PassageDataSourceImpl(httpClient: getIt<HttpClient>()),
  );
}

void _registerRepositories() {
  // Register repository implementations here

  getIt.registerFactory<TokenRepository>(
    () => TokenRepositoryImpl(localDataSource: getIt<TokenDataSource>()),
  );

  getIt.registerFactory<DashboardRepository>(
    () =>
        DashboardRepositoryImpl(remoteDataSource: getIt<DashboardDataSource>()),
  );

  getIt.registerFactory<DevotionalRepository>(
    () => DevotionalRepositoryImpl(
      remoteDataSource: getIt<DevotionalDataSource>(),
    ),
  );

  getIt.registerFactory<UserRepository>(
    () => UserRepositoryImpl(remoteDataSource: getIt<UserDataSource>()),
  );

  getIt.registerFactory<PassageRepository>(
    () => PassageRepositoryImpl(remoteDataSource: getIt<PassageDataSource>()),
  );
}

void _registerUseCases() {
  getIt.registerFactory<SaveTokenUsecase>(
    () => SaveTokenUsecase(repository: getIt<TokenRepository>()),
  );

  getIt.registerFactory<GetTokenUsecase>(
    () => GetTokenUsecase(repository: getIt<TokenRepository>()),
  );

  getIt.registerFactory<DeleteTokenUsecase>(
    () => DeleteTokenUsecase(repository: getIt<TokenRepository>()),
  );

  getIt.registerFactory<GetDashboardUsecase>(
    () => GetDashboardUsecase(repository: getIt<DashboardRepository>()),
  );

  getIt.registerFactory<GenerateDevotionalUsecase>(
    () => GenerateDevotionalUsecase(repository: getIt<DevotionalRepository>()),
  );

  getIt.registerFactory<GetPrivateDevotionalsUsecase>(
    () =>
        GetPrivateDevotionalsUsecase(repository: getIt<DevotionalRepository>()),
  );

  getIt.registerFactory<GetPrivateDevotionalByIdUsecase>(
    () => GetPrivateDevotionalByIdUsecase(
      repository: getIt<DevotionalRepository>(),
    ),
  );

  getIt.registerFactory<GetLatestPrivateDevotionalUsecase>(
    () => GetLatestPrivateDevotionalUsecase(
      repository: getIt<DevotionalRepository>(),
    ),
  );

  getIt.registerFactory<LikePrivateDevotionalUsecase>(
    () =>
        LikePrivateDevotionalUsecase(repository: getIt<DevotionalRepository>()),
  );

  getIt.registerFactory<GetLikedPrivateDevotionalsUsecase>(
    () => GetLikedPrivateDevotionalsUsecase(
      repository: getIt<DevotionalRepository>(),
    ),
  );

  getIt.registerFactory<LikePublicDevotionalUsecase>(
    () =>
        LikePublicDevotionalUsecase(repository: getIt<DevotionalRepository>()),
  );

  getIt.registerFactory<GetLikedPublicDevotionalsUsecase>(
    () => GetLikedPublicDevotionalsUsecase(
      repository: getIt<DevotionalRepository>(),
    ),
  );

  // Legacy use case (to be deprecated)
  getIt.registerFactory<GetUserDevotionalsUsecase>(
    () => GetUserDevotionalsUsecase(repository: getIt<DevotionalRepository>()),
  );

  getIt.registerFactory<GetUserUsecase>(
    () => GetUserUsecase(repository: getIt<UserRepository>()),
  );

  getIt.registerFactory<GetUserMetricsUsecase>(
    () => GetUserMetricsUsecase(repository: getIt<UserRepository>()),
  );

  getIt.registerFactory<RegisterUsecase>(
    () => RegisterUsecase(repository: getIt<UserRepository>()),
  );

  getIt.registerFactory<LoginUsecase>(
    () => LoginUsecase(repository: getIt<UserRepository>()),
  );

  getIt.registerFactory<UpdateProfileUsecase>(
    () => UpdateProfileUsecase(repository: getIt<UserRepository>()),
  );

  getIt.registerFactory<UpdateEmailUsecase>(
    () => UpdateEmailUsecase(repository: getIt<UserRepository>()),
  );

  getIt.registerFactory<UpdatePasswordUsecase>(
    () => UpdatePasswordUsecase(repository: getIt<UserRepository>()),
  );

  getIt.registerFactory<DeleteUserUsecase>(
    () => DeleteUserUsecase(repository: getIt<UserRepository>()),
  );

  getIt.registerFactory<SubmitPublicDevotionalFeedbackUsecase>(
    () => SubmitPublicDevotionalFeedbackUsecase(
      repository: getIt<DevotionalRepository>(),
    ),
  );

  getIt.registerFactory<SubmitPrivateDevotionalFeedbackUsecase>(
    () => SubmitPrivateDevotionalFeedbackUsecase(
      repository: getIt<DevotionalRepository>(),
    ),
  );

  getIt.registerFactory<CompleteDevotionalUsecase>(
    () => CompleteDevotionalUsecase(repository: getIt<DevotionalRepository>()),
  );

  getIt.registerFactory<GetLikedPassagesUsecase>(
    () => GetLikedPassagesUsecase(repository: getIt<PassageRepository>()),
  );

  getIt.registerFactory<LikePassageUsecase>(
    () => LikePassageUsecase(repository: getIt<PassageRepository>()),
  );
}

void _registerControllers() {
  // Register controller implementations here
  getIt.registerFactory<LoginPageController>(
    () => LoginPageController(
      loginUsecase: getIt<LoginUsecase>(),
      saveTokenUsecase: getIt<SaveTokenUsecase>(),
    ),
  );

  getIt.registerFactory<SplashController>(
    () => SplashController(
      getTokenUsecase: getIt<GetTokenUsecase>(),
      getUserUsecase: getIt<GetUserUsecase>(),
    ),
  );

  getIt.registerFactory<HomePageController>(
    () => HomePageController(getDashboardUsecase: getIt<GetDashboardUsecase>()),
  );

  getIt.registerFactory<TodayPageController>(
    () => TodayPageController(
      getDashboardUsecase: getIt<GetDashboardUsecase>(),
      likePassageUsecase: getIt<LikePassageUsecase>(),
      likePublicDevotionalUsecase: getIt<LikePublicDevotionalUsecase>(),
      getUserMetricsUsecase: getIt<GetUserMetricsUsecase>(),
    ),
  );

  getIt.registerFactory<MyDevotionalPageController>(
    () => MyDevotionalPageController(
      generateDevotionalUsecase: getIt<GenerateDevotionalUsecase>(),
      getPrivateDevotionalByIdUsecase: getIt<GetPrivateDevotionalByIdUsecase>(),
      getLatestPrivateDevotionalUsecase:
          getIt<GetLatestPrivateDevotionalUsecase>(),
    ),
  );

  getIt.registerFactory<DevotionalPageController>(
    () => DevotionalPageController(
      submitPublicFeedbackUsecase:
          getIt<SubmitPublicDevotionalFeedbackUsecase>(),
      submitPrivateFeedbackUsecase:
          getIt<SubmitPrivateDevotionalFeedbackUsecase>(),
      completeDevotionalUsecase: getIt<CompleteDevotionalUsecase>(),
    ),
  );

  getIt.registerFactory<PrivateDevotionalsPageController>(
    () => PrivateDevotionalsPageController(
      getUserDevotionalsUsecase: getIt<GetUserDevotionalsUsecase>(),
    ),
  );

  getIt.registerFactory<PublicDevotionalsPageController>(
    () => PublicDevotionalsPageController(
      getLikedPublicDevotionalsUsecase:
          getIt<GetLikedPublicDevotionalsUsecase>(),
    ),
  );

  getIt.registerFactory<SettingsPageController>(
    () =>
        SettingsPageController(deleteTokenUsecase: getIt<DeleteTokenUsecase>()),
  );

  getIt.registerFactory<ProfilePageController>(
    () => ProfilePageController(
      updateProfileUsecase: getIt<UpdateProfileUsecase>(),
    ),
  );

  getIt.registerFactory<EmailUpdateController>(
    () =>
        EmailUpdateController(updateEmailUsecase: getIt<UpdateEmailUsecase>()),
  );

  getIt.registerFactory<PasswordUpdateController>(
    () => PasswordUpdateController(
      updatePasswordUsecase: getIt<UpdatePasswordUsecase>(),
    ),
  );

  getIt.registerFactory<FavoritePassagesPageController>(
    () => FavoritePassagesPageController(
      getLikedPassagesUsecase: getIt<GetLikedPassagesUsecase>(),
      likePassageUsecase: getIt<LikePassageUsecase>(),
    ),
  );

  getIt.registerFactory<PassagePageController>(
    () =>
        PassagePageController(likePassageUsecase: getIt<LikePassageUsecase>()),
  );
}
