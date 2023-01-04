import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StateNotifierProviderDemo extends ConsumerWidget {
  const StateNotifierProviderDemo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    increment() => ref.read(stateNotifierProvider.notifier).increment();
    final time = ref.watch(stateNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('StateNotifierProvider Demo'),
      ),
      body: Center(child: Text('You Pressed the btn $time times')),
      floatingActionButton: FloatingActionButton(
          onPressed: increment, child: const Icon(Icons.add)),
    );
  }
}

class CounterNotifier extends StateNotifier<int> {
  CounterNotifier() : super(0);

  increment() => state++;
}

final stateNotifierProvider = StateNotifierProvider<CounterNotifier, int>(
  (ref) => CounterNotifier(),
);
