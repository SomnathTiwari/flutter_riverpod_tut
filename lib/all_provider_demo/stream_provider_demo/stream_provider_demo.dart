import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final streamProvider = StreamProvider<String>((ref) async* {
  yield* getTemp();
});
Stream<String> getTemp() => Stream.periodic(
      const Duration(seconds: 5),
      (c) => c.toString(),
    ).take(100);

class StreamProviderDemo extends ConsumerWidget {
  const StreamProviderDemo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StreamProvider Demo'),
      ),
      body: Center(
        child: ref.watch(streamProvider).when(
              data: (data) => Text(
                data,
                style: Theme.of(context)
                    .textTheme
                    .headline1
                    ?.copyWith(color: Colors.black),
              ),
              error: (e, _) => Text(e.toString()),
              loading: () => const CircularProgressIndicator(),
            ),
      ),
    );
  }
}
