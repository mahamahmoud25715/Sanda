import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sanad1_app/core/colors.dart';

class AppInfo extends StatefulWidget {
  const AppInfo({super.key});

  @override
  State<AppInfo> createState() => _AppInfoState();
}

class _AppInfoState extends State<AppInfo> {
  @override
  void initState() {
    super.initState();
    getAppInfo();
  }

  String appVersion = "";
  String buildNumber = "";

  Future<void> getAppInfo() async {
    final info = await PackageInfo.fromPlatform();

    setState(() {
      appVersion = info.version;
      buildNumber = info.buildNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("app_info"),
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

      body: 
      ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Card(
              color: AppColors.greenColor,
              elevation: 4,
              
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                
              ),
              
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                     Text("Sanad_App".tr(), style: TextStyle(fontSize: 19)),
                    const SizedBox(height: 10),
                    Text(
                      "Version:$appVersion".tr(),
                      style: const TextStyle(fontSize: 19),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "build_Number:$buildNumber",
                      style: const TextStyle(fontSize: 19),
                    ),
                    const SizedBox(height: 10),
                    SvgPicture.asset(
                      "assets/images/sanad_logo.svg",
                      width: 100,
                      height: 100,
                    ),
                    const SizedBox(height: 20),
                    Text("about",
                    style: TextStyle(fontSize: 16,
                   ),)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
