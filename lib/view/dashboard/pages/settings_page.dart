import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:talimger/view/widgets/app_color.dart';
import 'package:talimger/view/widgets/screen_size.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Widget _settingsProfileItem({
    Widget? icon,
    String? name,
    String? email,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        width: getScreenWidth(context),
        padding: EdgeInsets.symmetric(
          horizontal: 23,
          vertical: 16,
        ),
        decoration: BoxDecoration(
          color: AppColor.f6f8fa,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                icon ??
                    CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 25,
                    ),
                SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 170,
                      child: Text(
                        name ?? "Title",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 170,
                      child: Text(
                        email ?? "Title",
                        // textWidthBasis: TextWidthBasis.parent,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          color: AppColor.color687182,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Icon(
              Icons.chevron_right,
              size: 35,
              color: AppColor.color687182,
            ),
          ],
        ),
      ),
    );
  }

  Widget _settingsItem({
    @required String? iconPath,
    String? title,
    bool isLogOut = false,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        width: getScreenWidth(context),
        padding: EdgeInsets.symmetric(
          horizontal: 23,
          vertical: 16,
        ),
        decoration: BoxDecoration(
          color: AppColor.f6f8fa,
          borderRadius: BorderRadius.circular(15),
        ),
        margin: EdgeInsets.only(bottom: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  iconPath ?? '',
                  width: 50,
                  height: 50,
                ),
                SizedBox(
                  width: 16,
                ),
                Text(
                  title ?? "Title",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            !isLogOut
                ? Icon(
                    Icons.chevron_right,
                    size: 35,
                    color: AppColor.color687182,
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _settingsProfileItem(
                icon: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://plus.unsplash.com/premium_photo-1671656349322-41de944d259b?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                  radius: 25,
                ),
                name: 'Almabek Zhasaral',
                email: 'thunderccloud@gmail.com',
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                'Аккаунт',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              _settingsItem(
                iconPath: 'assets/svg/settings-language.svg',
                title: 'Язык',
              ),
              _settingsItem(
                iconPath: 'assets/svg/settings-logout.svg',
                title: 'Правила использования',
              ),
              _settingsItem(
                iconPath: 'assets/svg/settings-pap.svg',
                title: 'Выйти',
                isLogOut: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
