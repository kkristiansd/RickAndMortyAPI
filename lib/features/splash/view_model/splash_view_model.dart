// lib/features/splash/view_model/splash_view_model.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SplashViewModel extends StateNotifier<AsyncValue<String>> {
  SplashViewModel() : super(const AsyncLoading()) {
    _initialize();
  }

  Future<void> _initialize() async {
    try {
      await Future.delayed(const Duration(seconds: 4));
      final info = await PackageInfo.fromPlatform();
      state = AsyncData(info.version);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
