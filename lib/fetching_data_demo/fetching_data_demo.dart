import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_tut/fetching_data_demo/state/fetch_data_demo_state.dart';

class FetchingDemo extends ConsumerWidget {
  const FetchingDemo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FetchingData Demo'),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final UserState data = ref.watch(fetchProvider);
          log('State: $data');
          if (data is InitialState) {
            return const Center(
              child: Text('Click the fab btn to fetch'),
            );
          }
          if (data is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (data is LoadedState) {
            return ListView.builder(
              itemCount: data.usersList.length,
              itemBuilder: (BuildContext context, int index) {
                final u = data.usersList[index];
                return ListTile(
                  title: Text(u.title ?? ''),
                  subtitle: Text(u.body ?? ''),
                  leading: CircleAvatar(
                    child: Text(u.id.toString()),
                  ),
                );
              },
            );
          }
          if (data is ErrorState) {
            final String mesg = data.message;
            return Center(
              child: Text(mesg),
            );
          }

          return const Text('Nothing Found');
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(fetchProvider.notifier).onFetch();
          log('Btn Pressed');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
