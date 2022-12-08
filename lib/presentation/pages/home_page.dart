import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:streamsprovider/presentation/providers/countdown_privider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HomePageView();
  }
}

class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final coundownProvider = Provider.of<CountdownProvider>(context);

    return Scaffold(
      /// Título de la página
      appBar: AppBar(
        title: const Text('Cuenta regresiva'),
        actions: [
          IconButton(
              onPressed: () {
                coundownProvider.setCountdownDuration(const Duration(seconds: 60));
              },
              icon: const Icon(Icons.restart_alt_outlined))
        ],
      ),

      /// Contador
      body: const _CounterLabel(),

      /// Play - Stop
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          coundownProvider.startStopTimer();
        },
        child: Icon(
            coundownProvider.isRunning
                ? Icons.pause
                : Icons.play_arrow_outlined ),
      ),
    );
  }
}

class _CounterLabel extends StatelessWidget {
  const _CounterLabel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.timer_outlined, color: Colors.blue, size: 60),
          const SizedBox(width: 10),
          Text(
            context.select((CountdownProvider countdown) => countdown.timeLeftString),
            style: const TextStyle(fontSize: 50),
          ),
        ],
      ),
    );
  }
}