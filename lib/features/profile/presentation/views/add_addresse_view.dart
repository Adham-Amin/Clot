import 'package:clot/features/profile/presentation/widgets/add_address_view_body.dart';
import 'package:flutter/material.dart';

class AddAddresseView extends StatelessWidget {
  const AddAddresseView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: AddAddressViewBody()));
  }
}
