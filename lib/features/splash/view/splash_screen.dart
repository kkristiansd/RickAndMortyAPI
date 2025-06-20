import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../provider/splash_provider.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final splashState = ref.watch(splashViewModelProvider);

    return splashState.when(
      loading: () => _buildSplashBody(context, null),
      error: (e, _) => Center(child: Text('Error: $e')),
      data: (version) {
        // Navigate after delay
        Future.delayed(Duration.zero, () {
          Navigator.pushReplacementNamed(context, '/home');
        });
        return _buildSplashBody(context, version);
      },
    );
  }

  Widget _buildSplashBody(BuildContext context, String? version) {
  return Scaffold(
    backgroundColor: const Color(0xFF1C2331), // dark navy blue
    body: SafeArea(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Rick & Morty',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            ClipOval(
              child: Image.asset(
                'assets/images/splash.jpeg',
                height: 140,
                width: 140,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 30),
            const CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 2.5,
            ),
            const SizedBox(height: 40),
            if (version != null)
              Text(
                'Version $version',
                style: const TextStyle(color: Colors.white60),
              ),
          ],
        ),
      ),
    ),
  );
}

}
