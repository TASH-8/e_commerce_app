import 'package:flutter/material.dart';
import 'package:e_commerce_app/core/utils/constants.dart'; // Import the Constants class

// List of order items
final List<OrderItem> orderItems = [
  OrderItem(
    icon: Icons.shopping_bag_outlined,
    title: Constants.allMyOrders,
  ),
  OrderItem(
    icon: Icons.local_shipping_outlined,
    title: Constants.pendingShipments,
  ),
  OrderItem(
    icon: Icons.payment_outlined,
    title: Constants.pendingPayments,
  ),
  OrderItem(
    icon: Icons.assignment_turned_in_outlined,
    title: Constants.finishedOrders,
  ),
];

// List of profile actions
final List<OrderItem> profileActions = [
  OrderItem(
    icon: Icons.person_add,
    title: Constants.inviteFriends,
  ),
  OrderItem(
    icon: Icons.support_agent,
    title: Constants.customerSupport,
  ),
  OrderItem(
    icon: Icons.star_rate,
    title: Constants.rateOurApp,
  ),
  OrderItem(
    icon: Icons.lightbulb_outline,
    title: Constants.makeASuggestion,
  ),
];

// Data structure for order items
class OrderItem {
  final IconData icon;
  final String title;

  OrderItem({required this.icon, required this.title});
}
