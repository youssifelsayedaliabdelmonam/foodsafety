import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/app_localizations.dart';
import 'concentric_transition/concentric_transition.dart';
import 'LoginPage.dart';
import 'app_theme.dart';
import 'providers/themes_provider.dart';
import 'data/users_data.dart';

void
main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UsersData.loadUsers();

  runApp(
    ChangeNotifierProvider(
      create:
          (
            _,
          ) =>
              ThemeProvider(),
      child:
          const MyApp(),
    ),
  );
}

class MyApp
    extends
        StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Consumer<
      ThemeProvider
    >(
      builder: (
        context,
        themeProvider,
        child,
      ) {
        return MaterialApp(
          title:
              'FOD Track',
          debugShowCheckedModeBanner:
              false,

          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale(
              'en',
            ),
            Locale(
              'ar',
            ),
          ],
          localeResolutionCallback: (
            locale,
            supportedLocales,
          ) {
            for (var supported in supportedLocales) {
              if (supported.languageCode ==
                  locale?.languageCode) {
                return supported;
              }
            }
            return const Locale(
              'en',
            );
          },

          theme:
              AppTheme.lightTheme,
          darkTheme:
              AppTheme.darkTheme,
          themeMode:
              themeProvider.isDarkMode
                  ? ThemeMode.dark
                  : ThemeMode.light,

          // ✅ الـ AppSplashScreen هي الشاشة الأولى دلوقتي
          home:
              const AppSplashScreen(),
        );
      },
    );
  }
}

// ══════════════════════════════════════════
// ① Splash Screen — لوجو + Typewriter Effect
// ══════════════════════════════════════════
class AppSplashScreen
    extends
        StatefulWidget {
  const AppSplashScreen({
    super.key,
  });

  @override
  State<
    AppSplashScreen
  >
  createState() =>
      _AppSplashScreenState();
}

