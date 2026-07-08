import 'dart:async';
import 'package:flutter/material.dart';
import 'detective_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  final List<String> loadingMessages = [];

  final List<String> loadingSteps = [
    "Connecting to recovered device...",
    "Bypassing device security...",
    "Recovering Messages...",
    "Recovering Photos...",
    "Recovering Emails...",
    "Recovering Notes...",
    "Recovering Social Media...",
    "Analyzing Device...",
    "Device Successfully Unlocked.",
  ];

  int currentStep = 0;

  @override
  void initState() {
    super.initState();
    startLoading();
  }

  void startLoading() {
    Timer.periodic(const Duration(milliseconds: 900), (timer) {
      if (currentStep < loadingSteps.length) {
        setState(() {
          loadingMessages.add(loadingSteps[currentStep]);
          currentStep++;
        });
      } else {
        timer.cancel();

        Future.delayed(const Duration(seconds: 2), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const DetectiveScreen()),
          );
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),

              const Text(
                "RECOVERED DEVICE",
                style: TextStyle(
                  color: Colors.greenAccent,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                "Forensics Recovery Console",
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),

              const Divider(color: Colors.greenAccent, height: 40),

              Expanded(
                child: ListView.builder(
                  itemCount: loadingMessages.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        "✔ ${loadingMessages[index]}",
                        style: const TextStyle(
                          color: Colors.greenAccent,
                          fontSize: 18,
                          fontFamily: "Courier",
                        ),
                      ),
                    );
                  },
                ),
              ),

              const LinearProgressIndicator(
                minHeight: 8,
                color: Colors.greenAccent,
                backgroundColor: Colors.white12,
              ),

              const SizedBox(height: 15),

              const Center(
                child: Text(
                  "Please wait...",
                  style: TextStyle(color: Colors.white54),
                ),
              ),

              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
