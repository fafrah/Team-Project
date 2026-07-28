import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool isLoading = false;
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  String errorMessage = '';

  bool isValidEmail(String email) {
    final RegExp emailPattern = RegExp(
      r'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$',
    );

    return emailPattern.hasMatch(email);
  }

  String getSignupErrorMessage(FirebaseAuthException error) {
    switch (error.code) {
      case 'invalid-email':
        return 'Please enter a valid email address.';

      case 'email-already-in-use':
        return 'An account already exists for this email.';

      case 'weak-password':
        return 'The password does not meet the security requirements.';

      case 'operation-not-allowed':
        return 'Account creation is currently unavailable.';

      case 'network-request-failed':
        return 'Unable to connect. Please check your internet connection.';

      default:
        return 'Account creation failed. Please try again.';
    }
  }

  Future<void> signupUser() async {
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
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text,
      );

      if (!mounted) return;

      // Account creation signs the user in automatically.
      // Closing this screen allows AuthGate to continue the app.
      Navigator.pop(context);
    } on FirebaseAuthException catch (error) {
      if (!mounted) return;

      setState(() {
        errorMessage = getSignupErrorMessage(error);
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
    confirmPasswordController.dispose();
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
                          Icons.person_add,
                          color: Colors.redAccent,
                          size: 80,
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Create Account',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 38,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Sign up to begin the case.',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white70, fontSize: 17),
                        ),
                        const SizedBox(height: 35),

                        // Email field
                        TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          autofillHints: const [AutofillHints.newUsername],
                          autocorrect: false,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            hintText: 'Johndoe123@example.com',
                            helperText: 'Example: Johndoe123@example.com',
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
                              return 'Enter a valid email, such as Johndoe123@example.com.';
                            }

                            return null;
                          },
                        ),
                        const SizedBox(height: 18),

                        // Password field
                        TextFormField(
                          controller: passwordController,
                          obscureText: obscurePassword,
                          textInputAction: TextInputAction.next,
                          autofillHints: const [AutofillHints.newPassword],
                          decoration: InputDecoration(
                            labelText: 'Password',
                            helperText:
                                'At least 8 characters, 1 uppercase letter, and 1 number.',
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

                            if (password.length < 8) {
                              return 'Password must be at least 8 characters.';
                            }

                            if (!RegExp(r'[A-Z]').hasMatch(password)) {
                              return 'Password must include at least 1 uppercase letter.';
                            }

                            if (!RegExp(r'[0-9]').hasMatch(password)) {
                              return 'Password must include at least 1 number.';
                            }

                            return null;
                          },
                        ),
                        const SizedBox(height: 18),

                        // Confirm password field
                        TextFormField(
                          controller: confirmPasswordController,
                          obscureText: obscureConfirmPassword,
                          textInputAction: TextInputAction.done,
                          onFieldSubmitted: (_) {
                            if (!isLoading) {
                              signupUser();
                            }
                          },
                          decoration: InputDecoration(
                            labelText: 'Confirm Password',
                            prefixIcon: const Icon(Icons.lock_outline),
                            suffixIcon: IconButton(
                              tooltip: obscureConfirmPassword
                                  ? 'Show password'
                                  : 'Hide password',
                              onPressed: () {
                                setState(() {
                                  obscureConfirmPassword =
                                      !obscureConfirmPassword;
                                });
                              },
                              icon: Icon(
                                obscureConfirmPassword
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
                            final String confirmation = value ?? '';

                            if (confirmation.isEmpty) {
                              return 'Please confirm your password.';
                            }

                            if (confirmation != passwordController.text) {
                              return 'Passwords do not match.';
                            }

                            return null;
                          },
                        ),
                        const SizedBox(height: 15),

                        // Firebase signup error
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

                        // Signup button
                        SizedBox(
                          height: 58,
                          child: ElevatedButton(
                            onPressed: isLoading ? null : signupUser,
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
                                    'SIGN UP',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                          ),
                        ),
                        const SizedBox(height: 18),

                        // Return to login
                        TextButton(
                          onPressed: isLoading
                              ? null
                              : () {
                                  Navigator.pop(context);
                                },
                          child: const Text(
                            'Already have an account? Log in',
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
