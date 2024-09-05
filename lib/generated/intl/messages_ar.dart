// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ar locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ar';

  static String m0(comparePrice) => "${comparePrice} ج.م";

  static String m1(errorMessage) =>
      "حدث خطأ أثناء تحميل الملف الشخصي: ${errorMessage}";

  static String m2(price) => "${price} ج.م";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "addNow": MessageLookupByLibrary.simpleMessage("أضف الآن"),
        "addToCart": MessageLookupByLibrary.simpleMessage("إضافة"),
        "addToFavorites":
            MessageLookupByLibrary.simpleMessage("أضف إلى المفضلة"),
        "allCategories": MessageLookupByLibrary.simpleMessage("جميع الفئات"),
        "alreadyHaveAccount":
            MessageLookupByLibrary.simpleMessage("هل لديك حساب بالفعل؟"),
        "arabic": MessageLookupByLibrary.simpleMessage("العربية"),
        "bestSellers": MessageLookupByLibrary.simpleMessage("الأكثر مبيعاً"),
        "changeLanguage": MessageLookupByLibrary.simpleMessage("تغيير اللغة"),
        "comparePriceUnit": m0,
        "createAccount": MessageLookupByLibrary.simpleMessage("أنشيء حساب"),
        "description": MessageLookupByLibrary.simpleMessage(
            "مجموعة واجهات مستخدم رائعة لتطبيقات التجارة الإلكترونية لتجربة تسوق مميزة على متجرك الإلكتروني."),
        "dontHaveAccount":
            MessageLookupByLibrary.simpleMessage("ليس لديك حساب؟"),
        "email": MessageLookupByLibrary.simpleMessage("البريد الإلكتروني"),
        "english": MessageLookupByLibrary.simpleMessage("الإنجليزية"),
        "errorLoadingProfile": m1,
        "failedToLoadCarousels":
            MessageLookupByLibrary.simpleMessage("فشل في تحميل الشرائح"),
        "failedToLoadCategories":
            MessageLookupByLibrary.simpleMessage("فشل في تحميل الفئات"),
        "failedToLoadHotProducts": MessageLookupByLibrary.simpleMessage(
            "فشل في تحميل المنتجات الساخنة"),
        "failedToLoadNewProducts": MessageLookupByLibrary.simpleMessage(
            "فشل في تحميل المنتجات الجديدة"),
        "failedToLoadProducts": MessageLookupByLibrary.simpleMessage(
            "فشل في تحميل المنتجات الأكثر مبيعاً"),
        "failedToLoadTopProducts": MessageLookupByLibrary.simpleMessage(
            "فشل في تحميل المنتجات الأكثر مبيعاً"),
        "failedToPickImage":
            MessageLookupByLibrary.simpleMessage("فشل في اختيار الصورة"),
        "firstName": MessageLookupByLibrary.simpleMessage("الاسم الأول"),
        "forgetPassword":
            MessageLookupByLibrary.simpleMessage("نسيت كلمة المرور؟"),
        "goodToSeeYouBack":
            MessageLookupByLibrary.simpleMessage("سعيد برؤيتك مجددًا!"),
        "hotProducts": MessageLookupByLibrary.simpleMessage("المنتجات الساخنة"),
        "itemNotAddedToCart": MessageLookupByLibrary.simpleMessage(
            "لم يتم إضافة العنصر إلى السلة"),
        "itemRemoved":
            MessageLookupByLibrary.simpleMessage("تمت إزالة العنصر من السلة"),
        "itemRemovedFromFavourite":
            MessageLookupByLibrary.simpleMessage("تمت إزالة العنصر من المفضلة"),
        "lastName": MessageLookupByLibrary.simpleMessage("اسم العائلة"),
        "login": MessageLookupByLibrary.simpleMessage("تسجيل الدخول"),
        "loginButton": MessageLookupByLibrary.simpleMessage("تسجيل الدخول"),
        "logout": MessageLookupByLibrary.simpleMessage("تسجيل الخروج"),
        "myCart": MessageLookupByLibrary.simpleMessage("سلة المشتريات"),
        "myFavourite":
            MessageLookupByLibrary.simpleMessage("المفضلة الخاصة بي"),
        "newProducts": MessageLookupByLibrary.simpleMessage("المنتجات الجديدة"),
        "noCarouselsAvailable":
            MessageLookupByLibrary.simpleMessage("لا توجد شرائح متاحة"),
        "noCategoriesAvailable":
            MessageLookupByLibrary.simpleMessage("لا توجد فئات متاحة"),
        "noData": MessageLookupByLibrary.simpleMessage("لا توجد بيانات"),
        "noHotProductsAvailable":
            MessageLookupByLibrary.simpleMessage("لا توجد منتجات ساخنة متاحة"),
        "noNewProductsAvailable":
            MessageLookupByLibrary.simpleMessage("لا توجد منتجات جديدة متاحة"),
        "noProductsAvailable": MessageLookupByLibrary.simpleMessage(
            "لا توجد منتجات الأكثر مبيعاً متاحة"),
        "noProfileDataAvailable": MessageLookupByLibrary.simpleMessage(
            "لا توجد بيانات للملف الشخصي متاحة"),
        "noTopProductsAvailable":
            MessageLookupByLibrary.simpleMessage("لا توجد منتجات مميزة متاحة"),
        "notAvailable": MessageLookupByLibrary.simpleMessage("غير متوفر"),
        "orderHistory": MessageLookupByLibrary.simpleMessage("تاريخ الطلبات"),
        "password": MessageLookupByLibrary.simpleMessage("كلمة المرور"),
        "phone": MessageLookupByLibrary.simpleMessage("رقم الهاتف"),
        "pleaseEnterEmail": MessageLookupByLibrary.simpleMessage(
            "يرجى إدخال البريد الإلكتروني"),
        "pleaseEnterFirstName":
            MessageLookupByLibrary.simpleMessage("الرجاء إدخال اسمك الأول"),
        "pleaseEnterLastName":
            MessageLookupByLibrary.simpleMessage("الرجاء إدخال اسم العائلة"),
        "pleaseEnterPassword":
            MessageLookupByLibrary.simpleMessage("يرجى إدخال كلمة المرور"),
        "pleaseSelectAnImage":
            MessageLookupByLibrary.simpleMessage("يرجى اختيار صورة"),
        "pleaseTryAgainLater": MessageLookupByLibrary.simpleMessage(
            "يرجى المحاولة مرة أخرى لاحقًا"),
        "priceUnit": m2,
        "products": MessageLookupByLibrary.simpleMessage("المنتجات"),
        "profile": MessageLookupByLibrary.simpleMessage("الملف الشخصي"),
        "profileUpdatedSuccessfully":
            MessageLookupByLibrary.simpleMessage("تم تحديث الملف الشخصي بنجاح"),
        "removeFromCart": MessageLookupByLibrary.simpleMessage("إزالة"),
        "removeFromFavorites":
            MessageLookupByLibrary.simpleMessage("إزالة من المفضلة"),
        "selectLanguage": MessageLookupByLibrary.simpleMessage("اختر اللغة"),
        "signUp": MessageLookupByLibrary.simpleMessage("تسجيل"),
        "somethingWentWrong":
            MessageLookupByLibrary.simpleMessage("حدث خطأ ما"),
        "topProducts": MessageLookupByLibrary.simpleMessage("أفضل المنتجات"),
        "tryAgain": MessageLookupByLibrary.simpleMessage("حاول مرة أخرى"),
        "updateProfile":
            MessageLookupByLibrary.simpleMessage("تحديث الملف الشخصي"),
        "yourCartIsEmpty":
            MessageLookupByLibrary.simpleMessage("قائمة السلة الخاصة بك فارغة"),
        "yourFavouriteListIsEmpty":
            MessageLookupByLibrary.simpleMessage("قائمة المفضلات فارغة")
      };
}
