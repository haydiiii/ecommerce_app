import 'package:ecommerce_app/core/functions/routing.dart';
import 'package:ecommerce_app/core/utils/text_style.dart';
import 'package:ecommerce_app/core/widgets/custom_elev_button.dart';
import 'package:ecommerce_app/features/profile/presentation/view/update_profile.dart';
import 'package:ecommerce_app/features/profile/presentation/widgets/list_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile',
            style: getTitleStyle(fontsize: 25, fontWeight: FontWeight.w500)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  'https://via.placeholder.com/150'), // Replace with actual profile image URL
            ),
            const Gap(20),
            const ProfileInfoTile(
              icon: Icons.person,
              text: 'haidi', // Replace with actual name
            ),
            const ProfileInfoTile(
              icon: Icons.email,
              text: 'haydikhattab1452000@gm', // Replace with actual email
            ),
            const ProfileInfoTile(
              icon: Icons.phone,
              text: 'phone', // Replace with actual phone
            ),
            const ProfileInfoTile(
              icon: Icons.location_city,
              text: 'city', // Replace with actual city
            ),
            const ProfileInfoTile(
              icon: Icons.home,
              text: 'address', // Replace with actual address
            ),
            const Gap(20),
            CustomElvButton(
              onPressed: () {
                pushto(context, const UpdateProfilePage());
              },
              text: ' Profile ',
              width: 200,
            ),
          ],
        ),
      ),
    );
  }
}
