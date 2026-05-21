import 'package:flutter/material.dart';
import '../screens/HomePage.dart';
import '../generated/app_localizations.dart';
import '../data/users_data.dart';
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
    if (!_formKey.currentState!.validate()) return;

    setState(
      () {
        _isLoading =
            true;
        _errorMessage =
            null;
      },
    );

    await Future.delayed(
      const Duration(
        milliseconds:
            500,
      ),
    );

    // ✅ شيك على اليوزرات الثابتة
    final user = UsersData.login(
      _emailController.text,
      _passwordController.text,
    );

    if (mounted) {
      if (user !=
          null) {
        // ✅ اليوزر موجود — بعت الـ currentUser للـ HomeScreen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder:
                (
                  _,
                ) => HomeScreen(
                  currentUser:
                      user,
                ),
          ),
        );
      } else {
        // ❌ الإيميل أو الباسورد غلط
        setState(
          () {
            _errorMessage =
                AppLocalizations.of(
                  context,
                )!.invalidCredentials;
            _isLoading =
                false;
          },
        );
      }
    }

    if (mounted)
      setState(
        () =>
            _isLoading =
                false,
      );
  }

  Future<
    void
  >
  _handleResetPassword() async {
    final email =
        _emailController.text.trim();
    final l10n =
        AppLocalizations.of(
          context,
        )!;

    if (email.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(
        SnackBar(
          content: Text(
            l10n.enterEmailFirst,
          ),
          backgroundColor:
              Colors.orange,
        ),
      );
      return;
    }

    if (mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(
        SnackBar(
          content: Text(
            l10n.resetLinkSent,
          ),
          backgroundColor:
              Theme.of(
                context,
              ).colorScheme.primary,
        ),
      );
    }
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final l10n =
        AppLocalizations.of(
          context,
        )!;
    final theme = Theme.of(
      context,
    );
    final isDark =
        theme.brightness ==
        Brightness.dark;

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

                  // Header
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
                          l10n.welcome,
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
                          l10n.login,
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

                        Center(
                          child: Stack(
                            alignment:
                                Alignment.center,
                            clipBehavior:
                                Clip.none,
                            children: [
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
                        l10n.email,
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
                        return l10n.enterEmail;
                      }
                      if (!value.contains(
                        '@',
                      ))
                        return l10n.invalidEmail;
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
                        l10n.password,
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
                          () =>
                              _obscurePassword =
                                  !_obscurePassword,
                        );
                      },
                    ),
                    validator: (
                      value,
                    ) {
                      if (value ==
                              null ||
                          value.isEmpty) {
                        return l10n.enterPassword;
                      }
                      if (value.length <
                          6)
                        return l10n.passwordLength;
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
                        l10n.forgetPassword,
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
                              : Text(
                                l10n.login,
                                style: const TextStyle(
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
