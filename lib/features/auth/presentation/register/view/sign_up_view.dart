import 'package:flutter/material.dart';
import 'package:ecommerce_app/core/utils/colors.dart';
import 'package:ecommerce_app/core/widgets/custm_txtform_field.dart';
import 'package:ecommerce_app/core/widgets/custom_elev_button.dart';
import 'package:ecommerce_app/features/auth/presentation/login/view/login_view.dart';
import 'package:gap/gap.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
                    const SizedBox(height: 400), // Initial height adjustment
                    const CustomTxtFField(
                      prefixicon: Icons.person,
                      text: 'First Name',
                    ),
                    const Gap(5),
                    const CustomTxtFField(
                      prefixicon: Icons.person,
                      text: 'Last Name',
                    ),
                    const Gap(5),
                    const CustomTxtFField(
                      prefixicon: Icons.email,
                      text: 'Email',
                    ),
                    const Gap(5),
                    CustomTxtFField(
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
                      text: 'Password',
                    ),
                    const Gap(10),
                    CustomElvButton(
                      onPressed: () {},
                      text: 'Sign Up',
                      width: 335,
                    ),
                    const Gap(10),
                    Row(
                      children: [
                        const Text('Already have an account?'),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const LoginView(),
                              ),
                            );
                          },
                          child: const Text('Login'),
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
              'Create\nAccount',
              style: TextStyle(
                color: AppColors.white.withOpacity(0.7),
                fontWeight: FontWeight.w700,
                fontSize: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
