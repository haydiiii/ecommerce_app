import 'package:ecommerce_app/core/functions/routing.dart';
import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/text_style.dart';
import 'package:ecommerce_app/core/widgets/custom_dialog.dart';
import 'package:ecommerce_app/core/widgets/custom_elevated.dart';
import 'package:ecommerce_app/features/auth/presentation/forgetpassword/view/verify_code.dart';
import 'package:ecommerce_app/features/auth/presentation/forgetpassword/view_model/cubit/forget_cubit.dart';
import 'package:ecommerce_app/features/auth/presentation/forgetpassword/view_model/cubit/forget_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

// ignore: must_be_immutable
class ForgetPasswordView extends StatelessWidget {
  ForgetPasswordView({super.key});

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetCubit(),
      child: Scaffold(
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
            if (state is ForgetPasswordErrorState) {
              showCustomDialog(context, message: state.error);
            } else if (state is ForgetPasswordSucessState) {
              pushto(context, VerifyCodeView());
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
                        'Enter your email',
                        //textAlign: TextAlign.start,
                        style: getBodyStyle(
                            fontsize: 20,
                            fontWeight: FontWeight.w900,
                            color: AppColors.primaryColor),
                      ),
                      const Gap(15),
                      TextFormField(
                        style: getBodyStyle(),
                        controller: cubit.emailForgetPassword,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'this field is required';
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
                              borderRadius: BorderRadius.circular(25)),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              cubit.forgetPassword();
                            }
                          },
                          child: (state is ForgetPasswordLoadingState)
                              ? const CircularProgressIndicator(
                                  color: AppColors.white,
                                )
                              : Text(
                                  'Send',
                                  style: getBodyStyle(color: AppColors.white),
                                ),
                        ),
                      ),
                    ],
                  )),
            );
          },
        ),
      ),
    );
  }
}

Future<dynamic> showModelBottomSheet(context) {
  return showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25), color: AppColors.black),
      );
    },
  );
}
