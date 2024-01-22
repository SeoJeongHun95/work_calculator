import 'package:flutter/material.dart';

class WorkGraphScreen extends StatelessWidget {
  const WorkGraphScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("급여비교"),
      ),
      body: const SafeArea(
        child: Center(
          child: Text("급여비교화면"),
        ),
      ),
    );
  }
}