class _AppSplashScreenState
    extends
        State<
          AppSplashScreen
        >
    with
        SingleTickerProviderStateMixin {
  static const String _appName =
      'FoDTracK';

  String _displayedText =
      '';
  int _charIndex =
      0;
  Timer? _typewriterTimer;

  late AnimationController _logoController;
  late Animation<
    double
  >
  _logoFade;
  late Animation<
    double
  >
  _logoScale;

  @override
  void initState() {
    super.initState();

    _logoController = AnimationController(
      vsync:
          this,
      duration: const Duration(
        milliseconds:
            900,
      ),
    );

    _logoFade = Tween<
      double
    >(
      begin:
          0,
      end:
          1,
    ).animate(
      CurvedAnimation(
        parent:
            _logoController,
        curve:
            Curves.easeIn,
      ),
    );

    _logoScale = Tween<
      double
    >(
      begin:
          0.7,
      end:
          1,
    ).animate(
      CurvedAnimation(
        parent:
            _logoController,
        curve:
            Curves.elasticOut,
      ),
    );

    _logoController.forward();

    Future.delayed(
      const Duration(
        milliseconds:
            900,
      ),
      _startTypewriter,
    );
  }

  void _startTypewriter() {
    _typewriterTimer = Timer.periodic(
      const Duration(
        milliseconds:
            120,
      ),
      (
        timer,
      ) {
        if (_charIndex <
            _appName.length) {
          setState(
            () {
              _displayedText = _appName.substring(
                0,
                _charIndex +
                    1,
              );
              _charIndex++;
            },
          );
        } else {
          timer.cancel();
          Future.delayed(
            const Duration(
              milliseconds:
                  400,
            ),
            _navigateNext,
          );
        }
      },
    );
  }

  void _navigateNext() {
    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder:
            (
              _,
              __,
              ___,
            ) =>
                const OnboardingScreen(),
        transitionsBuilder:
            (
              _,
              animation,
              __,
              child,
            ) => FadeTransition(
              opacity:
                  animation,
              child:
                  child,
            ),
        transitionDuration: const Duration(
          milliseconds:
              600,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _typewriterTimer?.cancel();
    _logoController.dispose();
    super.dispose();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      backgroundColor:
          Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,
          children: [
            // ── اللوجو ──
            AnimatedBuilder(
              animation:
                  _logoController,
              builder:
                  (
                    context,
                    child,
                  ) => Opacity(
                    opacity:
                        _logoFade.value,
                    child: Transform.scale(
                      scale:
                          _logoScale.value,
                      child:
                          child,
                    ),
                  ),
              child: Image.asset(
                'assets/1.jpeg',
                width:
                    160,
                height:
                    160,
              ),
            ),

            const SizedBox(
              height:
                  24,
            ),

            // ── اسم التطبيق بالـ Typewriter ──
            Row(
              mainAxisSize:
                  MainAxisSize.min,
              crossAxisAlignment:
                  CrossAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    children: List.generate(
                      _displayedText.length,
                      (
                        i,
                      ) {
                        final char =
                            _displayedText[i];
                        final isUpper =
                            char ==
                                char.toUpperCase() &&
                            char !=
                                char.toLowerCase();
                        return TextSpan(
                          text:
                              char,
                          style: TextStyle(
                            fontSize:
                                32,
                            fontWeight:
                                FontWeight.bold,
                            letterSpacing:
                                2,
                            color:
                                isUpper
                                    ? const Color(
                                      0xFF1565C0,
                                    )
                                    : const Color(
                                      0xFF42A5F5,
                                    ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                if (_charIndex <
                    _appName.length)
                  const _BlinkingCursor(),
              ],
            ),

            const SizedBox(
              height:
                  8,
            ),

            // ── tagline ──
            AnimatedOpacity(
              opacity:
                  _charIndex ==
                          _appName.length
                      ? 1
                      : 0,
              duration: const Duration(
                milliseconds:
                    500,
              ),
              child: const Text(
                'Foreign Object Debris Tracking',
                style: TextStyle(
                  fontSize:
                      12,
                  color:
                      Colors.blueGrey,
                  letterSpacing:
                      1.2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── مؤشر وامض ──
class _BlinkingCursor
    extends
        StatefulWidget {
  const _BlinkingCursor();

  @override
  State<
    _BlinkingCursor
  >
  createState() =>
      _BlinkingCursorState();
}

class _BlinkingCursorState
    extends
        State<
          _BlinkingCursor
        >
    with
        SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync:
          this,
      duration: const Duration(
        milliseconds:
            500,
      ),
    )..repeat(
      reverse:
          true,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return FadeTransition(
      opacity:
          _controller,
      child: const Text(
        '|',
        style: TextStyle(
          color: Color(
            0xFF1565C0,
          ),
          fontWeight:
              FontWeight.w300,
          fontSize:
              36,
        ),
      ),
    );
  }
}

// ══════════════════════════════════════════
// ② Onboarding Screen — ConcentricPageView
// ══════════════════════════════════════════
class OnboardingScreen
    extends
        StatelessWidget {
  const OnboardingScreen({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    final theme = Theme.of(
      context,
    );
    final primary =
        theme.colorScheme.primary;
    final isDark =
        theme.brightness ==
        Brightness.dark;

    return Scaffold(
      body: ConcentricPageView(
        colors:
            isDark
                ? const [
                  Color(
                    0xFF1a1a2e,
                  ),
                  Color(
                    0xFF16213e,
                  ),
                  Color(
                    0xFF0f3460,
                  ),
                ]
                : const [
                  Color.fromARGB(
                    255,
                    2,
                    154,
                    119,
                  ),
                  Color.fromARGB(
                    255,
                    3,
                    68,
                    62,
                  ),
                  Color.fromARGB(
                    255,
                    193,
                    201,
                    193,
                  ),
                ],
        itemCount:
            3,
        itemBuilder:
            (
              index,
            ) => _SplashPage(
              index:
                  index,
              theme:
                  theme,
            ),
        onFinish: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder:
                  (
                    _,
                  ) =>
                      const LoginPage(),
            ),
          );
        },
        nextButtonBuilder:
            (
              context,
            ) => Container(
              decoration: BoxDecoration(
                color:
                    Colors.white,
                shape:
                    BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(
                      0.2,
                    ),
                    blurRadius:
                        10,
                    offset: const Offset(
                      0,
                      4,
                    ),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(
                  12,
                ),
                child: Icon(
                  Icons.arrow_forward,
                  size:
                      30,
                  color:
                      primary,
                ),
              ),
            ),
        radius:
            50.0,
        verticalPosition:
            0.72,
        scaleFactor:
            0.3,
        opacityFactor:
            0.5,
      ),
    );
  }
}

// ── صفحات الـ Onboarding ──
class _SplashPage
    extends
        StatelessWidget {
  final int index;
  final ThemeData theme;

  const _SplashPage({
    required this.index,
    required this.theme,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    final l10n =
        AppLocalizations.of(
          context,
        )!;

    final pages = [
      {
        'icon':
            Icons.rocket_launch,
        'title':
            l10n.splashTitle1,
        'description':
            l10n.splashDesc1,
      },
      {
        'icon':
            Icons.palette,
        'title':
            l10n.splashTitle2,
        'description':
            l10n.splashDesc2,
      },
      {
        'icon':
            Icons.celebration,
        'title':
            l10n.splashTitle3,
        'description':
            l10n.splashDesc3,
      },
    ];

    final page =
        pages[index];

    return Padding(
      padding: const EdgeInsets.all(
        40.0,
      ),
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center,
        children: [
          Icon(
            page['icon']
                as IconData,
            size:
                120,
            color: const Color.fromARGB(
              255,
              73,
              169,
              134,
            ),
          ),
          const SizedBox(
            height:
                50,
          ),
          Text(
            page['title']
                as String,
            style: theme.textTheme.headlineLarge?.copyWith(
              color: const Color.fromARGB(
                255,
                255,
                255,
                255,
              ),
            ),
            textAlign:
                TextAlign.center,
          ),
          const SizedBox(
            height:
                20,
          ),
          Text(
            page['description']
                as String,
            style: theme.textTheme.bodyLarge?.copyWith(
              color:
                  Colors.white70,
            ),
            textAlign:
                TextAlign.center,
          ),
        ],
      ),
    );
  }
}
