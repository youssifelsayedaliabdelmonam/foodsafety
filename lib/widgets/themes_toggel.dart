import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/themes_provider.dart';

class ThemeToggleButton
    extends
        StatelessWidget {
  const ThemeToggleButton({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    final themeProvider = Provider.of<
      ThemeProvider
    >(
      context,
    );

    return IconButton(
      onPressed: () {
        themeProvider.toggleTheme();
      },
      icon: Container(
        padding: const EdgeInsets.all(
          8,
        ),
        decoration: BoxDecoration(
          color: Theme.of(
            context,
          ).colorScheme.surface.withOpacity(
            0.8,
          ),
          borderRadius: BorderRadius.circular(
            10,
          ),
          border: Border.all(
            color: Theme.of(
              context,
            ).colorScheme.primary.withOpacity(
              0.2,
            ),
            width:
                1,
          ),
        ),
        child: Icon(
          themeProvider.isDarkMode
              ? Icons.light_mode
              : Icons.dark_mode,
          color:
              Theme.of(
                context,
              ).colorScheme.primary,
          size:
              20,
        ),
      ),
      tooltip:
          themeProvider.isDarkMode
              ? 'الوضع الفاتح'
              : 'الوضع الداكن',
    );
  }
}
