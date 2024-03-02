import 'package:flutter/material.dart';
import 'package:hire_app/core/l10n/app_localizations.g.dart';
import 'package:hire_app/core/styles/tokens.dart';
import 'package:hire_app/features/home/presentation/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.homePageTitle),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.person)),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Tokens.size.ref3),
          child: ListView(
            children: [
              const SearchSection(),
              SizedBox(height: Tokens.size.ref3),
              const CategoriesSection(),
              SizedBox(height: Tokens.size.ref3),
              const PromotionsSection(),
              SizedBox(height: Tokens.size.ref3),
              const LastOrdersSection(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context)
            .colorScheme
            .primary
            .withOpacity(Tokens.opacity.ref40),
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: l10n.bottomNavHomeTab,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.crisis_alert),
            label: l10n.bottomNavUrgentTab,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.event),
            label: l10n.bottomNavScheduleTab,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.forum),
            label: l10n.bottomNavChatTab,
          ),
        ],
      ),
    );
  }
}
