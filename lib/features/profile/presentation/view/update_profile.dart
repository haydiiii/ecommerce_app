import 'dart:developer';
import 'dart:io';
import 'package:ecommerce_app/core/functions/routing.dart';
import 'package:ecommerce_app/core/utils/text_style.dart';
import 'package:ecommerce_app/core/widgets/custm_txtform_field.dart';
import 'package:ecommerce_app/core/widgets/custom_dialog.dart';
import 'package:ecommerce_app/core/widgets/custom_elev_button.dart';
import 'package:ecommerce_app/features/layouts/presentation/view/bottom_nav_bar.dart';
import 'package:ecommerce_app/features/profile/presentation/view_model/profile_cubit.dart';
import 'package:ecommerce_app/features/profile/presentation/view_model/profile_state.dart';
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
  var formKey = GlobalKey<FormState>();
  File? image;
  final picker = ImagePicker();

  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
      } else {
        log('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..showProfile(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Update Profile',
            style: getTitleStyle(fontsize: 25, fontWeight: FontWeight.w500),
          ),
        ),
        body: BlocConsumer<ProfileCubit, ProfileStates>(
          listener: (context, state) {
            if (state is UpdateProfileSuccessState) {
              showCustomDialog(
                context,
                message: 'Profile updated successfully',
              );
              pushWithReplacement(
                context,
                const BottomNavBar(index: 0),
              );
            } else if (state is UpdateProfileErrorState) {
              showCustomDialog(
                context,
                message: 'Something went wrong',
              );
            }
          },
          builder: (context, state) {
            if (state is ShowProfileLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            var cubit = ProfileCubit.get(context);
            return cubit.showProfileModel != null
                ? Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: pickImage,
                              child: CircleAvatar(
                                radius: 50,
                                backgroundImage: image != null
                                    ? FileImage(image!)
                                    : const AssetImage(
                                            'assets/images/profile.png')
                                        as ImageProvider, // Replace with actual profile image URL
                              ),
                            ),
                            const Gap(20),
                            CustomTxtFField(
                              controller: cubit.firstNameController,
                              prefixicon: Icons.person,
                              text: 'First Name',
                            ),
                            const Gap(20),
                            CustomTxtFField(
                              controller: cubit.lastNameController,
                              prefixicon: Icons.person,
                              text: 'Last Name',
                            ),
                            const Gap(20),
                            CustomTxtFField(
                              controller: cubit.emailController,
                              prefixicon: Icons.email,
                              text: 'Email',
                            ),
                            const Gap(20),
                            CustomTxtFField(
                              controller: cubit.phoneController,
                              prefixicon: Icons.phone,
                              text: 'Phone',
                            ),
                            const Gap(20),
                            CustomElvButton(
                              onPressed: () {
                                if (formKey.currentState!.validate() && image != null) {
                                  if (image != null) {
                                    cubit.updateProfile(image: image!);
                                  } else if (formKey.currentState!.validate()&& image == null) {
                                    showCustomDialog(
                                      context,
                                      message: 'Please select an image',
                                    );
                                  }
                                }
                              },
                              text: 'Update Profile',
                              width: 200,
                              child: state is UpdateProfileLoadingState ? const Center(child: CircularProgressIndicator()) :const Text('Update Profile'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : const Center(
                    child: Text('No data'),
                  );
          },
        ),
      ),
    );
  }
}
