import 'package:flutter/material.dart';
import 'package:hire_app/core/l10n/app_localizations.g.dart';
import 'package:hire_app/core/styles/tokens.dart';
import 'package:hire_app/core/utils/extensions/navigator_state_extension.dart';
import 'package:hire_app/core/utils/routes.dart';
import 'package:hire_app/core/widgets/widgets.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  int _getCurrentIndex(BuildContext context) {
    final route = ModalRoute.of(context)!.settings.name;
    return switch (route) {
      Routes.home => 0,
      Routes.schedule => 1,
      _ => 0,
    };
  }

  void _showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        InfoSnackBar(message: message),
      );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return BottomNavigationBar(
      currentIndex: _getCurrentIndex(context),
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Tokens.colors.primary,
      unselectedItemColor:
          Tokens.colors.primary.withOpacity(Tokens.opacity.ref40),
      onTap: (value) {
        if (value == _getCurrentIndex(context)) return;

        final _ = switch (value) {
          0 => Navigator.of(context).navigate(Routes.home),
          1 => Navigator.of(context).navigate(Routes.schedule),
          _ => _showSnackbar(context, l10n.unavailableFeature),
        };
      },
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.home),
          label: l10n.bottomNavHomeTab,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.event),
          label: l10n.bottomNavScheduleTab,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.crisis_alert),
          label: l10n.bottomNavUrgentTab,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.forum),
          label: l10n.bottomNavChatTab,
        ),
      ],
    );
  }
}
