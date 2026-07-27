import 'package:flutter/material.dart';

class Evidence {
  final String title;
  final String description;
  final IconData icon;

  const Evidence({
    required this.title,
    required this.description,
    required this.icon,
  });

  Map<String, dynamic> toMap() {
    return {"title": title, "description": description, "icon": icon.codePoint};
  }

  factory Evidence.fromMap(Map<String, dynamic> map) {
    return Evidence(
      title: map["title"] ?? "",
      description: map["description"] ?? "",
      icon: IconData(
        map["icon"] ?? Icons.help.codePoint,
        fontFamily: 'MaterialIcons',
      ),
    );
  }
}
