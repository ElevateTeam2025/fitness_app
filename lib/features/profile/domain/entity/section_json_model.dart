import 'dart:convert';
import 'package:flutter/services.dart';

class Section {
  final String section;
  final Map<String, dynamic>? title;
  final Map<String, dynamic> content;
  final Map<String, dynamic> style;

  Section({
    required this.section,
    this.title,
    required this.content,
    required this.style,
  });

  factory Section.fromJson(Map<String, dynamic> json) {
    return Section(
      section: json['section'] as String,
      title: json['title'] != null ? Map<String, dynamic>.from(json['title']) : null,
      content: Map<String, dynamic>.from(json['content']),
      style: Map<String, dynamic>.from(
        json['style'] is Map<String, dynamic> ? json['style'] : json['style']['content'],
      ),
    );
  }

  static Future<List<Section>> load(String assetPath, String rootKey) async {
    final rawData = await rootBundle.loadString(assetPath);
    final jsonData = json.decode(rawData) as Map<String, dynamic>;
    final list = jsonData[rootKey] as List;
    return list.map((e) => Section.fromJson(e as Map<String, dynamic>)).toList();
  }
}
