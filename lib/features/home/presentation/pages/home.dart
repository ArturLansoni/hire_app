import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hire_app/core/l10n/app_localizations.g.dart';
import 'package:hire_app/core/styles/tokens.dart';
import 'package:hire_app/core/utils/routes.dart';
import 'package:hire_app/core/widgets/widgets.dart';
import 'package:hire_app/features/home/domain/cubits/home_cubit.dart';
import 'package:hire_app/features/home/domain/entities/company_entity.dart';
import 'package:hire_app/features/home/presentation/widgets/home/widgets.dart';
import 'package:hire_app/features/onboarding/domain/cubits/auth_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _search = '';

  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().onLoad();
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        InfoSnackBar(message: message),
      );
  }

  void _showErrorSnackbar(String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        ErrorSnackBar(message: message),
      );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state.isError) {
          _showErrorSnackbar(l10n.unknownError);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(l10n.homePageTitle),
            actions: [
              IconButton(
                onPressed: () {
                  context.read<AuthCubit>().signOut();
                  Navigator.of(context).popAndPushNamed(Routes.login);
                },
                icon: const Icon(Icons.logout),
              ),
            ],
          ),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Tokens.size.ref3),
              child: ListView(
                children: [
                  SearchSection(
                    value: _search,
                    onChange: (value) {
                      setState(() {
                        _search = value;
                      });
                    },
                  ),
                  SizedBox(height: Tokens.size.ref3),
                  AvailableCompaniesSection(
                    isLoading: state.isLoading,
                    companies: state.companies,
                    filter: _search,
                    onTap: (CompanyEntity company) {
                      Navigator.of(context).pushNamed(
                        Routes.order,
                        arguments: {'company': company},
                      );
                    },
                  ),
                  SizedBox(height: Tokens.size.ref3),
                  CategoriesSection(
                    onTap: () => _showSnackbar(l10n.unavailableFeature),
                  ),
                  SizedBox(height: Tokens.size.ref3),
                  PromotionsSection(
                    onTap: () => _showSnackbar(l10n.unavailableFeature),
                  ),
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
      },
    );
  }
}
