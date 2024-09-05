// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Beautiful eCommerce UI Kit \n for your online store`
  String get description {
    return Intl.message(
      'Beautiful eCommerce UI Kit \n for your online store',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Good to see you back!`
  String get goodToSeeYouBack {
    return Intl.message(
      'Good to see you back!',
      name: 'goodToSeeYouBack',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password?`
  String get forgetPassword {
    return Intl.message(
      'Forget Password?',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get loginButton {
    return Intl.message(
      'Login',
      name: 'loginButton',
      desc: '',
      args: [],
    );
  }

  /// `Don’t have an account?`
  String get dontHaveAccount {
    return Intl.message(
      'Don’t have an account?',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message(
      'Sign Up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your first name`
  String get pleaseEnterFirstName {
    return Intl.message(
      'Please enter your first name',
      name: 'pleaseEnterFirstName',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get firstName {
    return Intl.message(
      'First Name',
      name: 'firstName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your last name`
  String get pleaseEnterLastName {
    return Intl.message(
      'Please enter your last name',
      name: 'pleaseEnterLastName',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get lastName {
    return Intl.message(
      'Last Name',
      name: 'lastName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email`
  String get pleaseEnterEmail {
    return Intl.message(
      'Please enter your email',
      name: 'pleaseEnterEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password`
  String get pleaseEnterPassword {
    return Intl.message(
      'Please enter your password',
      name: 'pleaseEnterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get alreadyHaveAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Create\nAccount`
  String get createAccount {
    return Intl.message(
      'Create\nAccount',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `All Categories`
  String get allCategories {
    return Intl.message(
      'All Categories',
      name: 'allCategories',
      desc: '',
      args: [],
    );
  }

  /// `New Products`
  String get newProducts {
    return Intl.message(
      'New Products',
      name: 'newProducts',
      desc: '',
      args: [],
    );
  }

  /// `Top Products`
  String get topProducts {
    return Intl.message(
      'Top Products',
      name: 'topProducts',
      desc: '',
      args: [],
    );
  }

  /// `Hot Products`
  String get hotProducts {
    return Intl.message(
      'Hot Products',
      name: 'hotProducts',
      desc: '',
      args: [],
    );
  }

  /// `Best Sellers`
  String get bestSellers {
    return Intl.message(
      'Best Sellers',
      name: 'bestSellers',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load categories`
  String get failedToLoadCategories {
    return Intl.message(
      'Failed to load categories',
      name: 'failedToLoadCategories',
      desc: '',
      args: [],
    );
  }

  /// `No categories available`
  String get noCategoriesAvailable {
    return Intl.message(
      'No categories available',
      name: 'noCategoriesAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load best selling products`
  String get failedToLoadProducts {
    return Intl.message(
      'Failed to load best selling products',
      name: 'failedToLoadProducts',
      desc: '',
      args: [],
    );
  }

  /// `No best selling products available`
  String get noProductsAvailable {
    return Intl.message(
      'No best selling products available',
      name: 'noProductsAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load carousels`
  String get failedToLoadCarousels {
    return Intl.message(
      'Failed to load carousels',
      name: 'failedToLoadCarousels',
      desc: '',
      args: [],
    );
  }

  /// `No carousels available`
  String get noCarouselsAvailable {
    return Intl.message(
      'No carousels available',
      name: 'noCarouselsAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load hot products`
  String get failedToLoadHotProducts {
    return Intl.message(
      'Failed to load hot products',
      name: 'failedToLoadHotProducts',
      desc: '',
      args: [],
    );
  }

  /// `No hot products available`
  String get noHotProductsAvailable {
    return Intl.message(
      'No hot products available',
      name: 'noHotProductsAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load new products`
  String get failedToLoadNewProducts {
    return Intl.message(
      'Failed to load new products',
      name: 'failedToLoadNewProducts',
      desc: '',
      args: [],
    );
  }

  /// `No new products available`
  String get noNewProductsAvailable {
    return Intl.message(
      'No new products available',
      name: 'noNewProductsAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load top products`
  String get failedToLoadTopProducts {
    return Intl.message(
      'Failed to load top products',
      name: 'failedToLoadTopProducts',
      desc: '',
      args: [],
    );
  }

  /// `No top products available`
  String get noTopProductsAvailable {
    return Intl.message(
      'No top products available',
      name: 'noTopProductsAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Error loading profile: {errorMessage}`
  String errorLoadingProfile(Object errorMessage) {
    return Intl.message(
      'Error loading profile: $errorMessage',
      name: 'errorLoadingProfile',
      desc: '',
      args: [errorMessage],
    );
  }

  /// `No profile data available`
  String get noProfileDataAvailable {
    return Intl.message(
      'No profile data available',
      name: 'noProfileDataAvailable',
      desc: '',
      args: [],
    );
  }

  /// `N/A`
  String get notAvailable {
    return Intl.message(
      'N/A',
      name: 'notAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Update Profile`
  String get updateProfile {
    return Intl.message(
      'Update Profile',
      name: 'updateProfile',
      desc: '',
      args: [],
    );
  }

  /// `Profile updated successfully`
  String get profileUpdatedSuccessfully {
    return Intl.message(
      'Profile updated successfully',
      name: 'profileUpdatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong`
  String get somethingWentWrong {
    return Intl.message(
      'Something went wrong',
      name: 'somethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `Failed to pick image`
  String get failedToPickImage {
    return Intl.message(
      'Failed to pick image',
      name: 'failedToPickImage',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Please select an image`
  String get pleaseSelectAnImage {
    return Intl.message(
      'Please select an image',
      name: 'pleaseSelectAnImage',
      desc: '',
      args: [],
    );
  }

  /// `No data`
  String get noData {
    return Intl.message(
      'No data',
      name: 'noData',
      desc: '',
      args: [],
    );
  }

  /// `Select Language`
  String get selectLanguage {
    return Intl.message(
      'Select Language',
      name: 'selectLanguage',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get arabic {
    return Intl.message(
      'Arabic',
      name: 'arabic',
      desc: '',
      args: [],
    );
  }

  /// `Order History`
  String get orderHistory {
    return Intl.message(
      'Order History',
      name: 'orderHistory',
      desc: '',
      args: [],
    );
  }

  /// `Change Language`
  String get changeLanguage {
    return Intl.message(
      'Change Language',
      name: 'changeLanguage',
      desc: '',
      args: [],
    );
  }

  /// `My Cart`
  String get myCart {
    return Intl.message(
      'My Cart',
      name: 'myCart',
      desc: '',
      args: [],
    );
  }

  /// `Please try again later`
  String get pleaseTryAgainLater {
    return Intl.message(
      'Please try again later',
      name: 'pleaseTryAgainLater',
      desc: '',
      args: [],
    );
  }

  /// `Try Again`
  String get tryAgain {
    return Intl.message(
      'Try Again',
      name: 'tryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Your Cart list is empty`
  String get yourCartIsEmpty {
    return Intl.message(
      'Your Cart list is empty',
      name: 'yourCartIsEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Add Now`
  String get addNow {
    return Intl.message(
      'Add Now',
      name: 'addNow',
      desc: '',
      args: [],
    );
  }

  /// `Item removed from cart`
  String get itemRemoved {
    return Intl.message(
      'Item removed from cart',
      name: 'itemRemoved',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get addToCart {
    return Intl.message(
      'Add',
      name: 'addToCart',
      desc: '',
      args: [],
    );
  }

  /// `Remove`
  String get removeFromCart {
    return Intl.message(
      'Remove',
      name: 'removeFromCart',
      desc: '',
      args: [],
    );
  }

  /// `Price: {price}`
  String priceUnit(Object price) {
    return Intl.message(
      'Price: $price',
      name: 'priceUnit',
      desc: '',
      args: [price],
    );
  }

  /// `My Favourite`
  String get myFavourite {
    return Intl.message(
      'My Favourite',
      name: 'myFavourite',
      desc: '',
      args: [],
    );
  }

  /// `Item removed from favourite`
  String get itemRemovedFromFavourite {
    return Intl.message(
      'Item removed from favourite',
      name: 'itemRemovedFromFavourite',
      desc: '',
      args: [],
    );
  }

  /// `Your favourite list is empty`
  String get yourFavouriteListIsEmpty {
    return Intl.message(
      'Your favourite list is empty',
      name: 'yourFavouriteListIsEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Item not added to cart`
  String get itemNotAddedToCart {
    return Intl.message(
      'Item not added to cart',
      name: 'itemNotAddedToCart',
      desc: '',
      args: [],
    );
  }

  /// `Products`
  String get products {
    return Intl.message(
      'Products',
      name: 'products',
      desc: '',
      args: [],
    );
  }

  /// `Compare Price: {comparePrice}`
  String comparePriceUnit(Object comparePrice) {
    return Intl.message(
      'Compare Price: $comparePrice',
      name: 'comparePriceUnit',
      desc: '',
      args: [comparePrice],
    );
  }

  /// `Remove from Favorites`
  String get removeFromFavorites {
    return Intl.message(
      'Remove from Favorites',
      name: 'removeFromFavorites',
      desc: '',
      args: [],
    );
  }

  /// `Add to Favorites`
  String get addToFavorites {
    return Intl.message(
      'Add to Favorites',
      name: 'addToFavorites',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
