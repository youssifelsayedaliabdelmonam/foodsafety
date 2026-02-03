import 'package:flutter/material.dart';
import '../models/ingredient.dart';

class IngredientsData {
  static List<
    Ingredient
  >
  get ingredients => [
    // منتجات الألبان
    Ingredient(
      id:
          '1',
      name:
          'اللبن',
      category:
          'الألبان',
      unit:
          'ملليتر',
      icon:
          '🥛',
      color: Color(
        0xFF4299E1,
      ),
      rules: [
        NutritionRule(
          type:
              'الدهون',
          minValue:
              0,
          maxValue:
              3.5,
          unit:
              'جرام/100مل',
          recommendation:
              'نسبة الدهون يجب أن تكون بين 0-3.5 جرام لكل 100 مل',
          safeColor: Color(
            0xFF48BB78,
          ),
          dangerColor: Color(
            0xFFF56565,
          ),
        ),
        NutritionRule(
          type:
              'البروتين',
          minValue:
              3.0,
          maxValue:
              4.5,
          unit:
              'جرام/100مل',
          recommendation:
              'نسبة البروتين المثالية 3-4.5 جرام لكل 100 مل',
          safeColor: Color(
            0xFF48BB78,
          ),
          dangerColor: Color(
            0xFFF56565,
          ),
        ),
        NutritionRule(
          type:
              'اللاكتوز',
          minValue:
              4.0,
          maxValue:
              5.0,
          unit:
              'جرام/100مل',
          recommendation:
              'نسبة اللاكتوز الطبيعية 4-5 جرام لكل 100 مل',
          safeColor: Color(
            0xFF48BB78,
          ),
          dangerColor: Color(
            0xFFF56565,
          ),
        ),
      ],
    ),

    // اللحوم
    Ingredient(
      id:
          '2',
      name:
          'اللحم البقري',
      category:
          'اللحوم',
      unit:
          'جرام',
      icon:
          '🥩',
      color: Color(
        0xFFF56565,
      ),
      rules: [
        NutritionRule(
          type:
              'الدهون المشبعة',
          minValue:
              0,
          maxValue:
              5.0,
          unit:
              'جرام/100جرام',
          recommendation:
              'الحد الأقصى للدهون المشبعة 5 جرام لكل 100 جرام',
          safeColor: Color(
            0xFF48BB78,
          ),
          dangerColor: Color(
            0xFFF56565,
          ),
        ),
        NutritionRule(
          type:
              'الكوليسترول',
          minValue:
              0,
          maxValue:
              85,
          unit:
              'ملليجرام/100جرام',
          recommendation:
              'الكوليسترول يجب أن يكون أقل من 85 ملليجرام',
          safeColor: Color(
            0xFF48BB78,
          ),
          dangerColor: Color(
            0xFFF56565,
          ),
        ),
      ],
    ),

    // الخضروات
    Ingredient(
      id:
          '3',
      name:
          'الطماطم',
      category:
          'الخضروات',
      unit:
          'جرام',
      icon:
          '🍅',
      color: Color(
        0xFFED8936,
      ),
      rules: [
        NutritionRule(
          type:
              'الصوديوم',
          minValue:
              0,
          maxValue:
              5,
          unit:
              'ملليجرام/100جرام',
          recommendation:
              'الصوديوم الطبيعي في الطماطم أقل من 5 ملليجرام',
          safeColor: Color(
            0xFF48BB78,
          ),
          dangerColor: Color(
            0xFFF56565,
          ),
        ),
        NutritionRule(
          type:
              'السكريات',
          minValue:
              2.5,
          maxValue:
              3.5,
          unit:
              'جرام/100جرام',
          recommendation:
              'السكريات الطبيعية 2.5-3.5 جرام لكل 100 جرام',
          safeColor: Color(
            0xFF48BB78,
          ),
          dangerColor: Color(
            0xFFF56565,
          ),
        ),
      ],
    ),

    // الفواكه
    Ingredient(
      id:
          '4',
      name:
          'الموز',
      category:
          'الفواكه',
      unit:
          'جرام',
      icon:
          '🍌',
      color: Color(
        0xFFECC94B,
      ),
      rules: [
        NutritionRule(
          type:
              'البوتاسيوم',
          minValue:
              350,
          maxValue:
              400,
          unit:
              'ملليجرام/100جرام',
          recommendation:
              'البوتاسيوم الطبيعي 350-400 ملليجرام لكل 100 جرام',
          safeColor: Color(
            0xFF48BB78,
          ),
          dangerColor: Color(
            0xFFF56565,
          ),
        ),
        NutritionRule(
          type:
              'السكريات',
          minValue:
              12,
          maxValue:
              15,
          unit:
              'جرام/100جرام',
          recommendation:
              'السكريات الطبيعية 12-15 جرام لكل 100 جرام',
          safeColor: Color(
            0xFF48BB78,
          ),
          dangerColor: Color(
            0xFFF56565,
          ),
        ),
      ],
    ),

    // المشروبات
    Ingredient(
      id:
          '5',
      name:
          'عصير البرتقال',
      category:
          'المشروبات',
      unit:
          'ملليتر',
      icon:
          '🧃',
      color: Color(
        0xFFED8936,
      ),
      rules: [
        NutritionRule(
          type:
              'فيتامين C',
          minValue:
              40,
          maxValue:
              60,
          unit:
              'ملليجرام/100مل',
          recommendation:
              'فيتامين C الطبيعي 40-60 ملليجرام لكل 100 مل',
          safeColor: Color(
            0xFF48BB78,
          ),
          dangerColor: Color(
            0xFFF56565,
          ),
        ),
        NutritionRule(
          type:
              'السكريات المضافة',
          minValue:
              0,
          maxValue:
              0,
          unit:
              'جرام/100مل',
          recommendation:
              'لا يجب إضافة سكريات للعصير الطبيعي',
          safeColor: Color(
            0xFF48BB78,
          ),
          dangerColor: Color(
            0xFFF56565,
          ),
        ),
      ],
    ),

    // الحبوب
    Ingredient(
      id:
          '6',
      name:
          'الأرز',
      category:
          'الحبوب',
      unit:
          'جرام',
      icon:
          '🍚',
      color: Color(
        0xFF9F7AEA,
      ),
      rules: [
        NutritionRule(
          type:
              'الكربوهيدرات',
          minValue:
              75,
          maxValue:
              80,
          unit:
              'جرام/100جرام',
          recommendation:
              'الكربوهيدرات الطبيعية 75-80 جرام لكل 100 جرام',
          safeColor: Color(
            0xFF48BB78,
          ),
          dangerColor: Color(
            0xFFF56565,
          ),
        ),
        NutritionRule(
          type:
              'الألياف',
          minValue:
              1.0,
          maxValue:
              2.0,
          unit:
              'جرام/100جرام',
          recommendation:
              'الألياف الغذائية 1-2 جرام لكل 100 جرام',
          safeColor: Color(
            0xFF48BB78,
          ),
          dangerColor: Color(
            0xFFF56565,
          ),
        ),
      ],
    ),
  ];
}
