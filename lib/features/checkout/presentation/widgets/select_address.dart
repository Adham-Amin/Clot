import 'package:clot/core/widgets/height_and_width.dart';
import 'package:clot/features/checkout/presentation/widgets/button_cash_lisaner.dart';
import 'package:clot/features/checkout/presentation/widgets/button_visa_lisaner.dart';
import 'package:clot/features/profile/data/models/responses/address_response.dart';
import 'package:clot/features/profile/presentation/widgets/address_item.dart';
import 'package:flutter/material.dart';

class SelectAddress extends StatefulWidget {
  const SelectAddress({
    super.key,
    required this.cartId,
    required this.addresses,
  });

  final String cartId;
  final List<AddressResponse> addresses;

  @override
  State<SelectAddress> createState() => _SelectAddressState();
}

class _SelectAddressState extends State<SelectAddress> {
  String details = '';
  String phone = '';
  String city = '';

  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: widget.addresses.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => GestureDetector(
              onTap: () => setState(() {
                selectedIndex = index;
                details = widget.addresses[index].details ?? '';
                phone = widget.addresses[index].phone ?? '';
                city = widget.addresses[index].city ?? '';
              }),
              child: AddressItem(
                isSelected: selectedIndex == index,
                address: widget.addresses[index],
                isOrder: true,
              ),
            ),
          ),
        ),
        HeightBox(32),
        Row(
          children: [
            Expanded(
              child: ButtonCashLisaner(
                city: city,
                details: details,
                phone: phone,
                widget: widget,
              ),
            ),
          ],
        ),
        HeightBox(16),
        Row(
          children: [
            Expanded(
              child: ButtonVisaLisaner(
                city: city,
                details: details,
                phone: phone,
                widget: widget,
              ),
            ),
          ],
        ),
        HeightBox(16),
      ],
    );
  }
}
