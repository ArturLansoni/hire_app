import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hire_app/core/l10n/app_localizations.g.dart';
import 'package:hire_app/core/styles/tokens.dart';
import 'package:hire_app/core/widgets/avatar.dart';
import 'package:hire_app/features/home/domain/cubits/order_cubit.dart';
import 'package:hire_app/features/home/domain/entities/company_entity.dart';
import 'package:hire_app/features/home/presentation/widgets/order/widgets.dart';
import 'package:hire_app/features/onboarding/presentation/widgets/button.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({
    required this.company,
    super.key,
  });

  final CompanyEntity company;

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final _controller = TextEditingController();
  late List<bool> _selectedServices;
  DateTime? _selectedDate;
  int? _selectedHour;

  @override
  void initState() {
    super.initState();
    _selectedServices =
        List<bool>.generate(widget.company.services.length, (i) => false);
  }

  void _onSubmit() {
    final serviceIds = <String>[];
    for (var i = 0; i < _selectedServices.length; i++) {
      if (_selectedServices[i]) {
        serviceIds.add(widget.company.services[i].id);
      }
    }
    final date = DateTime(
      _selectedDate!.year,
      _selectedDate!.month,
      _selectedDate!.day,
      _selectedHour!,
    );

    debugPrint('''
 $date
 ${_controller.text} 
 $serviceIds 
 ''');
    context.read<OrderCubit>().createOrder(
          date: date,
          serviceIds: serviceIds,
          description: _controller.text,
        );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return BlocConsumer<OrderCubit, OrderState>(
      listener: (context, state) {
        if (state.isSuccess) {
          Navigator.of(context).pop();
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text(widget.company.name)),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Tokens.size.ref3),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Avatar(
                              name: widget.company.name,
                              imageURL: widget.company.imageURL,
                              size: Tokens.size.ref9,
                            ),
                            SizedBox(width: Tokens.size.ref2),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(widget.company.location),
                                Row(
                                  children: [
                                    const Icon(Icons.star),
                                    SizedBox(width: Tokens.size.ref1),
                                    Text(widget.company.rating.toString()),
                                  ],
                                ),
                              ],
                            ),
                            const Spacer(),
                            Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primary,
                                borderRadius:
                                    BorderRadius.circular(Tokens.radius.normal),
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical: Tokens.size.ref1,
                                horizontal: Tokens.size.ref2,
                              ),
                              child: Text(
                                widget.company.category.toUpperCase(),
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: Tokens.size.ref3),
                        Text(l10n.orderPageAvailableServices),
                        SizedBox(height: Tokens.size.ref2),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          separatorBuilder: (context, index) =>
                              SizedBox(height: Tokens.size.ref2),
                          itemBuilder: (context, index) {
                            final service = widget.company.services[index];
                            return ServiceItem(
                              name: service.name,
                              initialRange: service.initialRange,
                              finalRange: service.finalRange,
                              imagesURL: service.imagesURL,
                              onTap: () {
                                setState(
                                  () => _selectedServices[index] =
                                      !_selectedServices[index],
                                );
                              },
                              isSelected: _selectedServices[index],
                            );
                          },
                          itemCount: widget.company.services.length,
                        ),
                        SizedBox(height: Tokens.size.ref3),
                        Text(l10n.orderPageDescribe),
                        SizedBox(height: Tokens.size.ref2),
                        TextField(
                          controller: _controller,
                          maxLines: 3,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: Tokens.size.ref3),
                        TimeSection(
                          onSelectDate: (DateTime? date) {
                            setState(() => _selectedDate = date);
                          },
                          onSelectHour: (int? hour) {
                            setState(() => _selectedHour = hour);
                          },
                        ),
                        SizedBox(height: Tokens.size.ref3),
                      ],
                    ),
                  ),
                  SliverFillRemaining(
                    hasScrollBody: false,
                    fillOverscroll: true,
                    child: Column(
                      children: [
                        const Spacer(),
                        Button(
                          label: l10n.orderPageSubmitButton,
                          isLoading: state.isLoading,
                          onPressed: _onSubmit,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
