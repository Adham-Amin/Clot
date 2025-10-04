import 'cart_item.dart';
import 'shipping_address.dart';

class CashResponse {
  num? taxPrice;
  num? shippingPrice;
  num? totalOrderPrice;
  String? paymentMethodType;
  bool? isPaid;
  bool? isDelivered;
  String? id;
  String? user;
  List<CartItemModel>? cartItems;
  ShippingAddress? shippingAddress;
  DateTime? createdAt;
  DateTime? updatedAt;
  num? orderId;
  num? v;

  CashResponse({
    this.taxPrice,
    this.shippingPrice,
    this.totalOrderPrice,
    this.paymentMethodType,
    this.isPaid,
    this.isDelivered,
    this.id,
    this.user,
    this.cartItems,
    this.shippingAddress,
    this.createdAt,
    this.updatedAt,
    this.orderId,
    this.v,
  });

  factory CashResponse.fromJson(Map<String, dynamic> json) => CashResponse(
    taxPrice: json['taxPrice'] as num?,
    shippingPrice: json['shippingPrice'] as num?,
    totalOrderPrice: json['totalOrderPrice'] as num?,
    paymentMethodType: json['paymentMethodType'] as String?,
    isPaid: json['isPaid'] as bool?,
    isDelivered: json['isDelivered'] as bool?,
    id: json['_id'] as String?,
    user: json['user'] as String?,
    cartItems: (json['cartItems'] as List<dynamic>?)
        ?.map((e) => CartItemModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    shippingAddress: json['shippingAddress'] == null
        ? null
        : ShippingAddress.fromJson(
            json['shippingAddress'] as Map<String, dynamic>,
          ),
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
    orderId: json['id'] as num?,
    v: json['__v'] as num?,
  );

  Map<String, dynamic> toJson() => {
    'taxPrice': taxPrice,
    'shippingPrice': shippingPrice,
    'totalOrderPrice': totalOrderPrice,
    'paymentMethodType': paymentMethodType,
    'isPaid': isPaid,
    'isDelivered': isDelivered,
    '_id': id,
    'user': user,
    'cartItems': cartItems?.map((e) => e.toJson()).toList(),
    'shippingAddress': shippingAddress?.toJson(),
    'createdAt': createdAt?.toIso8601String(),
    'updatedAt': updatedAt?.toIso8601String(),
    'id': orderId,
    '__v': v,
  };
}
