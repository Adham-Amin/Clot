import 'package:clot/core/routes/app_routes.dart';
import 'package:clot/features/auth/presentation/views/forget_password_view.dart';
import 'package:clot/features/auth/presentation/views/login_view.dart';
import 'package:clot/features/auth/presentation/views/register_view.dart';
import 'package:clot/features/auth/presentation/views/reset_password_view.dart';
import 'package:clot/features/auth/presentation/views/verify_code_view.dart';
import 'package:clot/features/brands/presentation/views/brands_view.dart';
import 'package:clot/features/brands/presentation/views/products_brand_view.dart';
import 'package:clot/features/categories/domain/entities/category_entity.dart';
import 'package:clot/features/categories/presentation/views/categories_view.dart';
import 'package:clot/features/categories/presentation/views/products_category_view.dart';
import 'package:clot/features/home/domain/entities/product_entity.dart';
import 'package:clot/features/home/presentation/views/products_view.dart';
import 'package:clot/features/orders/domain/entities/orders_entity.dart';
import 'package:clot/features/orders/presentation/views/order_details_view.dart';
import 'package:clot/features/product_details/presentation/views/product_details_view.dart';
import 'package:clot/features/profile/presentation/views/add_addresse_view.dart';
import 'package:clot/features/profile/presentation/views/addresse_view.dart';
import 'package:clot/features/profile/presentation/views/change_password_view.dart';
import 'package:clot/features/profile/presentation/views/update_information_view.dart';
import 'package:clot/features/main/main_view.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.loginView:
      return MaterialPageRoute(builder: (_) => const LoginView());
    case AppRoutes.registerView:
      return MaterialPageRoute(builder: (_) => const RegisterView());
    case AppRoutes.forgetPasswordView:
      return MaterialPageRoute(builder: (_) => const ForgetPasswordView());
    case AppRoutes.addAddressView:
      return MaterialPageRoute(builder: (_) => const AddAddresseView());
    case AppRoutes.addressView:
      return MaterialPageRoute(builder: (_) => const AddresseView());
    case AppRoutes.verifyCodeView:
      return MaterialPageRoute(builder: (_) => const VerifyCodeView());
    case AppRoutes.resetPasswordView:
      return MaterialPageRoute(builder: (_) => const ResetPasswordView());
    case AppRoutes.changePasswordView:
      return MaterialPageRoute(builder: (_) => const ChangePasswordView());
    case AppRoutes.productsView:
      return MaterialPageRoute(
        builder: (_) =>
            ProductsView(products: settings.arguments as List<ProductEntity>),
      );
    case AppRoutes.orderDetailsView:
      return MaterialPageRoute(
        builder: (_) =>
            OrderDetailsView(order: settings.arguments as OrdersEntity),
      );
    case AppRoutes.mainView:
      return MaterialPageRoute(builder: (_) => const MainView());
    case AppRoutes.updateInfoView:
      return MaterialPageRoute(builder: (_) => const UpdateInformationView());
    case AppRoutes.categoriesView:
      return MaterialPageRoute(
        builder: (_) => CategoriesView(
          categories: settings.arguments as List<CategoryEntity>,
        ),
      );
    case AppRoutes.productDetailsView:
      return MaterialPageRoute(
        builder: (_) =>
            ProductDetailsView(product: settings.arguments as ProductEntity),
      );
    case AppRoutes.productsBrandsView:
      return MaterialPageRoute(
        builder: (_) =>
            ProductsBrandView(brand: settings.arguments as CategoryEntity),
      );
    case AppRoutes.productsCategoriesView:
      return MaterialPageRoute(
        builder: (_) => ProductsCategoryView(
          category: settings.arguments as CategoryEntity,
        ),
      );
    case AppRoutes.brandsView:
      return MaterialPageRoute(
        builder: (_) =>
            BrandsView(brands: settings.arguments as List<CategoryEntity>),
      );
    default:
      return MaterialPageRoute(builder: (_) => const Scaffold());
  }
}
