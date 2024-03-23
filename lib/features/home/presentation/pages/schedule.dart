import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hire_app/core/l10n/app_localizations.g.dart';
import 'package:hire_app/core/styles/tokens.dart';
import 'package:hire_app/core/widgets/bottom_navigation.dart';
import 'package:hire_app/core/widgets/widgets.dart';
import 'package:hire_app/features/home/domain/cubits/order_cubit.dart';
import 'package:hire_app/features/home/presentation/widgets/schedule/schedule_item.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  @override
  void initState() {
    super.initState();
    context.read<OrderCubit>().onLoad();
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
    return BlocConsumer<OrderCubit, OrderState>(
      listener: (context, state) {
        if (state.isError) {
          _showErrorSnackbar(l10n.unknownError);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(l10n.schedulePageTitle),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => context.read<OrderCubit>().onLoad(),
            child: const Icon(Icons.refresh),
          ),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(Tokens.size.ref3),
              child: state.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            child: ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              separatorBuilder: (context, index) =>
                                  SizedBox(height: Tokens.size.ref2),
                              itemBuilder: (context, index) {
                                final order = state.orders?[index];
                                if (order == null) return Container();
                                return ScheduleItem(
                                  services: order.services,
                                  date: order.date,
                                  showDate: index == 0 ||
                                      order.date.day !=
                                          state.orders![index - 1].date.day,
                                  description: order.description,
                                );
                              },
                              itemCount: state.orders?.length ?? 0,
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
          ),
          bottomNavigationBar: const BottomNavigation(),
        );
      },
    );
  }
}
