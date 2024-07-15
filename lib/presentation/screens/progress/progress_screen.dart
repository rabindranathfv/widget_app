import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProgressScreen extends StatelessWidget {
  static const String name = 'progress_screen';
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Progress screen')),
      body: const _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Column(
      children: [
        SizedBox(
          height: 30,
        ),
        Text('Circular progress Indicator '),
        SizedBox(
          height: 10,
        ),
        CircularProgressIndicator(
          strokeWidth: 2,
          backgroundColor: Colors.black45,
        ),
        SizedBox(
          height: 20,
        ),
        Text('Progress Circular and Linear Controlled'),
        SizedBox(
          height: 10,
        ),
        _ControlledProgressIndicator()
      ],
    ));
  }
}

class _ControlledProgressIndicator extends StatelessWidget {
  const _ControlledProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Stream.periodic(const Duration(milliseconds: 300), (value) {
          return (value * 2) / 100;
        }).takeWhile((value) => value <= 1.0),
        builder: (context, snapshot) {
          final progressValue = snapshot.data ?? 0.0;

          // TODO: Generate LinearProgressIndicator with value from stream
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                    value: progressValue,
                    strokeWidth: 2,
                    color: Colors.black12),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: LinearProgressIndicator(
                  value: progressValue,
                )),
              ],
            ),
          );
        });
  }
}
