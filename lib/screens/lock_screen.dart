import 'dart:async';
import 'package:flutter/material.dart';
import 'home_screen.dart';

class LockScreen extends StatefulWidget {
  const LockScreen({super.key});

  @override
  State<LockScreen> createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen> {
  String _time = "";
  String _date = "";
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _updateClock();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) => _updateClock());
  }

  void _updateClock() {
    final now = DateTime.now();
    final hour =
        now.hour > 12 ? now.hour - 12 : (now.hour == 0 ? 12 : now.hour);
    final minute = now.minute.toString().padLeft(2, '0');
    final period = now.hour >= 12 ? "PM" : "AM";
    setState(() {
      _time = "$hour:$minute $period";
      _date = "${_weekday(now.weekday)}, ${_month(now.month)} ${now.day}";
    });
  }

  String _weekday(int d) {
    const days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
    return days[d - 1];
  }

  String _month(int m) {
    const months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun",
                    "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
    return months[m - 1];
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _unlock() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: _unlock,
        onVerticalDragEnd: (details) {
          if (details.primaryVelocity != null &&
              details.primaryVelocity! < 0) {
            _unlock(); // swipe up
          }
        },
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset("lib/assets/images/background.jpg", fit: BoxFit.cover),
            Container(color: Colors.black.withOpacity(.78)),
            SafeArea(
              child: Column(
                children: [
                  const SizedBox(height: 80),
                  Text(_time,
                      style: const TextStyle(
                          fontSize: 72, fontWeight: FontWeight.w300)),
                  Text(_date,
                      style: const TextStyle(
                          fontSize: 18, color: Colors.white70)),
                  const Spacer(),
                  const Icon(Icons.lock, color: Colors.white70, size: 30),
                  const SizedBox(height: 12),
                  Text("Ruby's Phone",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white.withOpacity(.85),
                          fontWeight: FontWeight.w500)),
                  const SizedBox(height: 40),
                  const Icon(Icons.keyboard_arrow_up,
                      color: Colors.white54, size: 28),
                  const Text("Swipe up or tap to unlock",
                      style: TextStyle(color: Colors.white54, fontSize: 14)),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
