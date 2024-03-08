import 'package:flutter/material.dart';
import 'package:hire_app/core/l10n/app_localizations.g.dart';
import 'package:hire_app/core/styles/tokens.dart';
import 'package:hire_app/core/widgets/avatar.dart';
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
  late List<bool> _selectedServices;

  @override
  void initState() {
    super.initState();
    _selectedServices =
        List<bool>.generate(widget.company.services.length, (i) => false);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
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
                            setState(() {
                              _selectedServices[index] =
                                  !_selectedServices[index];
                            });
                          },
                          isSelected: _selectedServices[index],
                        );
                      },
                      itemCount: widget.company.services.length,
                    ),
                    SizedBox(height: Tokens.size.ref3),
                    Text(l10n.orderPageDescribe),
                    SizedBox(height: Tokens.size.ref2),
                    const TextField(
                      maxLines: 3,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: Tokens.size.ref3),
                    TimeSection(
                      onSelectDate: (DateTime date) {},
                      onSelectHour: (int hour) {},
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
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
