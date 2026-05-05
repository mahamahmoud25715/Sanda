import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sanad_app/core/colors.dart';
import 'package:sanad_app/screens/app_info.dart';
import 'package:sanad_app/screens/settings.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  File? _image;

  Future<void> pickProfileImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image =
        await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final image = _image;

    return Scaffold(
      appBar: AppBar(
        title: Text("profile".tr()),
        leading: const Icon(
          Icons.person,
          color: AppColors.primaryDark,
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),

          // صورة البروفايل
          Center(
            child: GestureDetector(
              onTap: pickProfileImage,
              child: CircleAvatar(
                radius: 60,
                backgroundColor: AppColors.greyLight,
                backgroundImage:
                    image != null ? FileImage(image) : null,
                child: image == null
                    ? const Icon(
                        Icons.person,
                        size: 60,
                        color: AppColors.primaryDark,
                      )
                    : null,
              ),
            ),
          ),

          const SizedBox(height: 20),

          Text(
            "user_name".tr(),
            style: const TextStyle(fontSize: 23),
          ),

          const SizedBox(height: 20),

          // Edit profile
          Padding(
            padding: const EdgeInsets.all(8.0),
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

          const SizedBox(height: 20),

          // App info
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
                    style:  TextStyle(fontSize: 17),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Settings
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

          // Logout
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