import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hire_app/core/l10n/app_localizations.g.dart';
import 'package:hire_app/core/styles/tokens.dart';
import 'package:hire_app/core/utils/routes.dart';

import 'package:hire_app/features/onboarding/domain/cubits/login_cubit.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  final List<AnimationController> _controllers = [];
  final titleRange = Iterable<int>.generate(4).toList();

  @override
  void initState() {
    super.initState();
    _verifyIfUserIsLogged();
    for (final i in titleRange) {
      _controllers.add(
        AnimationController(
          duration: const Duration(seconds: 1),
          vsync: this,
        ),
      );
      Future.delayed(Duration(milliseconds: 100 * i), () {
        _controllers[i].forward();
      });
    }
  }

  Future<void> _verifyIfUserIsLogged() async {
    context.read<LoginCubit>().onLoad();
    await Future.delayed(const Duration(seconds: 2), () {});
    if (mounted) {
      if (context.read<LoginCubit>().state is LoginSuccess) {
        await Navigator.of(context).popAndPushNamed(Routes.home);
      } else {
        await Navigator.of(context).popAndPushNamed(Routes.login);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: titleRange
                  .map(
                    (index) => FadeTransition(
                      opacity: _controllers[index],
                      child: SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(0, -5),
                          end: Offset.zero,
                        ).animate(
                          CurvedAnimation(
                            parent: _controllers[index],
                            curve: Curves.easeInOut,
                          ),
                        ),
                        child: Text(
                          l10n.appTitle.split('')[index],
                          style: TextStyle(
                            fontSize: Tokens.fontSize.ref64,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            Text(l10n.splashPageWelcome),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }
}
