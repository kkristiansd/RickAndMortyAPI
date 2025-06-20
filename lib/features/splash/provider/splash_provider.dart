// lib/features/splash/provider/splash_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../view_model/splash_view_model.dart';

final splashViewModelProvider = StateNotifierProvider<SplashViewModel, AsyncValue<String>>(
  (ref) => SplashViewModel(),
);
