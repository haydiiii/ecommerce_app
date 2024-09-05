import 'package:ecommerce_app/core/functions/routing.dart';
import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/text_style.dart';
import 'package:ecommerce_app/features/profile/presentation/widgets/changeLanguage/language_cubit.dart';
import 'package:ecommerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void showLanguageDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          S.of(context).selectLanguage, // استخدام الترجمة
          style: getBodyStyle(color: AppColors.primaryColor),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text(
                S.of(context).english, // استخدام الترجمة
                style: getBodyStyle(color: AppColors.primaryColor),
              ),
              onTap: () {
                context
                    .read<LanguageCubit>()
                    .changeLanguage(const Locale('en'));
                pop(context);
              },
            ),
            ListTile(
              title: Text(
                S.of(context).arabic, // استخدام الترجمة
                style: getBodyStyle(color: AppColors.primaryColor),
              ),
              onTap: () {
                context
                    .read<LanguageCubit>()
                    .changeLanguage(const Locale('ar'));
                pop(context);
              },
            ),
          ],
        ),
      );
    },
  );
}
