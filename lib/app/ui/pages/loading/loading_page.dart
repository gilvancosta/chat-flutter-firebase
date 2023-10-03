// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('xxx'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // LinearProgressIndicator()
              // RefreshProgressIndicator()
              // CircularProgressIndicator(),
              SizedBox(height: 20),
              Text('Loading...', style: Theme.of(context).textTheme.titleLarge),
            ],
          ),
        ));
  }
}
