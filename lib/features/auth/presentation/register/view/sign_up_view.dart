import 'package:ecommerce_app/core/functions/routing.dart';
import 'package:ecommerce_app/core/utils/text_style.dart';
import 'package:ecommerce_app/core/widgets/custom_dialog.dart';
import 'package:ecommerce_app/features/auth/presentation/register/view_model/cubit/register_cubit.dart';
import 'package:ecommerce_app/features/auth/presentation/register/view_model/cubit/register_state.dart';
import 'package:ecommerce_app/features/layouts/presentation/view/bottom_nav_bar.dart';
import 'package:ecommerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/widgets/custm_txtform_field.dart';
import 'package:ecommerce_app/core/widgets/custom_elev_button.dart';
import 'package:ecommerce_app/features/auth/presentation/login/view/login_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final formKey = GlobalKey<FormState>();

  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Scaffold(
        body: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
            if (state is RegisterErrorsState) {
              showCustomDialog(context, message: state.error);
            } else if (state is RegisterSuccessState) {
              pushAndRemoveUntil(context, const BottomNavBar());
            }
          },
          builder: (context, state) {
            final cubit = RegisterCubit.get(context);
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
                    SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: MediaQuery.of(context).size.height,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                  height: 400), // Initial height adjustment
                              CustomTxtFField(
                                controller: cubit.firstNameController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return S.of(context).pleaseEnterFirstName;
                                  }
                                  return null;
                                },
                                prefixicon: Icons.person,
                                text: S.of(context).firstName,
                              ),
                              const Gap(5),
                              CustomTxtFField(
                                controller: cubit.lastNameController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return S.of(context).pleaseEnterLastName;
                                  }
                                  return null;
                                },
                                prefixicon: Icons.person,
                                text: S.of(context).lastName,
                              ),
                              const Gap(5),
                              CustomTxtFField(
                                controller: cubit.emailController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return S.of(context).pleaseEnterEmail;
                                  }
                                  return null;
                                },
                                prefixicon: Icons.email,
                                text: S.of(context).email,
                              ),
                              const Gap(5),
                              CustomTxtFField(
                                controller: cubit.passwordController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return S.of(context).pleaseEnterPassword;
                                  }
                                  return null;
                                },
                                obscuretext: isPasswordVisible,
                                prefixicon: Icons.lock,
                                suffixicon: isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                onTapSuffixIcon: () {
                                  setState(() {
                                    isPasswordVisible = !isPasswordVisible;
                                  });
                                },
                                text: S.of(context).password,
                              ),
                              const Gap(10),
                              CustomElvButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    cubit.register();
                                  }
                                },
                                text: S.of(context).signUp,
                                width: 335,
                                child: (state is RegisterLoadingState)
                                    ? const CircularProgressIndicator()
                                    : Text(
                                        '  ${S.of(context).signUp}',
                                        style: getBodyStyle(
                                            color: AppColors.white),
                                      ),
                              ),
                              const Gap(10),
                              Row(
                                children: [
                                  Text(S.of(context).alreadyHaveAccount),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => const LoginView(),
                                        ),
                                      );
                                    },
                                    child: Text(S.of(context).login),
                                  ),
                                ],
                              ),
                            ],
                          ),
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
                      top: 130,
                      left: 40,
                      child: Text(
                        S.of(context).createAccount,
                        style: TextStyle(
                          color: AppColors.white.withOpacity(0.7),
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
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
