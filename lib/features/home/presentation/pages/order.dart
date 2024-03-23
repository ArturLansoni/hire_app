import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hire_app/core/l10n/app_localizations.g.dart';
import 'package:hire_app/core/styles/tokens.dart';
import 'package:hire_app/core/utils/extensions/navigator_state_extension.dart';
import 'package:hire_app/core/utils/routes.dart';
import 'package:hire_app/core/widgets/widgets.dart';
import 'package:hire_app/features/home/domain/cubits/order_cubit.dart';
import 'package:hire_app/features/home/domain/entities/company_entity.dart';
import 'package:hire_app/features/home/domain/entities/service_entity.dart';
import 'package:hire_app/features/home/presentation/widgets/order/widgets.dart';

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
  final _formKey = GlobalKey<FormState>();
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
    if (!_formKey.currentState!.validate()) return;

    final services = <ServiceEntity>[];
    for (var i = 0; i < _selectedServices.length; i++) {
      if (_selectedServices[i]) {
        services.add(widget.company.services[i]);
      }
    }
    final date = DateTime(
      _selectedDate!.year,
      _selectedDate!.month,
      _selectedDate!.day,
      _selectedHour!,
    );

    context.read<OrderCubit>().createOrder(
          date: date,
          services: services,
          description: _controller.text,
        );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return BlocConsumer<OrderCubit, OrderState>(
      listener: (context, state) {
        if (state.isSuccess) {
          Navigator.of(context)
            ..pop()
            ..navigate(Routes.schedule);
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
                    child: Form(
                      key: _formKey,
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
                                  color: Tokens.colors.primary,
                                  borderRadius: BorderRadius.circular(
                                    Tokens.radius.normal,
                                  ),
                                ),
                                padding: EdgeInsets.symmetric(
                                  vertical: Tokens.size.ref1,
                                  horizontal: Tokens.size.ref2,
                                ),
                                child: Text(
                                  widget.company.category.toUpperCase(),
                                  style: TextStyle(
                                    color: Tokens.colors.background,
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
                          SizedBox(
                            height: Tokens.size.ref30,
                            child: TextFormField(
                              controller: _controller,
                              maxLines: 3,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                              validator: (value) {
                                if (value?.isEmpty ?? false) {
                                  return l10n.requiredField;
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(height: Tokens.size.ref3),
                          TimeSection(
                            dateValidator: (value) {
                              if (_selectedDate == null) {
                                return l10n.requiredField;
                              }
                              return null;
                            },
                            hourValidator: (value) {
                              if (_selectedHour == null) {
                                return l10n.requiredField;
                              }
                              return null;
                            },
                            onSelectDate: (date) {
                              setState(() => _selectedDate = date);
                            },
                            onSelectHour: (hour) {
                              setState(() => _selectedHour = hour);
                            },
                          ),
                          SizedBox(height: Tokens.size.ref3),
                        ],
                      ),
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
