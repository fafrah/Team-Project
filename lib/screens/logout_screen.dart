import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'splash_screen.dart';

class LogoutScreen extends StatefulWidget {
  const LogoutScreen({super.key});

  @override
  State<LogoutScreen> createState() => _LogoutScreenState();
}

class _LogoutScreenState extends State<LogoutScreen> {
  bool isLoggingOut = false;
  String errorMessage = '';

  Future<void> logoutUser() async {
    setState(() {
      isLoggingOut = true;
      errorMessage = '';
    });

    try {
      await FirebaseAuth.instance.signOut();

      if (!mounted) return;

      // Remove all previous investigation screens.
      // Return to the original Finding Ruby splash screen.
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const SplashScreen()),
        (route) => false,
      );
    } on FirebaseAuthException {
      if (!mounted) return;

      setState(() {
        isLoggingOut = false;
        errorMessage = 'Unable to log out. Please try again.';
      });
    } catch (_) {
      if (!mounted) return;

      setState(() {
        isLoggingOut = false;
        errorMessage = 'Something went wrong. Please try again.';
      });
    }
  }

  void cancelLogout() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('lib/assets/images/background.jpg', fit: BoxFit.cover),
          Container(color: Colors.black.withOpacity(0.78)),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(28),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 500),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.logout,
                        color: Colors.redAccent,
                        size: 90,
                      ),
                      const SizedBox(height: 25),
                      const Text(
                        'Log Out?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 38,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 18),
                      const Text(
                        'Are you sure you want to leave the investigation?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 19,
                          height: 1.4,
                        ),
                      ),

                      if (errorMessage.isNotEmpty) ...[
                        const SizedBox(height: 20),
                        Semantics(
                          liveRegion: true,
                          child: Text(
                            errorMessage,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.redAccent,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],

                      const SizedBox(height: 40),

                      // Confirm logout
                      SizedBox(
                        width: double.infinity,
                        height: 58,
                        child: ElevatedButton(
                          onPressed: isLoggingOut ? null : logoutUser,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent,
                            foregroundColor: Colors.white,
                            disabledBackgroundColor: Colors.redAccent
                                .withOpacity(0.45),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                          child: isLoggingOut
                              ? const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 22,
                                      height: 22,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 3,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(width: 12),
                                    Text(
                                      'LOGGING OUT...',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                )
                              : const Text(
                                  'LOG OUT',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ),
                      ),
                      const SizedBox(height: 15),

                      // Cancel logout
                      SizedBox(
                        width: double.infinity,
                        height: 58,
                        child: OutlinedButton(
                          onPressed: isLoggingOut ? null : cancelLogout,
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.white,
                            side: const BorderSide(color: Colors.white54),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                          child: const Text(
                            'CANCEL',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
