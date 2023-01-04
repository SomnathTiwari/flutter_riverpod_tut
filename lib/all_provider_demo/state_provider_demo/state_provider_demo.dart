import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final stateProvider = StateProvider<int>((ref) {
  return 0;
});

class StateProviderDemo extends ConsumerWidget {
  const StateProviderDemo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    onPressed() => ref.read(stateProvider.notifier).state++;
    final times = ref.watch(stateProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('StateProvider Demo'),
      ),
      body: Center(child: Text('You Pressed the button $times times')),
      floatingActionButton: FloatingActionButton(
          onPressed: onPressed, child: const Icon(Icons.add)),
    );
  }
}
