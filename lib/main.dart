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
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FetchingDemo(),
                ));
          },
          child: const Text("Click Here to See the Example"),
        ),
      ),
    );
  }
}
