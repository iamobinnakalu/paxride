
import 'package:flutter/cupertino.dart';

class NotificationModel {
  final String description;
  final String icons;
  bool isHighlighted = false;

  NotificationModel({
    required this.description,
    required this.icons,
    required this.isHighlighted,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
        description: json['description'] ?? '',
        icons: json['icons'] ?? '',
        isHighlighted: json['isHighlighted'] ?? false,
    );
  }
}