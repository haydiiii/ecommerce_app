// ignore_for_file: non_constant_identifier_names

import 'package:ecommerce_app/core/functions/routing.dart';
import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/text_style.dart';
import 'package:ecommerce_app/core/widgets/custom_dialog.dart';
import 'package:ecommerce_app/core/widgets/custom_elevated.dart';
import 'package:ecommerce_app/features/auth/presentation/forgetpassword/view_model/cubit/forget_cubit.dart';
import 'package:ecommerce_app/features/auth/presentation/forgetpassword/view_model/cubit/forget_state.dart';
import 'package:ecommerce_app/features/auth/presentation/login/view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

// ignore: must_be_immutable
class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key, required this.verify_code});

  final String verify_code;

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  bool isVisible1 = true;
  bool isVisible2 = true;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ForgetCubit(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: AppColors.white,
          body: BlocConsumer< ForgetCubit, ForgetState>(
            listener: (context, state) {
              if (state is ResetPasswordErrorState) {
                showCustomDialog(context, message: state.error);
              } else if (state is ResetPasswordSucessState) {
                pushWithReplacement(context, const LoginView());
              }
            },
            builder: (context, state) {
              var cubit = ForgetCubit.get(context);
              cubit.verifyCode.text = widget.verify_code;
              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Change Your Password',
                            style: getTitleStyle(
                                fontWeight: FontWeight.w600, ),
                          ),
                          const Gap(35),
                          TextFormField(
                            style: getBodyStyle(),
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isVisible1 = !isVisible1;
                                  });
                                },
                                icon: Icon((isVisible1)
                                    ? Icons.remove_red_eye_outlined
                                    : Icons.visibility_off_rounded),
                              ),
                              hintText: 'Password',
                              hintStyle: getBodyStyle(color: AppColors.greyColor),
                            ),
                            controller: cubit.password,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'this field is required';
                              }
                              return null;
                            },
                            obscureText: isVisible1,
                            textInputAction: TextInputAction.next,
                          ),
                          const Gap(30),
                          TextFormField(
                            style: getBodyStyle(),
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isVisible2 = !isVisible2;
                                    });
                                  },
                                  icon: Icon((isVisible2)
                                      ? Icons.remove_red_eye_outlined
                                      : Icons.visibility_off_rounded)),
                              hintText: 'Password Confirmation',
                              hintStyle: getBodyStyle(color: AppColors.greyColor),
                            ),
                            controller: cubit.passwordConfirm,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'this field is required';
                              }
                              return null;
                            },
                            obscureText: isVisible2,
                            textInputAction: TextInputAction.done,
                          ),
                          const Gap(70),
                          CustomElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                cubit.resetPassword();
                              }
                            },
                            width: 300,
                            child: (state is ResetPasswordLoadingState)
                                ? const CircularProgressIndicator(
                                    color: AppColors.white,
                                  )
                                : Text(
                                    'Change Passworrd',
                                    style: getBodyStyle(color: AppColors.white),
                                  ),
                          ),
                        ]),
                  ),
                ),
              );
            },
          ),
        ));
  }
}