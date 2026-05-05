import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sanad1_app/core/colors.dart';
import 'package:sanad1_app/screens/app_info.dart';
import 'package:sanad1_app/screens/edit_profile.dart';
import 'package:sanad1_app/screens/settings.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File? _image;

  @override
  Widget build(BuildContext context) {
    final image = _image;

    return Scaffold(
      appBar: AppBar(
        title: Text("profile".tr()),
        leading: IconButton(
    icon: const Icon(
      Icons.arrow_back,
      color: AppColors.primaryDark,
    ),
    onPressed: () {
      Navigator.pop(context);
    },
  ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),

          Center(
            child: CircleAvatar(
              radius: 60,
              backgroundColor: AppColors.greyLight,
              backgroundImage: image != null ? FileImage(image) : null,
              child: image == null
                  ? const Icon(
                      Icons.person,
                      size: 60,
                      color: AppColors.primaryDark,
                    )
                  : null,
            ),
          ),

          const SizedBox(height: 20),

          Text(
            "user_name".tr(),
            style: const TextStyle(fontSize: 23),
          ),

          const SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const EditProfile(),
                  ),
                );

                if (result != null) {
                  setState(() {
                    _image = result;
                  });
                }
              },
              child: Row(
                children: [
                  const Icon(
                    Icons.person,
                    color: AppColors.greenColor,
                    size: 25,
                  ),
                  const SizedBox(width: 20),
                  Text(
                    "edit_profile".tr(),
                    style: const TextStyle(fontSize: 17),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const AppInfo(),
                  ),
                );
              },
              child: Row(
                children: [
                  const Icon(
                    Icons.info_outline,
                    color: AppColors.greenColor,
                    size: 25,
                  ),
                  const SizedBox(width: 20),
                  Text(
                    "app_info".tr(),
                    style: const TextStyle(fontSize: 17),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const Settings(),
                  ),
                );
              },
              child: Row(
                children: [
                  const Icon(
                    Icons.settings,
                    color: AppColors.greenColor,
                    size: 25,
                  ),
                  const SizedBox(width: 20),
                  Text(
                    "settings".tr(),
                    style: const TextStyle(fontSize: 17),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Icon(
                  Icons.logout,
                  color: AppColors.greenColor,
                  size: 25,
                ),
                const SizedBox(width: 20),
                Text(
                  "log_out".tr(),
                  style: const TextStyle(fontSize: 17),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}