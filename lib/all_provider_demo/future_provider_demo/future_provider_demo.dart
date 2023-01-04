import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final futureProvider =
    FutureProvider.autoDispose.family<String, String>((ref, city) async {
  return getTemp(city);
});

Future<String> getTemp(String city) => Future.delayed(
    const Duration(seconds: 5),
    () => '$city temp is ${Random().nextInt(5)}${Random().nextInt(5)} degree');

class FutureProviderDemo extends ConsumerWidget {
  const FutureProviderDemo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FutureProvider Demo'),
      ),
      body: Center(
        child: ref.watch(futureProvider("Los Angeles")).when(
              data: (data) => Text(data),
              error: (e, _) => Text(e.toString()),
              loading: () => const CircularProgressIndicator(),
            ),
      ),
    );
  }
}
