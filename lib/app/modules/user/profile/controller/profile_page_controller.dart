import 'package:flutter/material.dart';
import 'package:pray_app/app/app_controller.dart';
import 'package:pray_app/app/domain/params/profile_update_params.dart';
import 'package:pray_app/app/domain/usecases/update_profile_usecase.dart';

class ProfilePageController extends ChangeNotifier {
  final UpdateProfileUsecase _updateProfileUsecase;

  ProfilePageController({required UpdateProfileUsecase updateProfileUsecase})
    : _updateProfileUsecase = updateProfileUsecase;

  final formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController(
    text: AppController.instance.userProfile?.name ?? '',
  );

  bool isLoading = false;
  String? errorMessage;

  Future<bool> updateProfile() async {
    if (!(formKey.currentState?.validate() ?? false)) {
      return false;
    }

    _setLoading(true);
    _setError(null);

    final ProfileUpdateParams params = ProfileUpdateParams(
      name: nameController.text.trim(),
    );

    final result = await _updateProfileUsecase(params);

    bool success = false;
    result.get((failure) => _setError(failure.message), (profileResponse) {
      AppController.instance.setUserProfile(profileResponse.data);
      success = true;
    });

    _setLoading(false);
    return success;
  }

  void _setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  void _setError(String? value) {
    errorMessage = value;
    notifyListeners();
  }

  void clearError() {
    _setError(null);
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }
}
