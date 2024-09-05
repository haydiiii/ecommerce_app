import 'dart:io';
import 'package:ecommerce_app/core/functions/routing.dart';
import 'package:ecommerce_app/core/utils/text_style.dart';
import 'package:ecommerce_app/core/widgets/custm_txtform_field.dart';
import 'package:ecommerce_app/core/widgets/custom_dialog.dart';
import 'package:ecommerce_app/core/widgets/custom_elev_button.dart';
import 'package:ecommerce_app/features/layouts/presentation/view/bottom_nav_bar.dart';
import 'package:ecommerce_app/features/profile/presentation/view_model/profile_cubit.dart';
import 'package:ecommerce_app/features/profile/presentation/view_model/profile_state.dart';
import 'package:ecommerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';

class UpdateProfilePage extends StatefulWidget {
  const UpdateProfilePage({super.key});

  @override
  State<UpdateProfilePage> createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  final formKey = GlobalKey<FormState>();
  XFile? pickImage;

  Future<void> uploadImageFromGallery() async {
    try {
      final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        setState(() {
          pickImage = pickedImage;
        });
      }
    } catch (e) {
      // Handle any errors here
      // ignore: use_build_context_synchronously
      showCustomDialog(context, message: S.of(context).failedToPickImage); // استخدام الترجمة
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..showProfile(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            S.of(context).updateProfile, // استخدام الترجمة
            style: getTitleStyle(fontsize: 25, fontWeight: FontWeight.w500),
          ),
        ),
        body: BlocConsumer<ProfileCubit, ProfileStates>(
          listener: (context, state) {
            if (state is UpdateProfileSuccessState) {
              showCustomDialog(
                context,
                message: S.of(context).profileUpdatedSuccessfully, // استخدام الترجمة
              );
              pushWithReplacement(
                context,
                const BottomNavBar(index: 0),
              );
            } else if (state is UpdateProfileErrorState) {
              showCustomDialog(
                context,
                message: S.of(context).somethingWentWrong, // استخدام الترجمة
              );
            }
          },
          builder: (context, state) {
            if (state is ShowProfileLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            final cubit = ProfileCubit.get(context);
            final imageProvider = pickImage != null
                ? FileImage(File(pickImage!.path))
                : (cubit.showProfileModel?.data.imageUrl != null
                    ? NetworkImage(cubit.showProfileModel!.data.imageUrl.toString())
                    : const AssetImage('assets/images/default_profile.png')); // صورة احتياطية

            return cubit.showProfileModel != null
                ? Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: uploadImageFromGallery,
                              child: CircleAvatar(
                                radius: 50,
                                backgroundImage: imageProvider as ImageProvider,
                              ),
                            ),
                            const Gap(20),
                            CustomTxtFField(
                              controller: cubit.firstNameController,
                              prefixicon: Icons.person,
                              text: S.of(context).firstName, // استخدام الترجمة
                            ),
                            const Gap(20),
                            CustomTxtFField(
                              controller: cubit.lastNameController,
                              prefixicon: Icons.person,
                              text: S.of(context).lastName, // استخدام الترجمة
                            ),
                            const Gap(20),
                            CustomTxtFField(
                              controller: cubit.emailController,
                              prefixicon: Icons.email,
                              text: S.of(context).email, // 
                            ),
                            const Gap(20),
                            CustomTxtFField(
                              controller: cubit.phoneController,
                              prefixicon: Icons.phone,
                              text: S.of(context).phone, // استخدام الترجمة
                            ),
                            const Gap(20),
                            CustomElvButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  if (pickImage != null) {
                                    final imageFile = File(pickImage!.path);
                                    cubit.updateProfile(image: imageFile);
                                  } else {
                                    showCustomDialog(
                                      context,
                                      message: S.of(context).pleaseSelectAnImage, // استخدام الترجمة
                                    );
                                  }
                                }
                              },
                              text: S.of(context).updateProfile, // استخدام الترجمة
                              width: 200,
                              child: state is UpdateProfileLoadingState
                                  ? const Center(child: CircularProgressIndicator())
                                  : Text(S.of(context).updateProfile), // استخدام الترجمة
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : Center(
                    child: Text(S.of(context).noData), // استخدام الترجمة
                  );
          },
        ),
      ),
    );
  }
}
