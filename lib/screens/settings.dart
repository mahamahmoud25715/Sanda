import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sanad_app/core/colors.dart';
import 'package:sanad_app/core/theme_controller.dart';
import 'package:sanad_app/core/language_controller.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = context.watch<ThemeController>();
    final langController = context.watch<LanguageController>();

    return Scaffold(
      appBar: AppBar(
        title: Text("settings".tr()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            // 🌙 Dark Mode
            SwitchListTile(
              title: Text("dark_mode".tr()),
              secondary: const Icon(
                Icons.dark_mode,
                color: AppColors.greenColor,
              ),
              value: themeController.isDark,
              onChanged: (value) {
                context.read<ThemeController>().toggleTheme(value);
              },
            ),

            const SizedBox(height: 20),

            // 🌍 Language
            ListTile(
              title: Text("language".tr()),
              leading: const Icon(
                Icons.language,
                color: AppColors.greenColor,
              ),
              trailing: DropdownButton<String>(
                value: langController.lang,
                items: const [
                  DropdownMenuItem(
                    value: "ar",
                    child: Text("Arabic"),
                  ),
                  DropdownMenuItem(
                    value: "en",
                    child: Text("English"),
                  ),
                ],
                onChanged: (value) {
                  context
                      .read<LanguageController>()
                      .changeLang(context, value!);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}