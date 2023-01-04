import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ranumProvider = Provider<int>((ref) {
  return Random().nextInt(100);
});

class ProviderDemo extends StatelessWidget {
  const ProviderDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Demo'),
      ),
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            final ranum = ref.read(ranumProvider);

            return Text("Random Int is : $ranum");
          },
        ),
      ),
    );
  }
}
