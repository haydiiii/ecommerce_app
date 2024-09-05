import 'package:ecommerce_app/core/functions/routing.dart';
import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/utils/text_style.dart';
import 'package:ecommerce_app/core/widgets/custm_txtform_field.dart';
import 'package:ecommerce_app/core/widgets/custom_dialog.dart';
import 'package:ecommerce_app/core/widgets/custom_elev_button.dart';
import 'package:ecommerce_app/features/auth/presentation/forgetpassword/view/forget_password.dart';
import 'package:ecommerce_app/features/auth/presentation/login/view_model/login_cubit.dart';
import 'package:ecommerce_app/features/auth/presentation/login/view_model/login_states.dart';
import 'package:ecommerce_app/features/auth/presentation/register/view/sign_up_view.dart';
import 'package:ecommerce_app/features/layouts/presentation/view/bottom_nav_bar.dart';
import 'package:ecommerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final formKey = GlobalKey<FormState>();
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        body: BlocConsumer<LoginCubit, LoginStates>(
          listener: (context, state) {
            if (state is LoginErrorsState) {
              showCustomDialog(context, message: state.error);
            } else if (state is LoginSuccessState) {
              pushAndRemoveUntil(context, const BottomNavBar());
            }
          },
          builder: (context, state) {
            final cubit = LoginCubit.get(context);
            return SafeArea(
              child: Form(
                key: formKey,
                child: Stack(
                  children: [
                    Positioned(
                      top: -50,
                      left: -110,
                      child: ClipOval(
                        child: Container(
                          width: 430,
                          height: 430,
                          color: AppColors.primaryColor.withOpacity(0.2),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -70,
                      right: -70,
                      child: ClipOval(
                        child: Container(
                          width: 300,
                          height: 300,
                          color: AppColors.primaryColor.withOpacity(0.2),
                        ),
                      ),
                    ),
                    Positioned(
                      top: -50,
                      left: -120,
                      child: ClipOval(
                        child: Container(
                          width: 400,
                          height: 400,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 30,
                      top: 370,
                      right: 30,
                      bottom: 30,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              S.of(context).login,
                              style: getTitleStyle(
                                color: AppColors.black,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const Gap(10),
                            Row(
                              children: [
                                Text(
                                  S.of(context).goodToSeeYouBack,
                                  style: getSmallStyle(
                                    TextDecoration.none,
                                    color: AppColors.black,
                                    fontsize: 19,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                const Icon(
                                  Icons.favorite,
                                  color: AppColors.black,
                                  size: 15,
                                ),
                              ],
                            ),
                            const Gap(10),
                            CustomTxtFField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return S.of(context).pleaseEnterEmail;
                                }
                                return null;
                              },
                              prefixicon: Icons.email,
                              text: S.of(context).email,
                              controller: cubit.emailController,
                            ),
                            const Gap(10),
                            CustomTxtFField(
                              obscuretext: obscureText,
                              prefixicon: Icons.lock,
                              suffixicon: obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              onTapSuffixIcon: () {
                                setState(() {
                                  obscureText = !obscureText;
                                });
                              },
                              text: S.of(context).password,
                              controller: cubit.passwordController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return S.of(context).pleaseEnterPassword;
                                }
                                return null;
                              },
                            ),
                            const Gap(30),
                            InkWell(
                              onTap: () {
                                pushto(context, ForgetPasswordView());
                              },
                              child: Container(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  S.of(context).forgetPassword,
                                  style: getBodyStyle(
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.primaryColor),
                                ),
                              ),
                            ),
                            const Gap(10),
                            CustomElvButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  cubit.login();
                                }
                              },
                              text: S.of(context).loginButton,
                              width: 335,
                              child: (state is LoginLoadingState)
                                  ? const CircularProgressIndicator()
                                  : Text(
                                      '  ${S.of(context).loginButton}',
                                      style:
                                          getBodyStyle(color: AppColors.white),
                                    ),
                            ),
                            const Gap(10),
                            Row(
                              children: [
                                Text(S.of(context).dontHaveAccount),
                                TextButton(
                                  onPressed: () {
                                    pushWithReplacement(
                                        context, const SignUpView());
                                  },
                                  child: Text(S.of(context).signUp),
                                ),
                              ],
                            ),
                          ],
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
