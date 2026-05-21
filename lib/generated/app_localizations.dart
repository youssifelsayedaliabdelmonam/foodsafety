import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome!'**
  String get welcome;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @forgetPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgetPassword;

  /// No description provided for @signup.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signup;

  /// No description provided for @dontHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account? '**
  String get dontHaveAccount;

  /// No description provided for @accountCreated.
  ///
  /// In en, this message translates to:
  /// **'Account created!'**
  String get accountCreated;

  /// No description provided for @enterEmailFirst.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email first'**
  String get enterEmailFirst;

  /// No description provided for @resetLinkSent.
  ///
  /// In en, this message translates to:
  /// **'Password reset link sent'**
  String get resetLinkSent;

  /// No description provided for @enterEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email'**
  String get enterEmail;

  /// No description provided for @invalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Invalid email'**
  String get invalidEmail;

  /// No description provided for @enterPassword.
  ///
  /// In en, this message translates to:
  /// **'Please enter your password'**
  String get enterPassword;

  /// No description provided for @passwordLength.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters'**
  String get passwordLength;

  /// No description provided for @splashTitle1.
  ///
  /// In en, this message translates to:
  /// **'Welcome!'**
  String get splashTitle1;

  /// No description provided for @splashDesc1.
  ///
  /// In en, this message translates to:
  /// **'Discover a great user experience with FOD Track app'**
  String get splashDesc1;

  /// No description provided for @splashTitle2.
  ///
  /// In en, this message translates to:
  /// **'Beautiful Design'**
  String get splashTitle2;

  /// No description provided for @splashDesc2.
  ///
  /// In en, this message translates to:
  /// **'Enjoy attractive colors and smooth transitions'**
  String get splashDesc2;

  /// No description provided for @splashTitle3.
  ///
  /// In en, this message translates to:
  /// **'Let\'s Get Started!'**
  String get splashTitle3;

  /// No description provided for @splashDesc3.
  ///
  /// In en, this message translates to:
  /// **'Tap the arrow to log in'**
  String get splashDesc3;

  /// No description provided for @homeTitle.
  ///
  /// In en, this message translates to:
  /// **'Nutrition Check'**
  String get homeTitle;

  /// No description provided for @homeWelcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome 👋'**
  String get homeWelcome;

  /// No description provided for @homeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Easily check the safety of food ingredients'**
  String get homeSubtitle;

  /// No description provided for @homeTip.
  ///
  /// In en, this message translates to:
  /// **'Choose an ingredient and enter values to get a detailed analysis'**
  String get homeTip;

  /// No description provided for @categories.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categories;

  /// No description provided for @categoriesCount.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categoriesCount;

  /// No description provided for @ingredients.
  ///
  /// In en, this message translates to:
  /// **'Ingredients'**
  String get ingredients;

  /// No description provided for @itemsCount.
  ///
  /// In en, this message translates to:
  /// **'Items'**
  String get itemsCount;

  /// No description provided for @noIngredients.
  ///
  /// In en, this message translates to:
  /// **'No ingredients in this category'**
  String get noIngredients;

  /// No description provided for @tryAnother.
  ///
  /// In en, this message translates to:
  /// **'Try another category to find more'**
  String get tryAnother;

  /// No description provided for @addIngredient.
  ///
  /// In en, this message translates to:
  /// **'Add Ingredient'**
  String get addIngredient;

  /// No description provided for @catAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get catAll;

  /// No description provided for @catDairy.
  ///
  /// In en, this message translates to:
  /// **'Dairy'**
  String get catDairy;

  /// No description provided for @catMeat.
  ///
  /// In en, this message translates to:
  /// **'Meat'**
  String get catMeat;

  /// No description provided for @catVegetables.
  ///
  /// In en, this message translates to:
  /// **'Vegetables'**
  String get catVegetables;

  /// No description provided for @catFruits.
  ///
  /// In en, this message translates to:
  /// **'Fruits'**
  String get catFruits;

  /// No description provided for @catBeverages.
  ///
  /// In en, this message translates to:
  /// **'Beverages'**
  String get catBeverages;

  /// No description provided for @catGrains.
  ///
  /// In en, this message translates to:
  /// **'Grains'**
  String get catGrains;

  /// No description provided for @enterValueFor.
  ///
  /// In en, this message translates to:
  /// **'Please enter a value for {type}'**
  String enterValueFor(String type);

  /// No description provided for @invalidValueFor.
  ///
  /// In en, this message translates to:
  /// **'Invalid value entered for {type}'**
  String invalidValueFor(String type);

  /// No description provided for @enterNutritionalValues.
  ///
  /// In en, this message translates to:
  /// **'Enter nutritional values to get a detailed analysis'**
  String get enterNutritionalValues;

  /// No description provided for @nutritionalValues.
  ///
  /// In en, this message translates to:
  /// **'Nutritional Values'**
  String get nutritionalValues;

  /// No description provided for @enterMeasuredValues.
  ///
  /// In en, this message translates to:
  /// **'Enter measured values using the appropriate unit'**
  String get enterMeasuredValues;

  /// No description provided for @enterValue.
  ///
  /// In en, this message translates to:
  /// **'Enter value...'**
  String get enterValue;

  /// No description provided for @healthyRange.
  ///
  /// In en, this message translates to:
  /// **'Healthy range: {min} - {max} {unit}'**
  String healthyRange(String min, String max, String unit);

  /// No description provided for @analyzeRatios.
  ///
  /// In en, this message translates to:
  /// **'Analyze Ratios'**
  String get analyzeRatios;

  /// No description provided for @reset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get reset;

  /// No description provided for @healthRatio.
  ///
  /// In en, this message translates to:
  /// **'Health Ratio'**
  String get healthRatio;

  /// No description provided for @healthyStatus.
  ///
  /// In en, this message translates to:
  /// **'Healthy & Safe'**
  String get healthyStatus;

  /// No description provided for @acceptableStatus.
  ///
  /// In en, this message translates to:
  /// **'Acceptable'**
  String get acceptableStatus;

  /// No description provided for @unhealthyStatus.
  ///
  /// In en, this message translates to:
  /// **'Unhealthy'**
  String get unhealthyStatus;

  /// No description provided for @healthyMessage.
  ///
  /// In en, this message translates to:
  /// **'All values are within the recommended healthy range'**
  String get healthyMessage;

  /// No description provided for @acceptableMessage.
  ///
  /// In en, this message translates to:
  /// **'Some values are outside the ideal range'**
  String get acceptableMessage;

  /// No description provided for @unhealthyMessage.
  ///
  /// In en, this message translates to:
  /// **'Requires immediate medical review'**
  String get unhealthyMessage;

  /// No description provided for @healthyStat.
  ///
  /// In en, this message translates to:
  /// **'Healthy'**
  String get healthyStat;

  /// No description provided for @unhealthyStat.
  ///
  /// In en, this message translates to:
  /// **'Unhealthy'**
  String get unhealthyStat;

  /// No description provided for @totalStat.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get totalStat;

  /// No description provided for @resultDetails.
  ///
  /// In en, this message translates to:
  /// **'Result Details'**
  String get resultDetails;

  /// No description provided for @resultSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Inspection results for each nutritional element'**
  String get resultSubtitle;

  /// No description provided for @checkResults.
  ///
  /// In en, this message translates to:
  /// **'Check Results'**
  String get checkResults;

  /// No description provided for @checkAnotherIngredient.
  ///
  /// In en, this message translates to:
  /// **'Check Another Ingredient'**
  String get checkAnotherIngredient;

  /// No description provided for @invalidCredentials.
  ///
  /// In en, this message translates to:
  /// **'Invalid email or password'**
  String get invalidCredentials;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
