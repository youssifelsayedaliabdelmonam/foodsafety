// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get welcome => 'Welcome!';

  @override
  String get login => 'Login';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get forgetPassword => 'Forgot Password?';

  @override
  String get signup => 'Sign Up';

  @override
  String get dontHaveAccount => 'Don\'t have an account? ';

  @override
  String get accountCreated => 'Account created!';

  @override
  String get enterEmailFirst => 'Please enter your email first';

  @override
  String get resetLinkSent => 'Password reset link sent';

  @override
  String get enterEmail => 'Please enter your email';

  @override
  String get invalidEmail => 'Invalid email';

  @override
  String get enterPassword => 'Please enter your password';

  @override
  String get passwordLength => 'Password must be at least 6 characters';

  @override
  String get splashTitle1 => 'Welcome!';

  @override
  String get splashDesc1 => 'Discover a great user experience with FOD Track app';

  @override
  String get splashTitle2 => 'Beautiful Design';

  @override
  String get splashDesc2 => 'Enjoy attractive colors and smooth transitions';

  @override
  String get splashTitle3 => 'Let\'s Get Started!';

  @override
  String get splashDesc3 => 'Tap the arrow to log in';

  @override
  String get homeTitle => 'Nutrition Check';

  @override
  String get homeWelcome => 'Welcome 👋';

  @override
  String get homeSubtitle => 'Easily check the safety of food ingredients';

  @override
  String get homeTip => 'Choose an ingredient and enter values to get a detailed analysis';

  @override
  String get categories => 'Categories';

  @override
  String get categoriesCount => 'Categories';

  @override
  String get ingredients => 'Ingredients';

  @override
  String get itemsCount => 'Items';

  @override
  String get noIngredients => 'No ingredients in this category';

  @override
  String get tryAnother => 'Try another category to find more';

  @override
  String get addIngredient => 'Add Ingredient';

  @override
  String get catAll => 'All';

  @override
  String get catDairy => 'Dairy';

  @override
  String get catMeat => 'Meat';

  @override
  String get catVegetables => 'Vegetables';

  @override
  String get catFruits => 'Fruits';

  @override
  String get catBeverages => 'Beverages';

  @override
  String get catGrains => 'Grains';

  @override
  String enterValueFor(String type) {
    return 'Please enter a value for $type';
  }

  @override
  String invalidValueFor(String type) {
    return 'Invalid value entered for $type';
  }

  @override
  String get enterNutritionalValues => 'Enter nutritional values to get a detailed analysis';

  @override
  String get nutritionalValues => 'Nutritional Values';

  @override
  String get enterMeasuredValues => 'Enter measured values using the appropriate unit';

  @override
  String get enterValue => 'Enter value...';

  @override
  String healthyRange(String min, String max, String unit) {
    return 'Healthy range: $min - $max $unit';
  }

  @override
  String get analyzeRatios => 'Analyze Ratios';

  @override
  String get reset => 'Reset';

  @override
  String get healthRatio => 'Health Ratio';

  @override
  String get healthyStatus => 'Healthy & Safe';

  @override
  String get acceptableStatus => 'Acceptable';

  @override
  String get unhealthyStatus => 'Unhealthy';

  @override
  String get healthyMessage => 'All values are within the recommended healthy range';

  @override
  String get acceptableMessage => 'Some values are outside the ideal range';

  @override
  String get unhealthyMessage => 'Requires immediate medical review';

  @override
  String get healthyStat => 'Healthy';

  @override
  String get unhealthyStat => 'Unhealthy';

  @override
  String get totalStat => 'Total';

  @override
  String get resultDetails => 'Result Details';

  @override
  String get resultSubtitle => 'Inspection results for each nutritional element';

  @override
  String get checkResults => 'Check Results';

  @override
  String get checkAnotherIngredient => 'Check Another Ingredient';

  @override
  String get invalidCredentials => 'Invalid email or password';
}
