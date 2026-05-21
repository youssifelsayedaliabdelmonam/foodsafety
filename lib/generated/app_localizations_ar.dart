// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get welcome => 'أهلاً!';

  @override
  String get login => 'تسجيل الدخول';

  @override
  String get email => 'البريد الإلكتروني';

  @override
  String get password => 'كلمة المرور';

  @override
  String get forgetPassword => 'نسيت كلمة المرور؟';

  @override
  String get signup => 'إنشاء حساب';

  @override
  String get dontHaveAccount => 'ليس لديك حساب؟ ';

  @override
  String get accountCreated => 'تم إنشاء الحساب!';

  @override
  String get enterEmailFirst => 'من فضلك أدخل بريدك الإلكتروني أولاً';

  @override
  String get resetLinkSent => 'تم إرسال رابط إعادة تعيين كلمة المرور';

  @override
  String get enterEmail => 'من فضلك أدخل بريدك الإلكتروني';

  @override
  String get invalidEmail => 'بريد إلكتروني غير صحيح';

  @override
  String get enterPassword => 'من فضلك أدخل كلمة المرور';

  @override
  String get passwordLength => 'كلمة المرور لازم تكون 6 أحرف على الأقل';

  @override
  String get splashTitle1 => 'أهلاً بك!';

  @override
  String get splashDesc1 => 'اكتشف تجربة مستخدم رائعة مع تطبيق FOD Track';

  @override
  String get splashTitle2 => 'تصميم جميل';

  @override
  String get splashDesc2 => 'استمتع بالألوان الجذابة والانتقالات السلسة';

  @override
  String get splashTitle3 => 'هيا نبدأ!';

  @override
  String get splashDesc3 => 'اضغط على السهم لتسجيل الدخول';

  @override
  String get homeTitle => 'فحص التغذية';

  @override
  String get homeWelcome => 'مرحباً بك 👋';

  @override
  String get homeSubtitle => 'افحص سلامة المكونات الغذائية بسهولة';

  @override
  String get homeTip => 'اختر مكوناً وأدخل القيم للحصول على تحليل مفصل';

  @override
  String get categories => 'التصنيفات';

  @override
  String get categoriesCount => 'فئات';

  @override
  String get ingredients => 'المكونات الغذائية';

  @override
  String get itemsCount => 'عنصر';

  @override
  String get noIngredients => 'لا توجد مكونات في هذا التصنيف';

  @override
  String get tryAnother => 'جرب تصنيفاً آخر للعثور على المزيد';

  @override
  String get addIngredient => 'إضافة مكون';

  @override
  String get catAll => 'الكل';

  @override
  String get catDairy => 'الألبان';

  @override
  String get catMeat => 'اللحوم';

  @override
  String get catVegetables => 'الخضروات';

  @override
  String get catFruits => 'الفواكه';

  @override
  String get catBeverages => 'المشروبات';

  @override
  String get catGrains => 'الحبوب';

  @override
  String enterValueFor(String type) {
    return 'يرجى إدخال قيمة لـ $type';
  }

  @override
  String invalidValueFor(String type) {
    return 'القيمة المدخلة لـ $type غير صالحة';
  }

  @override
  String get enterNutritionalValues => 'أدخل القيم الغذائية للحصول على تحليل مفصل';

  @override
  String get nutritionalValues => 'القيم الغذائية';

  @override
  String get enterMeasuredValues => 'أدخل القيم المقاسة بالمقياس المناسب';

  @override
  String get enterValue => 'أدخل القيمة...';

  @override
  String healthyRange(String min, String max, String unit) {
    return 'النطاق الصحي: $min - $max $unit';
  }

  @override
  String get analyzeRatios => 'تحليل النسب';

  @override
  String get reset => 'إعادة تعيين';

  @override
  String get healthRatio => 'نسبة الصحة';

  @override
  String get healthyStatus => 'صحي وآمن';

  @override
  String get acceptableStatus => 'مقبول';

  @override
  String get unhealthyStatus => 'غير صحي';

  @override
  String get healthyMessage => 'جميع النسب ضمن المدى الصحي الموصى به';

  @override
  String get acceptableMessage => 'بعض النسب خارج المدى المثالي';

  @override
  String get unhealthyMessage => 'يحتاج لمراجعة طبية فورية';

  @override
  String get healthyStat => 'صحي';

  @override
  String get unhealthyStat => 'غير صحي';

  @override
  String get totalStat => 'إجمالي';

  @override
  String get resultDetails => 'تفاصيل النتائج';

  @override
  String get resultSubtitle => 'نتائج فحص كل عنصر غذائي على حدة';

  @override
  String get checkResults => 'نتائج الفحص';

  @override
  String get checkAnotherIngredient => 'فحص مكون آخر';

  @override
  String get invalidCredentials => 'الإيميل أو كلمة المرور غلط';
}
