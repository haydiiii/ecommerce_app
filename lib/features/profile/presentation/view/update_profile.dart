import 'package:ecommerce_app/core/utils/text_style.dart';
import 'package:ecommerce_app/core/widgets/custm_txtform_field.dart';
import 'package:ecommerce_app/core/widgets/custom_elev_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class UpdateProfilePage extends StatelessWidget {
  // final _nameController = TextEditingController();
  // final _emailController = TextEditingController();
  // final _phoneController = TextEditingController();
  // final _cityController = TextEditingController();
  // final _addressController = TextEditingController();

  const UpdateProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Update Profile',
        style: getTitleStyle(fontsize: 25, fontWeight: FontWeight.w500),
      )),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      'https://via.placeholder.com/150'), // Replace with actual profile image URL
                ),
                const Gap(20),
                const CustomTxtFField(
                  prefixicon: Icons.person,
                  text: 'Name',
                ),
                const Gap(20),
                const CustomTxtFField(
                  prefixicon: Icons.email,
                  text: 'Email',
                ),
                const Gap(20),
                const CustomTxtFField(
                  prefixicon: Icons.phone,
                  text: 'Phone',
                ),
                const Gap(20),
                const CustomTxtFField(
                  prefixicon: Icons.location_city,
                  text: 'City',
                ),
                const Gap(20),
                const CustomTxtFField(
                  prefixicon: Icons.home,
                  text: 'Address',
                ),
                const Gap(20),
                CustomElvButton(
                  
                  onPressed: () {},
                  text: 'Update Profile',
                  width: 200,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
