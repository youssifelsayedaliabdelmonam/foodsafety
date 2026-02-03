import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'concentric_transition/concentric_transition.dart';
import 'LoginPage.dart';
import 'app_theme.dart';
import 'providers/themes_provider.dart';

void
main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:
        DefaultFirebaseOptions.currentPlatform,
  );

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
              'FoodCheck',
          debugShowCheckedModeBanner:
              false,

          // ✅ تطبيق الثيمات
          theme:
              AppTheme.lightTheme,
          darkTheme:
              AppTheme.darkTheme,
          themeMode:
              themeProvider.isDarkMode
                  ? ThemeMode.dark
                  : ThemeMode.light,

          home:
              const SplashScreen(),

          // دعم اللغة العربية بشكل كامل (RTL)
          builder:
              (
                context,
                child,
              ) => Directionality(
                textDirection:
                    TextDirection.ltr,
                child:
                    child!,
              ),
        );
      },
    );
  }
}

// ── SplashScreen ──
class SplashScreen
    extends
        StatelessWidget {
  const SplashScreen({
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
            ) => _buildPage(
              index,
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

  Widget _buildPage(
    int index,
    ThemeData theme,
  ) {
    final pages = [
      {
        'icon':
            Icons.rocket_launch,
        'title':
            'Welcome!',
        'description':
            'Discover an amazing user experience with the FoodCheck app',
      },
      {
        'icon':
            Icons.palette,
        'title':
            'Beautiful Design',
        'description':
            'Enjoy attractive colors and smooth transitions',
      },
      {
        'icon':
            Icons.celebration,
        'title':
            'Let’s Get Started!',
        'description':
            'Press the arrow to log in',
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
