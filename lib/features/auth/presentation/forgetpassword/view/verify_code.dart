import 'package:ecommerce_app/core/functions/routing.dart';
import 'package:ecommerce_app/core/utils/text_style.dart';
import 'package:ecommerce_app/core/widgets/custom_dialog.dart';
import 'package:ecommerce_app/core/widgets/custom_elevated.dart';
import 'package:ecommerce_app/features/auth/presentation/forgetpassword/view/reset_password.dart';
import 'package:ecommerce_app/features/auth/presentation/forgetpassword/view_model/cubit/forget_cubit.dart';
import 'package:ecommerce_app/features/auth/presentation/forgetpassword/view_model/cubit/forget_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:pinput/pinput.dart';

import '../../../../../core/utils/colors.dart';

// ignore: must_be_immutable
class VerifyCodeView extends StatelessWidget {
  VerifyCodeView({super.key});

  var formKey = GlobalKey<FormState>();
  // ignore: non_constant_identifier_names
  String? verify_code;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetCubit(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(35),
          child: AppBar(
            leading: IconButton(
              onPressed: () {
                pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                size: 30,
              ),
            ),
          ),
        ),
        body: BlocConsumer<ForgetCubit, ForgetState>(
          listener: (context, state) {
            if (state is VerifyCodeErrorState) {
              showCustomDialog(context, message: state.error);
            } else if (state is VerifyCodeSucessState) {
              pushAndRemoveUntil(
                context,
                ResetPasswordView(
                  verify_code: verify_code??'',
                ),
              );
            }
          },
          builder: (context, state) {
            var cubit = ForgetCubit.get(context);
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Please Enter your email and code',
                      style: getBodyStyle(
                        fontsize: 20,
                        fontWeight: FontWeight.w900,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    const Gap(15),
                    TextFormField(
                      style: getBodyStyle(),
                      decoration: InputDecoration(
                        hintText: 'Enter your email',
                        hintStyle: getBodyStyle(color: AppColors.greyColor),
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 10),
                      ),
                      controller: cubit.emailForgetPassword,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'This field is required';
                        }
                        return null;
                      },
                    ),
                    const Gap(15),
                    Pinput(
                      length: 6,
                      controller: cubit.verifyCode,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'This field is required';
                        }
                        return null;
                      },
                    ),
                    const Gap(50),
                    Align(
                      alignment: Alignment.topRight,
                      child: CustomElevatedButton(
                        width: 150,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            cubit.verifyCodeMethod();
                          }
                        },
                        child: (state is VerifyCodeLoadingState)
                            ? const CircularProgressIndicator(
                                color: AppColors.white,
                              )
                            : Text(
                                'Verify',
                                style: getBodyStyle(color: AppColors.white),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
