import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hire_app/core/l10n/app_localizations.g.dart';
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
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: ListView(
            children: const [
              SearchSection(),
              SizedBox(height: 12),
              CategoriesSection(),
              SizedBox(height: 12),
              PromotionsSection(),
              SizedBox(height: 12),
              LastOrdersSection(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).colorScheme.primary,
        // fixedColor: Colors.black,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black38,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.crisis_alert), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.event), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.forum), label: 'Home'),
        ],
      ),
    );
  }
}
