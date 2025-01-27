import 'package:flutter/material.dart';
import 'package:e_commerce_app/core/utils/constants.dart'; // Import the Constants class

// List of order items
final List<OrderAndMoreItems> orderItems = [
  OrderAndMoreItems(
    icon: Icons.shopping_bag_outlined,
    title: Constants.allMyOrders,
  ),
  OrderAndMoreItems(
    icon: Icons.local_shipping_outlined,
    title: Constants.pendingShipments,
  ),
  OrderAndMoreItems(
    icon: Icons.payment_outlined,
    title: Constants.pendingPayments,
  ),
  OrderAndMoreItems(
    icon: Icons.assignment_turned_in_outlined,
    title: Constants.finishedOrders,
  ),
];

// List of profile actions
final List<OrderAndMoreItems> profileActions = [
  OrderAndMoreItems(
    icon: Icons.person_add,
    title: Constants.inviteFriends,
  ),
  OrderAndMoreItems(
    icon: Icons.support_agent,
    title: Constants.customerSupport,
  ),
  OrderAndMoreItems(
    icon: Icons.star_rate,
    title: Constants.rateOurApp,
  ),
  OrderAndMoreItems(
    icon: Icons.lightbulb_outline,
    title: Constants.makeASuggestion,
  ),
];

// Data structure for order items
class OrderAndMoreItems {
  final IconData icon;
  final String title;

  OrderAndMoreItems({required this.icon, required this.title});
}
