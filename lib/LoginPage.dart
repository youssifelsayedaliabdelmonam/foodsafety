import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../screens/HomePage.dart';
import 'widgets/themes_toggel.dart';

class LoginPage
    extends
        StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  State<
    LoginPage
  >
  createState() =>
      _LoginPageState();
}

class _LoginPageState
    extends
        State<
          LoginPage
        > {
  final _formKey =
      GlobalKey<
        FormState
      >();
  final _emailController =
      TextEditingController();
  final _passwordController =
      TextEditingController();
  final _auth =
      FirebaseAuth.instance;

  bool _obscurePassword =
      true;
  bool _isLoading =
      false;
  String? _errorMessage;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<
    void
  >
  _handleLogin() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(
      () {
        _isLoading =
            true;
        _errorMessage =
            null;
      },
    );

    try {
      final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email:
            _emailController.text.trim(),
        password:
            _passwordController.text.trim(),
      );

      if (userCredential.user !=
              null &&
          mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder:
                (
                  context,
                ) =>
                    const HomeScreen(),
          ),
        );
      }
    } on FirebaseAuthException catch (
      e
    ) {
      setState(
        () {
          switch (e.code) {
            case 'user-not-found':
              _errorMessage =
                  'Email not registered';
              break;
            case 'wrong-password':
              _errorMessage =
                  'Incorrect password';
              break;
            case 'invalid-email':
              _errorMessage =
                  'Invalid email';
              break;
            case 'user-disabled':
              _errorMessage =
                  'This account is disabled';
              break;
            case 'too-many-requests':
              _errorMessage =
                  'Too many attempts, try later';
              break;
            default:
              _errorMessage =
                  'Error: ${e.message}';
          }
        },
      );
    } catch (
      e
    ) {
      setState(
        () {
          _errorMessage =
              'An unexpected error occurred';
        },
      );
    } finally {
      setState(
        () {
          _isLoading =
              false;
        },
      );
    }
  }

  Future<
    void
  >
  _handleSignUp() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(
      () {
        _isLoading =
            true;
        _errorMessage =
            null;
      },
    );

    try {
      final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email:
            _emailController.text.trim(),
        password:
            _passwordController.text.trim(),
      );

      if (userCredential.user !=
              null &&
          mounted) {
        await userCredential.user!.sendEmailVerification();

        ScaffoldMessenger.of(
          context,
        ).showSnackBar(
          SnackBar(
            content: const Text(
              'Account created! Check your email',
            ),
            backgroundColor:
                Theme.of(
                  context,
                ).colorScheme.primary,
          ),
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder:
                (
                  context,
                ) =>
                    const HomeScreen(),
          ),
        );
      }
    } on FirebaseAuthException catch (
      e
    ) {
      setState(
        () {
          switch (e.code) {
            case 'weak-password':
              _errorMessage =
                  'Password is too weak';
              break;
            case 'email-already-in-use':
              _errorMessage =
                  'Email already in use';
              break;
            case 'invalid-email':
              _errorMessage =
                  'Invalid email';
              break;
            default:
              _errorMessage =
                  'Error: ${e.message}';
          }
        },
      );
    } catch (
      e
    ) {
      setState(
        () {
          _errorMessage =
              'An unexpected error occurred';
        },
      );
    } finally {
      setState(
        () {
          _isLoading =
              false;
        },
      );
    }
  }

  Future<
    void
  >
  _handleResetPassword() async {
    final email =
        _emailController.text.trim();

    if (email.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(
        const SnackBar(
          content: Text(
            'Please enter your email first',
          ),
          backgroundColor:
              Colors.orange,
        ),
      );
      return;
    }

    try {
      await _auth.sendPasswordResetEmail(
        email:
            email,
      );
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(
          SnackBar(
            content: const Text(
              'Password reset link sent to your email',
            ),
            backgroundColor:
                Theme.of(
                  context,
                ).colorScheme.primary,
          ),
        );
      }
    } on FirebaseAuthException catch (
      e
    ) {
      String message =
          'An error occurred';
      if (e.code ==
          'user-not-found') {
        message =
            'Email not registered';
      }
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(
          SnackBar(
            content: Text(
              message,
            ),
            backgroundColor:
                Theme.of(
                  context,
                ).colorScheme.error,
          ),
        );
      }
    }
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    // ✅ استخدام Theme بدل الألوان الثابتة
    final theme = Theme.of(
      context,
    );
    final isDark =
        theme.brightness ==
        Brightness.dark;

    final primaryColor =
        theme.colorScheme.primary;
    final backgroundColor =
        isDark
            ? const Color(
              0xFF1a1a2e,
            )
            : const Color(
              0xFFF5F5F5,
            );
    final cardColor =
        isDark
            ? const Color(
              0xFF2d2d44,
            )
            : Colors.white;
    final textColor =
        isDark
            ? Colors.white
            : Colors.black87;
    final secondaryTextColor =
        isDark
            ? Colors.white70
            : Colors.grey;
    final accentColor =
        isDark
            ? theme.colorScheme.primary
            : const Color(
              0xFF80CBC4,
            );

    return Scaffold(
      backgroundColor:
          backgroundColor,
      appBar: AppBar(
        backgroundColor:
            Colors.transparent,
        elevation:
            0,
        actions: const [
          ThemeToggleButton(),
        ],
      ),
      extendBodyBehindAppBar:
          true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal:
                  24.0,
            ),
            child: Form(
              key:
                  _formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height:
                        20,
                  ),

                  // Header with curved background
                  Container(
                    width:
                        double.infinity,
                    decoration: BoxDecoration(
                      color:
                          accentColor,
                      borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(
                          200,
                        ),
                      ),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height:
                              20,
                        ),
                        Text(
                          'Welcome!',
                          style: TextStyle(
                            fontSize:
                                32,
                            fontWeight:
                                FontWeight.w600,
                            color:
                                isDark
                                    ? const Color.fromARGB(
                                      255,
                                      96,
                                      254,
                                      220,
                                    )
                                    : const Color(
                                      0xFF4DB6AC,
                                    ),
                            letterSpacing:
                                1,
                          ),
                        ),
                        const SizedBox(
                          height:
                              8,
                        ),
                        Text(
                          'Login',
                          style: TextStyle(
                            fontSize:
                                24,
                            fontWeight:
                                FontWeight.w500,
                            color:
                                isDark
                                    ? const Color.fromARGB(
                                      255,
                                      247,
                                      247,
                                      247,
                                    )
                                    : Colors.black87,
                          ),
                        ),
                        const SizedBox(
                          height:
                              30,
                        ),

                        // Illustration - مبسط وبيشتغل مع الثيمات
                        Center(
                          child: Stack(
                            alignment:
                                Alignment.center,
                            clipBehavior:
                                Clip.none,
                            children: [
                              // الشاشة في المنتصف
                              Container(
                                width:
                                    120,
                                height:
                                    160,
                                decoration: BoxDecoration(
                                  color:
                                      cardColor,
                                  borderRadius: BorderRadius.circular(
                                    15,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(
                                        0.15,
                                      ),
                                      blurRadius:
                                          20,
                                      offset: const Offset(
                                        0,
                                        8,
                                      ),
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(
                                    20,
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: [
                                      // أيقونة المستخدم
                                      Container(
                                        width:
                                            50,
                                        height:
                                            50,
                                        decoration: BoxDecoration(
                                          color:
                                              accentColor,
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.person,
                                          color:
                                              isDark
                                                  ? const Color.fromARGB(
                                                    255,
                                                    130,
                                                    245,
                                                    224,
                                                  )
                                                  : const Color.fromARGB(
                                                    255,
                                                    134,
                                                    249,
                                                    218,
                                                  ),
                                          size:
                                              30,
                                        ),
                                      ),
                                      const SizedBox(
                                        height:
                                            15,
                                      ),
                                      // خطوط تمثل النص
                                      Container(
                                        width:
                                            60,
                                        height:
                                            8,
                                        decoration: BoxDecoration(
                                          color: secondaryTextColor.withOpacity(
                                            0.3,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            4,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height:
                                            8,
                                      ),
                                      Container(
                                        width:
                                            70,
                                        height:
                                            8,
                                        decoration: BoxDecoration(
                                          color: secondaryTextColor.withOpacity(
                                            0.3,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            4,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              // دوائر ديكور
                              Positioned(
                                left:
                                    -10,
                                top:
                                    30,
                                child: Container(
                                  width:
                                      30,
                                  height:
                                      30,
                                  decoration: BoxDecoration(
                                    color: accentColor.withOpacity(
                                      0.3,
                                    ),
                                    shape:
                                        BoxShape.circle,
                                  ),
                                ),
                              ),

                              Positioned(
                                right:
                                    -10,
                                bottom:
                                    30,
                                child: Container(
                                  width:
                                      40,
                                  height:
                                      40,
                                  decoration: BoxDecoration(
                                    color: accentColor.withOpacity(
                                      0.3,
                                    ),
                                    shape:
                                        BoxShape.circle,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height:
                              30,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height:
                        40,
                  ),

                  // Error message
                  if (_errorMessage !=
                      null)
                    Container(
                      padding: const EdgeInsets.all(
                        12,
                      ),
                      margin: const EdgeInsets.only(
                        bottom:
                            20,
                      ),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.error.withOpacity(
                          0.1,
                        ),
                        borderRadius: BorderRadius.circular(
                          12,
                        ),
                        border: Border.all(
                          color:
                              theme.colorScheme.error,
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.error,
                            color:
                                theme.colorScheme.error,
                          ),
                          const SizedBox(
                            width:
                                10,
                          ),
                          Expanded(
                            child: Text(
                              _errorMessage!,
                              style: TextStyle(
                                color:
                                    theme.colorScheme.error,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                  // Email field
                  _buildTextField(
                    context:
                        context,
                    controller:
                        _emailController,
                    label:
                        'Email',
                    icon:
                        Icons.email_outlined,
                    keyboardType:
                        TextInputType.emailAddress,
                    textColor:
                        textColor,
                    secondaryColor:
                        secondaryTextColor,
                    cardColor:
                        cardColor,
                    accentColor:
                        accentColor,
                    validator: (
                      value,
                    ) {
                      if (value ==
                              null ||
                          value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!value.contains(
                        '@',
                      )) {
                        return 'Invalid email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height:
                        20,
                  ),

                  // Password field
                  _buildTextField(
                    context:
                        context,
                    controller:
                        _passwordController,
                    label:
                        'Password',
                    icon:
                        Icons.lock_outline,
                    obscureText:
                        _obscurePassword,
                    textColor:
                        textColor,
                    secondaryColor:
                        secondaryTextColor,
                    cardColor:
                        cardColor,
                    accentColor:
                        accentColor,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color:
                            secondaryTextColor,
                      ),
                      onPressed: () {
                        setState(
                          () {
                            _obscurePassword =
                                !_obscurePassword;
                          },
                        );
                      },
                    ),
                    validator: (
                      value,
                    ) {
                      if (value ==
                              null ||
                          value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length <
                          6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height:
                        10,
                  ),

                  // Forgot password
                  Align(
                    alignment:
                        Alignment.centerRight,
                    child: TextButton(
                      onPressed:
                          _handleResetPassword,
                      child: Text(
                        'Forget Password?',
                        style: TextStyle(
                          color:
                              secondaryTextColor,
                          fontSize:
                              14,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height:
                        20,
                  ),

                  // Login button
                  SizedBox(
                    width:
                        double.infinity,
                    height:
                        55,
                    child: ElevatedButton(
                      onPressed:
                          _isLoading
                              ? null
                              : _handleLogin,
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            accentColor,
                        foregroundColor:
                            Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            30,
                          ),
                        ),
                        elevation:
                            2,
                      ),
                      child:
                          _isLoading
                              ? const SizedBox(
                                width:
                                    24,
                                height:
                                    24,
                                child: CircularProgressIndicator(
                                  strokeWidth:
                                      2,
                                  valueColor: AlwaysStoppedAnimation<
                                    Color
                                  >(
                                    Colors.white,
                                  ),
                                ),
                              )
                              : const Text(
                                'Login',
                                style: TextStyle(
                                  fontSize:
                                      18,
                                  fontWeight:
                                      FontWeight.bold,
                                ),
                              ),
                    ),
                  ),
                  const SizedBox(
                    height:
                        20,
                  ),

                  // Sign up
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't Have Account? ",
                        style: TextStyle(
                          color:
                              secondaryTextColor,
                          fontSize:
                              14,
                        ),
                      ),
                      TextButton(
                        onPressed:
                            _isLoading
                                ? null
                                : _handleSignUp,
                        child: Text(
                          'Signup',
                          style: TextStyle(
                            color:
                                textColor,
                            fontSize:
                                14,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height:
                        20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required BuildContext context,
    required TextEditingController controller,
    required String label,
    required IconData icon,
    required Color textColor,
    required Color secondaryColor,
    required Color cardColor,
    required Color accentColor,
    bool obscureText =
        false,
    TextInputType? keyboardType,
    Widget? suffixIcon,
    String? Function(
      String?,
    )?
    validator,
  }) {
    return Container(
      decoration: BoxDecoration(
        color:
            cardColor,
        borderRadius: BorderRadius.circular(
          30,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(
              0.05,
            ),
            blurRadius:
                10,
            offset: const Offset(
              0,
              2,
            ),
          ),
        ],
      ),
      child: TextFormField(
        controller:
            controller,
        obscureText:
            obscureText,
        keyboardType:
            keyboardType,
        style: TextStyle(
          color:
              textColor,
        ),
        decoration: InputDecoration(
          labelText:
              label,
          labelStyle: TextStyle(
            color:
                secondaryColor,
          ),
          prefixIcon: Icon(
            icon,
            color:
                secondaryColor,
          ),
          suffixIcon:
              suffixIcon,
          filled:
              true,
          fillColor:
              cardColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              30,
            ),
            borderSide:
                BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              30,
            ),
            borderSide:
                BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              30,
            ),
            borderSide: BorderSide(
              color:
                  accentColor,
              width:
                  2,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              30,
            ),
            borderSide: BorderSide(
              color:
                  Theme.of(
                    context,
                  ).colorScheme.error,
              width:
                  1,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              30,
            ),
            borderSide: BorderSide(
              color:
                  Theme.of(
                    context,
                  ).colorScheme.error,
              width:
                  2,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal:
                20,
            vertical:
                18,
          ),
        ),
        validator:
            validator,
      ),
    );
  }
}
