import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChangeNotifierProviderDemo extends ConsumerWidget {
  const ChangeNotifierProviderDemo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String data = ref.watch(changeNotifierProvider).name;
    changename() => ref.read(changeNotifierProvider.notifier).changeName();
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChangeNotifierProvider Demo'),
      ),
      body: Center(
        child: Text(
          data,
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: changename,
        child: const Icon(Icons.circle),
      ),
    );
  }
}

class ChangeNameNotifier extends ChangeNotifier {
  String name = 'Dev';
  changeName() {
    name = 'Dev x';
    notifyListeners();
  }
}

final changeNotifierProvider =
    ChangeNotifierProvider.autoDispose<ChangeNameNotifier>((ref) {
  return ChangeNameNotifier();
});
