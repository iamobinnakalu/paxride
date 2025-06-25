import 'package:flutter/material.dart';
import 'package:paxride/features/home/notification/notification_model.dart';

class NotificationController {
  List<NotificationModel> notifications = [
    NotificationModel(
        description: 'Your driver is waiting. You have 3\n minutes left.',
        icons: 'location',
        isHighlighted: true,
    ),
    NotificationModel(
        description: 'Your card has expired. Please update\n your payment method.',
        icons: 'credit_card',
        isHighlighted: false,
    ),
    NotificationModel(
      description: "Don't forget your upcoming scheduled\n ride at 8:00 AM.",
      icons: 'notification',
      isHighlighted: true,
    ),
    NotificationModel(
      description: "Thank you for riding with us 10 times\n this month-you're awesome!.",
      icons: 'favourite',
      isHighlighted: true,
    ),
    NotificationModel(
      description: "Trip paused-Your driver is waiting at\n the pickup spot.",
      icons: 'car',
      isHighlighted: true,
    ),
    NotificationModel(
      description: "New fare breakdown available. Tap to\n view details.",
      icons: 'credit_card',
      isHighlighted: false,
    ),
    NotificationModel(
      description: "You've completed 5 rides this week -\n claim your badge!.",
      icons: 'badge',
      isHighlighted: false,
    ),
    NotificationModel(
      description: "Help us improve - take a minute\n feedback survey.",
      icons: 'credit_card',
      isHighlighted: true,
    ),
    NotificationModel(
      description: "Your driver is waiting. You have 3\n minutes left.",
      icons: 'location',
      isHighlighted: false,
    ),
  ];

  IconData getIconData(String icons) {
    // This method can be used to convert icon paths to IconData if needed.
    // Currently, it returns null as we are not using IconData in this example.
    switch (icons) {
      case 'location':
        return Icons.place;
      case 'credit_card':
        return Icons.credit_card;
      case 'notification':
        return Icons.notifications;
      case 'favourite':
        return Icons.favorite;
      case 'car':
        return Icons.directions_car;
      case 'credit_card':
        return Icons.credit_card;
      case 'badge':
        return Icons.badge;
      case 'credit_card_outlined':
        return Icons.credit_card_outlined;
      default:
        return Icons.location_city;
    }
  }
}