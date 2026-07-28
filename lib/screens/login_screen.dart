import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/investigation_clock.dart';
import '../providers/game_provider.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false;
  bool obscurePassword = true;
  String errorMessage = '';

  bool isValidEmail(String email) {
    final RegExp emailPattern = RegExp(
      r'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$',
    );

    return emailPattern.hasMatch(email);
  }

  bool isValidPassword(String password) {
    final bool hasUppercase = RegExp(r'[A-Z]').hasMatch(password);
    final bool hasNumber = RegExp(r'[0-9]').hasMatch(password);

    return password.length >= 8 && hasUppercase && hasNumber;
  }

  String getLoginErrorMessage(FirebaseAuthException error) {
    switch (error.code) {
      case 'invalid-email':
        return 'Please enter a valid email address.';

      case 'user-not-found':
      case 'wrong-password':
      case 'invalid-credential':
        return 'The email or password is incorrect.';

      case 'user-disabled':
        return 'This account has been disabled.';

      case 'too-many-requests':
        return 'Too many login attempts. Please wait and try again.';

      case 'network-request-failed':
        return 'Unable to connect. Please check your internet connection.';

      default:
        return 'Login failed. Please try again.';
    }
  }

  Future<void> loginUser() async {
    FocusScope.of(context).unfocus();

    setState(() {
      errorMessage = '';
    });

    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text,
      );

      if (!mounted) return;

      context.read<GameProvider>().resetGame();
      InvestigationClock.reset();
    } on FirebaseAuthException catch (error) {
      if (!mounted) return;

      setState(() {
        errorMessage = getLoginErrorMessage(error);
      });
    } catch (_) {
      if (!mounted) return;

      setState(() {
        errorMessage = 'Something went wrong. Please try again.';
      });
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
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
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Icon(
                          Icons.search,
                          color: Colors.redAccent,
                          size: 80,
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Finding Ruby',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 38,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Log in to continue the investigation.',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white70, fontSize: 17),
                        ),
                        const SizedBox(height: 35),

                        // Email field
                        TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          autofillHints: const [AutofillHints.email],
                          autocorrect: false,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            prefixIcon: const Icon(Icons.email),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.08),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          validator: (value) {
                            final String email = value?.trim() ?? '';

                            if (email.isEmpty) {
                              return 'Email is required.';
                            }

                            if (!isValidEmail(email)) {
                              return 'Enter a valid email address.';
                            }

                            return null;
                          },
                        ),
                        const SizedBox(height: 18),

                        // Password field
                        TextFormField(
                          controller: passwordController,
                          obscureText: obscurePassword,
                          textInputAction: TextInputAction.done,
                          autofillHints: const [AutofillHints.password],
                          onFieldSubmitted: (_) {
                            if (!isLoading) {
                              loginUser();
                            }
                          },
                          decoration: InputDecoration(
                            labelText: 'Password',
                            prefixIcon: const Icon(Icons.lock),
                            suffixIcon: IconButton(
                              tooltip: obscurePassword
                                  ? 'Show password'
                                  : 'Hide password',
                              onPressed: () {
                                setState(() {
                                  obscurePassword = !obscurePassword;
                                });
                              },
                              icon: Icon(
                                obscurePassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.08),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          validator: (value) {
                            final String password = value ?? '';

                            if (password.isEmpty) {
                              return 'Password is required.';
                            }

                            if (!isValidPassword(password)) {
                              return 'Password must have at least 8 characters, 1 uppercase letter, and 1 number.';
                            }

                            return null;
                          },
                        ),
                        const SizedBox(height: 15),

                        // Firebase login error
                        if (errorMessage.isNotEmpty)
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
                        const SizedBox(height: 20),

                        // Login button
                        SizedBox(
                          height: 58,
                          child: ElevatedButton(
                            onPressed: isLoading ? null : loginUser,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                            child: isLoading
                                ? const SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 3,
                                      color: Colors.white,
                                    ),
                                  )
                                : const Text(
                                    'LOGIN',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                          ),
                        ),
                        const SizedBox(height: 18),

                        // Signup link
                        TextButton(
                          onPressed: isLoading
                              ? null
                              : () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const SignupScreen(),
                                    ),
                                  );
                                },
                          child: const Text(
                            "Don't have an account? Sign up",
                            style: TextStyle(color: Colors.white70),
                          ),
                        ),
                      ],
                    ),
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
