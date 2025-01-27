import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:e_commerce_app/features/profile/presentation/widgets/order_profile_items.dart';
import 'package:flutter/material.dart';

List<OrderAndMoreItems> moreItems1 = [
  OrderAndMoreItems(
    icon: Icons.location_on,
    title: Constants.shippingAddressTitle,
  ),
  OrderAndMoreItems(
    icon: Icons.credit_card,
    title: Constants.paymentMethodTitle,
  ),
  OrderAndMoreItems(
    icon: Icons.account_balance_wallet,
    title: Constants.currencyTitle,
  ),
  OrderAndMoreItems(
    icon: Icons.language,
    title: Constants.languageTitle,
  ),
];

List<OrderAndMoreItems> moreItems2 = [
  OrderAndMoreItems(
    icon: Icons.notifications,
    title: Constants.notificationSettingsTitle,
  ),
  OrderAndMoreItems(
    icon: Icons.shield,
    title: Constants.privacyPolicyTitle,
  ),
  OrderAndMoreItems(
    icon: Icons.help_outline,
    title: Constants.faqTitle,
  ),
  OrderAndMoreItems(
    icon: Icons.description,
    title: Constants.legalInformationTitle,
  ),
];
