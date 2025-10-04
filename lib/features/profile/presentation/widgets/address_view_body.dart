import 'package:clot/core/routes/app_routes.dart';
import 'package:clot/core/utils/app_colors.dart';
import 'package:clot/core/utils/app_styles.dart';
import 'package:clot/core/widgets/height_and_width.dart';
import 'package:clot/features/checkout/presentation/widgets/loading_address.dart';
import 'package:clot/features/profile/presentation/manager/address_cubit/address_cubit.dart';
import 'package:clot/features/profile/presentation/widgets/address_item.dart';
import 'package:clot/features/profile/presentation/widgets/custom_app_bar.dart';
import 'package:clot/features/profile/presentation/widgets/no_address.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressViewBody extends StatelessWidget {
  const AddressViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          HeightBox(20),
          CustomAppBar(
            title: 'Addresses',
            trailing: GestureDetector(
              onTap: () =>
                  Navigator.pushNamed(context, AppRoutes.addAddressView),
              child: Icon(Icons.add, color: AppColors.white),
            ),
          ),
          HeightBox(20),
          Expanded(
            child: BlocBuilder<AddressCubit, AddressState>(
              builder: (context, state) {
                if (state is AddressLoaded) {
                  if (state.addresses.isEmpty) {
                    return const NoAddress();
                  }
                  return ListView.builder(
                    itemCount: state.addresses.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) =>
                        AddressItem(address: state.addresses[index]),
                  );
                } else if (state is AddressError) {
                  return Center(
                    child: Text(
                      state.message,
                      style: AppStyles.textBold16.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  );
                } else if (state is AddressLoading) {
                  return LoadingAddresses();
                } else {
                  return NoAddress();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
