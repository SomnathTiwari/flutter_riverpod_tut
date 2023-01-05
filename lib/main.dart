import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_tut/all_provider_demo/future_provider_demo/future_provider_demo.dart';
import 'package:flutter_riverpod_tut/all_provider_demo/provider_demo/provider_demo.dart';
import 'package:flutter_riverpod_tut/all_provider_demo/state_notifier_provider_demo/state_notifier_provider_demo.dart';
import 'package:flutter_riverpod_tut/all_provider_demo/state_provider_demo/state_provider_demo.dart';
import 'package:flutter_riverpod_tut/all_provider_demo/stream_provider_demo/stream_provider_demo.dart';
import 'package:flutter_riverpod_tut/fetching_data_demo/fetching_data_demo.dart';

import 'all_provider_demo/changenotifier_provider_demo/change_notifier_provider.demo.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RiverPod Tutorial',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("RiverPod Tutorial"),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 2),
        itemCount: proj.length,
        itemBuilder: (BuildContext context, int index) {
          final projs = proj[index];
          return ListTile(
            tileColor: Colors.grey.shade300,
            title: Text(projs.title),
            onTap: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => projs.navigateTo,
                ),
              );
            },
          );
        },
        separatorBuilder: (context, index) => const Divider(height: 2),
      ),
    );
  }
}

List<Proj> proj = [
  Proj('Provider Demo', const ProviderDemo()),
  Proj('StateProvider Demo', const StateProviderDemo()),
  Proj('FutureProvider Demo', const FutureProviderDemo()),
  Proj('StreamProvider Demo', const StreamProviderDemo()),
  Proj('StateNotifierProvider Demo', const StateNotifierProviderDemo()),
  Proj('ChangeNotifierProvider Demo', const ChangeNotifierProviderDemo()),
  Proj('Fething Demo', const FetchingDemo()),
];

class Proj {
  final String title;
  final Widget navigateTo;

  Proj(this.title, this.navigateTo);
}
