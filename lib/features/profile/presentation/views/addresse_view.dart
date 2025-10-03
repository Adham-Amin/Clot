import 'package:clot/features/profile/presentation/widgets/address_view_body.dart';
import 'package:flutter/material.dart';

class AddresseView extends StatelessWidget {
  const AddresseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: AddressViewBody()));
  }
}
