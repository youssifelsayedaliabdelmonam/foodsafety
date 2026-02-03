import 'package:flutter/material.dart';

class Ingredient {
  final String id;
  final String name;
  final String category;
  final String unit;
  final String icon;
  final Color color;
  final List<
    NutritionRule
  >
  rules;

  Ingredient({
    required this.id,
    required this.name,
    required this.category,
    required this.unit,
    required this.icon,
    required this.color,
    required this.rules,
  });
}

class NutritionRule {
  final String type;
  final double minValue;
  final double maxValue;
  final String unit;
  final String recommendation;
  final Color safeColor;
  final Color dangerColor;

  NutritionRule({
    required this.type,
    required this.minValue,
    required this.maxValue,
    required this.unit,
    required this.recommendation,
    required this.safeColor,
    required this.dangerColor,
  });
}
