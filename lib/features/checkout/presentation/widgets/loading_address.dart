import 'package:clot/features/profile/data/models/responses/address_response.dart';
import 'package:clot/features/profile/presentation/widgets/address_item.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LoadingAddresses extends StatelessWidget {
  const LoadingAddresses({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: ListView.builder(
        itemCount: 2,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {},
          child: AddressItem(
            address: AddressResponse(
              id: '   ',
              city: '     ',
              details: '    ',
              name: '    ',
              phone: '   ',
            ),
            isOrder: true,
          ),
        ),
      ),
    );
  }
}
